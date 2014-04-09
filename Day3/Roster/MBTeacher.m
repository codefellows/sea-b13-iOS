//
//  MBTeacher.m
//  Roster
//
//  Created by iC on 4/7/14.
//  Copyright (c) 2014 Mac*Citi, LLC. All rights reserved.
//

#import "MBTeacher.h"

@implementation MBTeacher

+ (instancetype)teacherWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
{
    return [[self alloc]initWithFirstName:firstName lastName:lastName];
}

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.image = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"image"]];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:UIImagePNGRepresentation(self.image) forKey:@"image"];
}

@end
