//
//  CFUsersViewController.h
//  githubtogoCF
//
//  Created by Brad on 4/21/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFBurgerProtocol.h"

@interface CFUsersViewController : UIViewController

@property (nonatomic,unsafe_unretained) id <CFBurgerProtocol> burgerDelegate;

@end
