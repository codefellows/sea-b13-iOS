//
//  ViewController.m
//  NSURLSession
//
//  Created by John Clem on 4/22/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"
#import "RepoDetailViewController.h"

@interface ViewController () <NSURLSessionDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *repos;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];

    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:nil delegateQueue:nil];

    
    NSURL *reposURL = [NSURL URLWithString:@"http://localhost:3000/repos.json"];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:reposURL
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                _repos = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                                                NSLog(@"%@", _repos);
                                                
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                                    [self.tableView reloadData];
                                                });
                                            }];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [dataTask resume];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _repos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                            forIndexPath:indexPath];
    
    NSDictionary *repo = _repos[indexPath.row];
    
    cell.textLabel.text = repo[@"name"];
    cell.detailTextLabel.text = repo[@"description"];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowRepo"]) {
        RepoDetailViewController *detailVC = segue.destinationViewController;
        detailVC.repo = _repos[[_tableView indexPathForSelectedRow].row];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
