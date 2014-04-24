//
//  ViewController.m
//  Lazy Loading
//
//  Created by John Clem on 4/23/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    BOOL lazyLoading;
}
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *photos;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    lazyLoading = YES;
    _photos = [NSMutableArray new];
    
    for (int i=0; i<100; i++) {
        
        Photo *photo = [Photo new];
        photo.title = @"B'Day Cake";
        photo.url = @"http://www.picturesnew.com/media/images/birthday-cake-happy.jpg";

        Photo *altPhoto = [Photo new];
        altPhoto.title = @"Chocolate Cake";
        altPhoto.url = @"http://1.bp.blogspot.com/-zm_J6JTLDig/URuUX6iLQvI/AAAAAAAAAQk/P98xL277OkI/s1600/Birthday-Cake-luxury-225.jpg";

        
        if (i % 2 == 0) {
            [_photos addObject:photo];
        } else {
            [_photos addObject:altPhoto];
        }
    }
    
    [_tableView reloadData];
    
}

- (void)getListOfPhotos
{
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    Photo *photo = [_photos objectAtIndex:indexPath.row];
    
    cell.textLabel.text = photo.title;
    
    if (lazyLoading) {
        if (photo.image) {
            cell.imageView.image = photo.image;
        } else {
            cell.imageView.image = nil;
            [photo downloadImageWithCompletionBlock:^{
                [tableView reloadRowsAtIndexPaths:@[indexPath]
                                 withRowAnimation:UITableViewRowAnimationFade];
            }];
        }        
    } else {
        NSURL *imageURL = [NSURL URLWithString:photo.url];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        photo.image = [UIImage imageWithData:imageData];
        cell.imageView.image = photo.image;
    }
    
    return cell;
}



#pragma mark - UITableViewDelegate


@end
