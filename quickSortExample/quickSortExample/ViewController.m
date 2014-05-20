//
//  ViewController.m
//  quick sort demo
//
//  Created by Bradley Johnson on 5/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSInteger pivotLocation;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *unsortedArray = [NSMutableArray new];
    [unsortedArray addObject:[NSNumber numberWithInt:24]];
    [unsortedArray addObject:[NSNumber numberWithInt:5]];
    [unsortedArray addObject:[NSNumber numberWithInt:3]];
    [unsortedArray addObject:[NSNumber numberWithInt:35]];
    [unsortedArray addObject:[NSNumber numberWithInt:14]];
    [unsortedArray addObject:[NSNumber numberWithInt:23]];
    [unsortedArray addObject:[NSNumber numberWithInt:19]];
    [unsortedArray addObject:[NSNumber numberWithInt:27]];
    [unsortedArray addObject:[NSNumber numberWithInt:4]];
    [unsortedArray addObject:[NSNumber numberWithInt:2]];
    
    
    [self quickSortArray:unsortedArray withLow:0 andHigh:unsortedArray.count - 1];
    
    NSLog(@" %@",unsortedArray);
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)quickSortArray:(NSMutableArray *)array withLow:(NSInteger)low andHigh:(NSInteger)high
{
    if (low < high)
    {
        self.pivotLocation = [self partitionArray:array withLow:low andHigh:high];
        
        [self quickSortArray:array withLow:low andHigh:self.pivotLocation - 1];
        
        [self quickSortArray:array withLow:self.pivotLocation +1 andHigh:high];
    }
}

-(NSInteger)partitionArray:(NSMutableArray *)array withLow:(NSInteger)low andHigh:(NSInteger)high
{

    int pivotValue = [array[low] intValue];
    int leftWall = low;
    
    for (int i = low; i <= high;i++) //this for loop gets every value less than the pivot value to the left of our leftwall
    {
        if ([array[i] intValue] < pivotValue)
        {
            leftWall++; //counting how many values are less than our pivotValue
            
            [array exchangeObjectAtIndex:i withObjectAtIndex:leftWall]; //Switches out the value at i for the value at leftWall, this way when we do the final exchange after this for loop, leftwall is the pivot (since it switched with low) and low is the final smaller value that was exchanged in the for loop
        }
    }
    
    [array exchangeObjectAtIndex:low withObjectAtIndex:leftWall];
    
    NSLog(@"%d",leftWall);
    
   return leftWall;
}
@end
