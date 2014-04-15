//
//  MBViewController.m
//  Roster
//
//  Created by iC on 4/7/14.
//  Copyright (c) 2014 Mac*Citi, LLC. All rights reserved.
//

#import "MBViewController.h"
#import "MBTeacher.h"
#import "MBStudent.h"
#import "MBData.h"

#import "MBDetailViewController.h"

typedef enum : NSUInteger {
    kTeacherSection = 0,
    kStudentSection = 1,
} kSections;

@interface MBViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    switch (section) {
        case kTeacherSection:
            return [[[MBData sharedData] teachers]count];
            break;
        case kStudentSection:
            return [[[MBData sharedData] students]count];
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (indexPath.section == kTeacherSection) {
        MBTeacher *teacher = [[[MBData sharedData] teachers]objectAtIndex:indexPath.row];
        cell.textLabel.text = teacher.firstName;
        if (teacher.image)
        {
            cell.imageView.image = teacher.image;
        }
    } else {
        MBStudent *student = [[[MBData sharedData] students]objectAtIndex:indexPath.row];
        cell.textLabel.text = student.firstName;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 320.0, 20.0)];
    headerView.backgroundColor = [UIColor lightGrayColor];
    
    NSString *headerTitle = nil;
    switch (section) {
        case kTeacherSection:
            headerTitle = @"Teachers";
            break;
        case kStudentSection:
            headerTitle = @"Students";
            break;
        default:
            break;
    }
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(8.0, 0.0, 304.0, 20.0)];
    titleLabel.font = [UIFont systemFontOfSize:14.0];
    titleLabel.text = headerTitle;
    
    [headerView addSubview:titleLabel];
    
    return headerView;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showPerson"])
    {
        MBDetailViewController *destinationVC = segue.destinationViewController;
        if ([self.tableView indexPathForSelectedRow].section == kTeacherSection)
        {
            destinationVC.teacher = [[[MBData sharedData] teachers] objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        }
        else if ([self.tableView indexPathForSelectedRow].section == kStudentSection)
        {
            destinationVC.student = [[[MBData sharedData] students] objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        }

    }
}



@end
