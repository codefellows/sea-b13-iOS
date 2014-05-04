//
//  Player.h
//  Connect 4
//
//  Created by John Clem on 5/4/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, weak) NSArray *pieces;
@property (nonatomic, assign) UIColor *playerColor;

- (instancetype)initWithColor:(UIColor *)playerColor;

@end
