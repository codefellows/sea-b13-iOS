//
//  CFAppDelegate+CoreDataContext.h
//  coredataexample
//
//  Created by Brad on 5/7/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFAppDelegate.h"

@interface CFAppDelegate (CoreDataContext)

-(void)createManagedObjectContext:(void (^)(NSManagedObjectContext *context))completion;


@end
