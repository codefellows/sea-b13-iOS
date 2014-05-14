//
//  CFArtistsViewController.m
//  coredataexample
//
//  Created by Brad on 5/7/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFArtistsViewController.h"
#import "Artist.h"

@interface CFArtistsViewController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *genreField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) NSArray *artists;

@end

@implementation CFArtistsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.firstNameField.delegate = self;
    self.lastNameField.delegate = self;
    self.genreField.delegate = self;
    
    self.artists = [self.selectedLabel.artists allObjects];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveArtist:(id)sender {
    Artist *newArtist = [NSEntityDescription insertNewObjectForEntityForName:@"Artist" inManagedObjectContext:self.selectedLabel.managedObjectContext];
    newArtist.firstName = self.firstNameField.text;
    newArtist.lastName = self.lastNameField.text;
    newArtist.genre = self.genreField.text;
    newArtist.label = self.selectedLabel;
    
    NSError *error;
    [self.selectedLabel.managedObjectContext save:&error];
    
    self.artists = [self.selectedLabel.artists allObjects];
    [self.tableView reloadData];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell"];
    Artist *artist = self.artists[indexPath.row];
    cell.textLabel.text = artist.firstName;
    return cell;
}



@end
