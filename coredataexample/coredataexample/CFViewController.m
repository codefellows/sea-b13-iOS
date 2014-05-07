//
//  CFViewController.m
//  coredataexample
//
//  Created by Brad on 5/7/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFViewController.h"
#import "CFAppDelegate+CoreDataContext.h"
#import "Label.h"
#import "CFArtistsViewController.h"

@interface CFViewController () < UITableViewDelegate,UITableViewDataSource>

@property (weak,nonatomic) NSManagedObjectContext *objectContext;
@property (strong,nonatomic) NSArray *labels;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    CFAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    [appDelegate createManagedObjectContext:^(NSManagedObjectContext *context) {
        
        self.objectContext = context;
        
    }];
    
    
}
- (IBAction)seedCoreData:(id)sender {
    
    Label *rapLabel = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.objectContext];
    rapLabel.name = @"Bros and Women 4 Lyfe";
    Label *countryLabel = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.objectContext];
    countryLabel.name = @"Pickup Trucks and Farms";
    Label *popLabel = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.objectContext];
    popLabel.name = @"Lolipopcorn";
    NSError *error;
    
    [self.objectContext save:&error];
    
    if (error)
    {
        NSLog(@"error: %@",error.localizedDescription);
    }
}
- (IBAction)fetchResults:(id)sender {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Label"];
    
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"any artists.genre = %@",@"Awesome"];
    NSError *error;
    
    self.labels = [self.objectContext executeFetchRequest:fetchRequest error:&error];
    
    NSLog(@" count: %lu",(unsigned long)self.labels.count);
    
    [self.tableView reloadData];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"goToArtists"])
    {
        CFArtistsViewController *destinationVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        destinationVC.selectedLabel = self.labels[indexPath.row];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.labels.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"labelCell"];
    
    Label *label = self.labels[indexPath.row];
    cell.textLabel.text = label.name;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
