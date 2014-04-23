//
//  CFSearchViewController.m
//  githubtogoCF
//
//  Created by Brad on 4/21/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFSearchViewController.h"
#import "CFAppDelegate.h"

@interface CFSearchViewController () <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate, NSURLSessionDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong,nonatomic) NSMutableArray *arrayOfRepos;

@property (weak,nonatomic) CFAppDelegate *appDelegate;
@property (weak,nonatomic) CFNetworkController *networkController;

@end

@implementation CFSearchViewController

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
    self.appDelegate = [UIApplication sharedApplication].delegate;
    self.networkController = self.appDelegate.networkController;
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.arrayOfRepos = [NSMutableArray new];
    
    [self.networkController requestOAuthAccess];
    
    
    
    
    
//    NSURL *repoSearchURL = [NSURL URLWithString:@"http://10.98.111.37:3000/repos.json"];
//    NSData *repoData = [NSData dataWithContentsOfURL:repoSearchURL];
//    
//    id repoJSON = [NSJSONSerialization JSONObjectWithData:repoData options:NSJSONReadingMutableContainers error:nil];
//    
//    self.arrayOfRepos = repoJSON;
//    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *repo = _arrayOfRepos[indexPath.row];
    NSInteger repoID = [[repo objectForKey:@"id"] integerValue];
    
    NSURL *deleteURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://10.98.111.37:3000/repos/%d.json", repoID]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:deleteURL];
    
    [request setHTTPMethod:@"DELETE"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *deleteTask = [session dataTaskWithRequest:request
                                                  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                      NSLog(@"Response: %@", response);
                                                      if (error) {
                                                          NSLog(@"Error Occurred: %@", error.localizedDescription);
                                                      } else {
                                                          [self.tableView reloadData];
                                                      }
                                                  }];
    
    [deleteTask resume];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)burgerPressed:(id)sender {
    [self.burgerDelegate handleBurgerPressed];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayOfRepos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *repoDictionary = self.arrayOfRepos[indexPath.row];
    
    cell.textLabel.text = repoDictionary[@"name"];
    
    return cell;
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
