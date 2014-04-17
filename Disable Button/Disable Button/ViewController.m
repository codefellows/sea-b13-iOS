//
//  ViewController.m
//  Disable Button
//
//  Created by John Clem on 4/15/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *messageField;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(enableOrDisableButton)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];
}

- (void)enableOrDisableButton
{
    if (_messageField.text.length > 0) {
        _sendButton.enabled = YES;
    } else {
        _sendButton.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMessage:(UIButton *)sender {
}

@end
