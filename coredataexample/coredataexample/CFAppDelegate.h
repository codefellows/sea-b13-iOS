//
//  CFAppDelegate.h
//  coredataexample
//
//  Created by Brad on 5/7/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UIManagedDocument *managedDocument;
@property (strong,nonatomic) NSManagedObjectContext *objectContext;

@end
