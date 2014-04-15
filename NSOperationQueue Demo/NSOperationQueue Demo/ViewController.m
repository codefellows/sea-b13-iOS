//
//  ViewController.m
//  NSOperationQueue Demo
//
//  Created by John Clem on 4/15/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) NSMutableArray *photos;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _photos = [NSMutableArray new];
    
//    NSString *morseString = @"Hello";
//    
//    for (int i=0; i<morseString.length; i++) {
//        NSString *letter = [morseString substringWithRange:NSMakeRange(i, 1)];
//        [self performSelector:@selector(logOutLetter:) withObject:letter afterDelay:0.1*i];
//    }
}

- (void)downloadAndDisplayImageFromURL:(NSURL *)url
{
    NSDate *currentTimestamp = [NSDate date];
    NSData *photoData = [NSData dataWithContentsOfURL:url];
    [_photos addObject:[UIImage imageWithData:photoData]];
    NSDate *timestampAfterDownload = [NSDate date];
    NSTimeInterval downloadTime = [timestampAfterDownload timeIntervalSinceDate:currentTimestamp];
    NSLog(@"Download Took: %f Seconds", downloadTime);
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [_collectionView reloadData];
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSOperationQueue *imageQueue = [NSOperationQueue new];
    
    [imageQueue setMaxConcurrentOperationCount:1];
    
    NSBlockOperation *downloadOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1");
        [self downloadAndDisplayImageFromURL:[NSURL URLWithString:@"http://cognition.happycog.com/m/content/devicelab.png"]];
    }];
    
    [downloadOperation setCompletionBlock:^{
        NSLog(@"Completed First Operation");
    }];
    
    [imageQueue addOperationWithBlock:^{
        NSLog(@"2");
        [self downloadAndDisplayImageFromURL:[NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/en/5/5e/102_Dalmatians_-_Puppies_to_the_Rescue_Coverart.png"]];
    }];
    
    [imageQueue addOperationWithBlock:^{
        NSLog(@"3");
        [self downloadAndDisplayImageFromURL:[NSURL URLWithString:@"http://images.dailytech.com/nimage/Apple_Products_Wide.jpg"]];
    }];

    [imageQueue addOperationWithBlock:^{
        NSLog(@"4");
        [self downloadAndDisplayImageFromURL:[NSURL URLWithString:@"http://hnonline.sk/sites/default/files/thumbnails/article/201404/windows-xp-wallpaper-download-20.jpg"]];
    }];
    
    [imageQueue addOperation:downloadOperation];
    [imageQueue performSelector:@selector(cancelAllOperations) withObject:nil afterDelay:1.0];
}

- (void)logOutLetter:(NSString *)letter
{

    NSLog(@"%@", letter);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                forIndexPath:indexPath];
    cell.photoView.image = _photos[indexPath.row];
    
    return cell;
}

@end
