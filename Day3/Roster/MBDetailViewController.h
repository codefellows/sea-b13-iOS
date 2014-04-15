//
//  MBDetailViewController.h
//  Roster
//
//  Created by iC on 4/7/14.
//  Copyright (c) 2014 Mac*Citi, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBTeacher;
@class MBStudent;

@interface MBDetailViewController : UIViewController

@property (weak, nonatomic) MBTeacher *teacher;
@property (weak, nonatomic) MBStudent *student;

@end
