//
//  MBStudent.h
//  Roster
//
//  Created by iC on 4/7/14.
//  Copyright (c) 2014 Mac*Citi, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBStudent : NSObject

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;

+ (instancetype)studentWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;
- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;

@end
