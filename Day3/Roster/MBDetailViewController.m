//
//  MBDetailViewController.m
//  Roster
//
//  Created by iC on 4/7/14.
//  Copyright (c) 2014 Mac*Citi, LLC. All rights reserved.
//

#import "MBDetailViewController.h"
#import "MBTeacher.h"
#import "MBStudent.h"
#import "MBData.h"

@interface MBDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation MBDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.teacher) {
        self.navigationItem.title = self.teacher.firstName;
        self.firstNameTextField.text = self.teacher.firstName;
        self.teacher.image = [UIImage imageNamed:@"Seattle_Seahawks.jpg"];
    } else {
        self.navigationItem.title = self.student.firstName;
        self.firstNameTextField.text = self.student.firstName;
    }
    
    //self.imageView.image = [UIImage imageNamed:@"Seattle_Seahawks.jpg"];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.student)
    {
        self.student.firstName = self.firstNameTextField.text;
        
    }
    else if (self.teacher)
    {
        self.teacher.firstName = self.firstNameTextField.text;
    }
    NSLog(@" textfield: %@",self.firstNameTextField.text);
    [[MBData sharedData] save];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
