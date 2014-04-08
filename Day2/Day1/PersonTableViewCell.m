//
//  PersonTableViewCell.m
//  Day1
//
//  Created by John Clem on 4/7/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "PersonTableViewCell.h"

@implementation PersonTableViewCell

- (void)setPerson:(Person *)person
{
    _person = person;
    
    _personTextLabel.text = _person.firstName;
    _personImageView.image = [UIImage imageNamed:@"imageWithStars"];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
