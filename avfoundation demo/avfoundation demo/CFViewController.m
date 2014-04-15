//
//  CFViewController.m
//  avfoundation demo
//
//  Created by Brad on 4/15/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface CFViewController ()

@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)turnOn:(id)sender {
    AVCaptureDevice *myDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if ([myDevice hasTorch] && [myDevice hasFlash])
    {
        [myDevice lockForConfiguration:nil];
        [myDevice setTorchMode:AVCaptureTorchModeOn];
        //[myDevice setFlashMode:AVCaptureFlashModeOn];
        [myDevice unlockForConfiguration];
    }
    
}
- (IBAction)turnOff:(id)sender {
    
    AVCaptureDevice *myDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if ([myDevice hasTorch] && [myDevice hasFlash])
    {
        [myDevice lockForConfiguration:nil];
        [myDevice setTorchMode:AVCaptureTorchModeOff];
        //[myDevice setFlashMode:AVCaptureFlashModeOff];
        [myDevice unlockForConfiguration];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
