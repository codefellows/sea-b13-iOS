//
//  ViewController.m
//  Categories Demo
//
//  Created by John Clem on 4/15/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+ColorScheme.h"

@interface ViewController ()

@property (nonatomic, strong) UIColor *bgColor;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _bgColor = [UIColor mauveColor];
    [self.view setBackgroundColor:_bgColor];
    
    CGFloat r,g,b,a;
    [_bgColor getRed:&r green:&g blue:&b alpha:&a];
    
    
}

- (IBAction)makeDarker:(id)sender
{
    _bgColor = [_bgColor makeDarker];
    self.view.backgroundColor = _bgColor;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
