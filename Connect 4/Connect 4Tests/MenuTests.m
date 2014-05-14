//
//  MenuTests.m
//  Connect 4
//
//  Created by John Clem on 5/5/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "MenuTests.h"
#import <KIF/KIFUITestActor.h>

@implementation MenuTests

- (void)testStartGameUI
{
    [tester tapViewWithAccessibilityLabel:@"Player Count Stepper"];
    [tester tapViewWithAccessibilityLabel:@"Player Count Stepper"];
    
    [tester enterText:@"Taylor Potter" intoViewWithAccessibilityLabel:@"Player One Text Field"];
    [tester enterText:@"Reed Sweeney" intoViewWithAccessibilityLabel:@"Player Two Text Field"];
    [tester tapViewWithAccessibilityLabel:@"Start"];

}

@end
