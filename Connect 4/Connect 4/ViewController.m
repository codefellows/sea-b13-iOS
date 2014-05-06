//
//  ViewController.m
//  Connect 4
//
//  Created by John Clem on 5/4/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *playerCountStepper;
@property (weak, nonatomic) IBOutlet UILabel *playerCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (nonatomic) NSInteger playerCount;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_playerCountStepper setAccessibilityLabel:@"Player Count Stepper"];
}

- (IBAction)changePlayerCount:(UIStepper *)sender
{
    _playerCount = sender.value;
    _playerCountLabel.text = [NSString stringWithFormat:@"%d", _playerCount];
    [_startButton setEnabled:_playerCount];
}

- (IBAction)startGame:(id)sender
{
    if (_playerCount) {
        NSLog(@"Starting Game");
    }
}
@end
