//
//  Person.m
//  Day1
//
//  Created by John Clem on 4/7/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName
{
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
    }
    
    return self;
}

- (void)setFullName:(NSString *)fullName
{
    _fullName = fullName;
}
@end
