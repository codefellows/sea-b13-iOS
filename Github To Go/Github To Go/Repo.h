//
//  Repo.h
//  Github To Go
//
//  Created by John Clem on 4/21/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Repo : NSManagedObject

@property (nonatomic, retain) NSData * html_cache;
@property (nonatomic, retain) NSString * html_url;
@property (nonatomic, retain) NSString * name;

@end
