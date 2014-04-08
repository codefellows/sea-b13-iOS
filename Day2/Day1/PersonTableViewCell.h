//
//  PersonTableViewCell.h
//  Day1
//
//  Created by John Clem on 4/7/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *personImageView;

@property (nonatomic, weak) IBOutlet UILabel *personTextLabel;

@property (nonatomic, weak) Person *person;

@end
