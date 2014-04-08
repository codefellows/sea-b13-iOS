//
//  Person.h
//  Day1
//
//  Created by John Clem on 4/7/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;

@property (nonatomic, strong) NSString *firstName;

@property (nonatomic, strong) NSString *lastName;

@property (nonatomic, strong) NSString *fullName;

@end
