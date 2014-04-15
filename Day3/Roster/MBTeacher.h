//
//  MBTeacher.h
//  Roster
//
//  Created by iC on 4/7/14.
//  Copyright (c) 2014 Mac*Citi, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBTeacher : NSObject <NSCoding>

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (strong,nonatomic) UIImage *image;

+ (instancetype)teacherWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;

@end
