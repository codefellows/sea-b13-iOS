//
//  main.m
//  numbers
//
//  Created by John Clem on 5/6/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        

        NSUInteger bigNumber = 2348273423;
//        NSInteger smallNumber = -358;

        while (true) {
            bigNumber = bigNumber * 10000;
            NSLog(@"Big Number: %lu", bigNumber);
        }

    }
    return 0;
}

