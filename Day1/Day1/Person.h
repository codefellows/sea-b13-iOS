//
//  Person.h
//  Day1
//
//  Created by John Clem on 4/7/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, weak) NSString *firstName;
/*
 - (void)setFirstName:(NSString *)firstName;
 
 - (NSString *)firstName;
*/
@property (nonatomic, strong) NSString *lastName;

@end
