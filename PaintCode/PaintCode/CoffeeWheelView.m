//
//  CoffeeWheelView.m
//  PaintCode
//
//  Created by John Clem on 4/28/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "CoffeeWheelView.h"

@implementation CoffeeWheelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 0.933 blue: 0.8 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0.933 green: 0.8 blue: 1 alpha: 1];
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 320, 320);
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + 24, CGRectGetMinY(frame) + 27, floor((CGRectGetWidth(frame) - 24) * 0.91216 + 0.5), floor((CGRectGetHeight(frame) - 27) * 0.86689 + 0.5));
    
    
    //// Group
    {
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.00185) + 0.5, CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.00197) + 0.5, floor(CGRectGetWidth(group) * 0.99815) - floor(CGRectGetWidth(group) * 0.00185), floor(CGRectGetHeight(group) * 0.99803) - floor(CGRectGetHeight(group) * 0.00197))];
        [color setFill];
        [ovalPath fill];
        [[UIColor blackColor] setStroke];
        ovalPath.lineWidth = 1;
        [ovalPath stroke];
        
        
        //// Star Drawing
        UIBezierPath* starPath = [UIBezierPath bezierPath];
        [starPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.24444 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.17520 * CGRectGetHeight(group))];
        [starPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.26992 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21369 * CGRectGetHeight(group))];
        [starPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.31313 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.22688 * CGRectGetHeight(group))];
        [starPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.28566 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26387 * CGRectGetHeight(group))];
        [starPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.28690 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31052 * CGRectGetHeight(group))];
        [starPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.24444 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29488 * CGRectGetHeight(group))];
        [starPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.20199 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31052 * CGRectGetHeight(group))];
        [starPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.20323 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26387 * CGRectGetHeight(group))];
        [starPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.17576 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.22688 * CGRectGetHeight(group))];
        [starPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.21897 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.21369 * CGRectGetHeight(group))];
        [starPath closePath];
        [color setFill];
        [starPath fill];
        [[UIColor blackColor] setStroke];
        starPath.lineWidth = 1;
        [starPath stroke];
        
        
        //// Star 2 Drawing
        UIBezierPath* star2Path = [UIBezierPath bezierPath];
        [star2Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.57963 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09646 * CGRectGetHeight(group))];
        [star2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.60314 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.13900 * CGRectGetHeight(group))];
        [star2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.64303 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.15359 * CGRectGetHeight(group))];
        [star2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.61767 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.19446 * CGRectGetHeight(group))];
        [star2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.61882 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.24602 * CGRectGetHeight(group))];
        [star2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.57963 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.22874 * CGRectGetHeight(group))];
        [star2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54044 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.24602 * CGRectGetHeight(group))];
        [star2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54159 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.19446 * CGRectGetHeight(group))];
        [star2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.51623 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.15359 * CGRectGetHeight(group))];
        [star2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.55612 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.13900 * CGRectGetHeight(group))];
        [star2Path closePath];
        [color setFill];
        [star2Path fill];
        [[UIColor blackColor] setStroke];
        star2Path.lineWidth = 1;
        [star2Path stroke];
        
        
        //// Star 3 Drawing
        UIBezierPath* star3Path = [UIBezierPath bezierPath];
        [star3Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.85926 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.52165 * CGRectGetHeight(group))];
        [star3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.87297 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.54596 * CGRectGetHeight(group))];
        [star3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.89624 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.55430 * CGRectGetHeight(group))];
        [star3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.88145 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.57766 * CGRectGetHeight(group))];
        [star3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.88212 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.60712 * CGRectGetHeight(group))];
        [star3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.85926 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.59724 * CGRectGetHeight(group))];
        [star3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.83640 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.60712 * CGRectGetHeight(group))];
        [star3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.83707 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.57766 * CGRectGetHeight(group))];
        [star3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.82227 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.55430 * CGRectGetHeight(group))];
        [star3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.84554 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.54596 * CGRectGetHeight(group))];
        [star3Path closePath];
        [color setFill];
        [star3Path fill];
        [[UIColor blackColor] setStroke];
        star3Path.lineWidth = 1;
        [star3Path stroke];
        
        
        //// Star 4 Drawing
        UIBezierPath* star4Path = [UIBezierPath bezierPath];
        [star4Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.30370 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.69094 * CGRectGetHeight(group))];
        [star4Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.32917 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.74058 * CGRectGetHeight(group))];
        [star4Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.37239 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.75759 * CGRectGetHeight(group))];
        [star4Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.34492 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80529 * CGRectGetHeight(group))];
        [star4Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.34615 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.86544 * CGRectGetHeight(group))];
        [star4Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.30370 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.84528 * CGRectGetHeight(group))];
        [star4Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.26125 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.86544 * CGRectGetHeight(group))];
        [star4Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.26249 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80529 * CGRectGetHeight(group))];
        [star4Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.23502 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.75759 * CGRectGetHeight(group))];
        [star4Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.27823 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.74058 * CGRectGetHeight(group))];
        [star4Path closePath];
        [color setFill];
        [star4Path fill];
        [[UIColor blackColor] setStroke];
        star4Path.lineWidth = 1;
        [star4Path stroke];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.26481 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29724 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.56481 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.17520 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.84630 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.56496 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.32037 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.78543 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.26481 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29724 * CGRectGetHeight(group))];
        [bezierPath closePath];
        [color2 setFill];
        [bezierPath fill];
        [[UIColor blackColor] setStroke];
        bezierPath.lineWidth = 1;
        [bezierPath stroke];
    }
    
    
}

@end
