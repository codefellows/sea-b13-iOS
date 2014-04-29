//
//  CFViewController.m
//  collectionview demo week 3
//
//  Created by Brad on 4/24/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFViewController.h"
#import "GLGooglePlusLikeLayout/GLGooglePlusLikeLayout.h"
#import "CFCustomFlowLayout.h"

@interface CFViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IBOutlet CFCustomFlowLayout *stickyHeader;
@property (nonatomic, strong) GLGooglePlusLikeLayout *masonryLayout;

@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    _masonryLayout = [[GLGooglePlusLikeLayout alloc] init];
    CGFloat width = floorf((CGRectGetWidth(self.view.bounds) / 2));
    _masonryLayout.minimumItemSize = CGSizeMake(width, width);

	// Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier;
    if ([collectionView.collectionViewLayout isEqual:_masonryLayout]) {
        identifier = @"SquareCell";
    } else {
        identifier = @"Cell";
    }
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusable = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
    
    reusable.backgroundColor = [UIColor purpleColor];
    
    return reusable;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchLayout:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0: // Sticky Header
            [_collectionView setCollectionViewLayout:_stickyHeader animated:YES];
            break;
        case 1: // Masonry
            [_collectionView setCollectionViewLayout:_masonryLayout animated:YES];
            break;
    }
    
    [_collectionView reloadData];
}


@end
