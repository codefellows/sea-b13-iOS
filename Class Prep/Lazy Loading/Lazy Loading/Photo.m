//
//  Photo.m
//  Lazy Loading
//
//  Created by John Clem on 4/23/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (void)downloadImageWithCompletionBlock:(void (^)())completion;
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageURL = [NSURL URLWithString:_url];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        _image = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion();
        });
    });
}

@end
