//
//  ViewController.m
//  Autolayout Programatically
//
//  Created by John Clem on 4/14/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *redView, *blueView, *greenView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _redView    = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 100, 100)];
    _blueView   = [[UIView alloc] initWithFrame:CGRectMake(150, 0, 100, 100)];
    _greenView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];

    _redView.backgroundColor = [UIColor redColor];
    _blueView.backgroundColor = [UIColor blueColor];
    _greenView.backgroundColor = [UIColor greenColor];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-20|-_blueView-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_blueView, _greenView)]];
    
    [self.view addSubview:_redView];
    [self.view addSubview:_blueView];
    [self.view addSubview:_greenView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
