//
//  CFViewController.m
//  scrollview demo
//
//  Created by Brad on 4/10/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFViewController.h"
#import "Person.h"

@interface CFViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong,nonatomic) Person *firstPerson;
@property (copy,nonatomic) Person *secondPerson;

@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textField.delegate = self;
    self.scrollView.backgroundColor = [UIColor purpleColor];
    
    self.firstPerson = [Person new];
    self.secondPerson = [Person new];
    
    NSLog(@" %p",self.firstPerson);
    NSLog(@" %p",self.secondPerson);
    
    self.secondPerson = self.firstPerson;
    
    NSLog(@" %@",self.secondPerson);
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    [self.scrollView setContentOffset:CGPointMake(100, self.textField.frame.origin.y - 30) animated:YES];
}

- (IBAction)sliderDidMove:(id)sender {
    
    UISlider *slider = (UISlider *)sender;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
