//
//  AppDelegate.m
//  NSCollectionClasses
//
//  Created by John Clem on 5/19/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self step1];
    
    [self step2];

    [self step3];
    
    self.window.rootViewController = [UIViewController new];
    self.window.rootViewController.view.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)step1
{
    NSHashTable *hashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];

    NSMutableString *johnClem = [[NSMutableString alloc] initWithFormat:@"John Clem"];
    NSMutableString *bradJohnson = [[NSMutableString alloc] initWithFormat:@"Brad Johnson"];
    
    [hashTable addObject:johnClem];
    [hashTable addObject:bradJohnson];
    [hashTable addObject:@"Brad Johnson"];
    
    NSLog(@"Step 1-1: %@", hashTable);
    
    [bradJohnson appendString:@" is a teacher"];
    [johnClem appendString:@" is a teacher"];
    
    NSLog(@"Step 1-2: %@", hashTable);
    
    bradJohnson = nil;
    johnClem = nil;
    
    NSLog(@"Step 1-3: %@", hashTable);
}

- (void)step2
{
    NSHashTable *hashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
    
    NSMutableString *johnClem = [[NSMutableString alloc] initWithFormat:@"John Clem"];
    
    [hashTable addObject:johnClem];
    [hashTable addObject:@"John Clem"];
    
    NSLog(@"Step 2-1: %@", hashTable);
    
    johnClem = nil;
    
    NSLog(@"Step 2-2: %@", hashTable);
}

- (void)step3
{
    NSHashTable *hashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    
    NSMutableString *johnClem = [[NSMutableString alloc] initWithFormat:@"John Clem"];
    NSString *bradJohnson = @"Brad Johnson";
    
    [hashTable addObject:johnClem];
    [hashTable addObject:bradJohnson];
    
    NSLog(@"Step 3-1: %@", hashTable);
    
    bradJohnson = nil;
    johnClem = nil;
    
    NSLog(@"Step 3-2: %@", hashTable);
}

@end
