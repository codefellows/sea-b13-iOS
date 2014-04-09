//
//  MBData.m
//  Roster
//
//  Created by iC on 4/7/14.
//  Copyright (c) 2014 Mac*Citi, LLC. All rights reserved.
//

#import "MBData.h"
#import "MBTeacher.h"
#import "MBStudent.h"

@implementation MBData

+(MBData *)sharedData {
    static dispatch_once_t pred;
    static MBData *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[MBData alloc] init];
        shared.teachers = [[MBData teachersFromPlist] mutableCopy];
        shared.students = [[MBData studentsFromPlist] mutableCopy];
    });
    return shared;
}

+ (NSArray *)teachersFromPlist
{
    NSMutableArray *teacherArray = [NSMutableArray new];
     NSString *plistPath = [[MBData applicationDocumentsDirectory] stringByAppendingPathComponent:@"teacher.plist" ];
     NSString *pathBundle = [[NSBundle mainBundle] pathForResource:@"people" ofType:@"plist"];
    if ([MBData checkForPlistFileInDocs:@"teacher.plist"])
    {
    
        return [NSKeyedUnarchiver unarchiveObjectWithFile:plistPath];

    }
    else
    {
        //load the stuff
        NSDictionary *rootDictionary = [[NSDictionary alloc] initWithContentsOfFile:pathBundle];
        for (NSDictionary *teacher in [rootDictionary objectForKey:@"Teachers"])
        {
            MBTeacher *myTeacher = [MBTeacher teacherWithFirstName:[teacher objectForKey:@"FirstName"] lastName:[teacher objectForKey:@"LastName"]];
            
            [teacherArray addObject:myTeacher];
        }
        
        [NSKeyedArchiver archiveRootObject:teacherArray toFile:plistPath];
        
    }
    return [MBData teachersFromPlist];
}

+ (NSMutableArray *)studentsFromPlist
{
    NSMutableArray *studentArray = [NSMutableArray new];
    NSString *plistPath = [[MBData applicationDocumentsDirectory] stringByAppendingPathComponent:@"student.plist" ];
    NSString *pathBundle = [[NSBundle mainBundle] pathForResource:@"people" ofType:@"plist"];
    if ([MBData checkForPlistFileInDocs:@"student.plist"])
    {
        return [NSKeyedUnarchiver unarchiveObjectWithFile:plistPath];

    }
    else
    {
        //load the stuff
        NSDictionary *rootDictionary = [[NSDictionary alloc] initWithContentsOfFile:pathBundle];
        for (NSDictionary *student in [rootDictionary objectForKey:@"Students"])
        {
            MBStudent *myStudent = [MBStudent studentWithFirstName:[student objectForKey:@"FirstName"] lastName:[student objectForKey:@"LastName"]];
            
            [studentArray addObject:myStudent];
        }
        
        [NSKeyedArchiver archiveRootObject:studentArray toFile:plistPath];
        
    }
    return [MBData studentsFromPlist];
}

+(NSString *)applicationDocumentsDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+(BOOL)checkForPlistFileInDocs:(NSString*)fileName
{
    NSError *error;

    NSFileManager *myManager = [NSFileManager defaultManager];
    
    NSString *pathForPlistInBundle = [[NSBundle mainBundle] pathForResource:@"people" ofType:@"plist"];
    
    NSString *pathForPlistInDocs = [[MBData applicationDocumentsDirectory] stringByAppendingPathComponent:fileName];
    
    return [myManager fileExistsAtPath:pathForPlistInDocs];
   

    //[myManager copyItemAtPath:pathForPlistInBundle toPath:pathForPlistInDocs error:&error];
//    if (error)
//    {
//        NSLog(@" error: %@",error.localizedDescription);
//        NSLog(@"more error: %@",error.debugDescription);
//    }
//    else
//    {
//        NSLog(@" success!!!");
//        return YES;
//        
//    }
    
    return NO;
}

-(void)save
{
      NSString *teacherPlistPath = [[MBData applicationDocumentsDirectory] stringByAppendingPathComponent:@"teacher.plist" ];
    [NSKeyedArchiver archiveRootObject:self.teachers toFile:teacherPlistPath];
    
    NSString *studentPlistPath = [[MBData applicationDocumentsDirectory] stringByAppendingPathComponent:@"student.plist" ];
    [NSKeyedArchiver archiveRootObject:self.students toFile:studentPlistPath];
}



@end
