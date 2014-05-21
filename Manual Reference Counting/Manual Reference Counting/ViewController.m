//
//  ViewController.m
//  Manual Reference Counting
//
//  Created by John Clem on 5/21/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *pictures = [[NSMutableArray alloc] init];
    
    for (int i=0; i<1000; i++) {
        // Bad - creates a leak
        NSData *retainedData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gus" ofType:@"jpg"]];
        // correct - returns an autoreleased NSData object
        NSData *autoReleasedData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gus" ofType:@"jpg"]];
        UIImage *newImage = [[[UIImage alloc] initWithData:retainedData] autorelease];
        [pictures addObject:newImage];
    }

    [pictures release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    NSLog(@"Did Received Memory Warning");
}

@end
