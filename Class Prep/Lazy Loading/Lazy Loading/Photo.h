//
//  Photo.h
//  Lazy Loading
//
//  Created by John Clem on 4/23/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;

- (void)downloadImageWithCompletionBlock:(void (^)())completion;

@end
