//
//  UIColor+ColorScheme.m
//  Categories Demo
//
//  Created by John Clem on 4/15/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "UIColor+ColorScheme.h"

@implementation UIColor (ColorScheme)

+ (UIColor *)mauveColor
{
    return [UIColor colorWithRed:0.769 green:0.631 blue:0.729 alpha:1];
}

- (UIColor *)makeDarker
{
    CGFloat h,s,b,a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    
    return [UIColor colorWithHue:h saturation:s brightness:b-.15 alpha:a];
}

@end
