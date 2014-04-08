//
//  ViewController.m
//  Day1
//
//  Created by John Clem on 4/7/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"
#import "PersonTableViewCell.h"
#import "Person.h"
#import "Student.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *people;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    Person *john = [Person new];
    john.firstName = @"John";
    
//    Person *brad = [Person new];
//    brad.firstName = @"Brad";
    
//    _people = [NSMutableArray arrayWithObjects:john, brad, nil];
    
    id brad = [[Student alloc] initWithFirstName:@"Brad" andLastName:@"Johnson"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                                forIndexPath:indexPath];
    
    cell.person = [_people objectAtIndex:indexPath.row];
        
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *selectedPerson = [_people objectAtIndex:indexPath.row];
    
    UIViewController *destinationViewController = [[UIViewController alloc] init];
    
    destinationViewController.view = [[UIView alloc] initWithFrame:self.view.frame];
    
    destinationViewController.view.backgroundColor = [UIColor blueColor];
    
    destinationViewController.navigationItem.title = selectedPerson.firstName;
    
    [self.navigationController pushViewController:destinationViewController animated:YES];
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"showPersonSegue"]) {
//        UIViewController *destinationViewController = segue.destinationViewController;
//        Person *selectedPerson = [_people objectAtIndex:[[_tableView indexPathForSelectedRow] row]];
//        destinationViewController.navigationItem.title = selectedPerson.firstName;
//    }
//}










@end
