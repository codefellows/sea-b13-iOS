//
//  RepoDetailViewController.m
//  NSURLSession
//
//  Created by John Clem on 4/22/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "RepoDetailViewController.h"

@interface RepoDetailViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *descriptionField;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation RepoDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _descriptionField.text = [self.repo valueForKey:@"description"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [_saveButton setAction:@selector(saveChangesToAPI)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _saveButton.enabled = YES;
}

- (void)saveChangesToAPI
{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURL *updateURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:3000/repos/%d.json", [_repo[@"id"] integerValue]]];
    
    [_repo setValue:_descriptionField.text forKey:@"description"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:updateURL];
    
    NSString *params = [NSString stringWithFormat:@"repo[description]=%@", _repo[@"description"]];
    NSData *repoData = [params dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *contentLength = [NSString stringWithFormat:@"%lu", (unsigned long)repoData.length];
    [request setHTTPMethod:@"PATCH"];
    [request setValue:contentLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:repoData];
    
    NSURLSessionDataTask *updateTask = [session dataTaskWithRequest:request
                                                  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                      NSLog(@"PATCH Response: %@", response);
                                                  }];
    
    [updateTask resume];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
