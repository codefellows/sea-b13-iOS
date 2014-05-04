//
//  Player.m
//  Connect 4
//
//  Created by John Clem on 5/4/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithColor:(UIColor *)playerColor
{
    if (self = [super init]) {
        self.playerColor = playerColor;
    }
    
    return self;
    
}

@end
