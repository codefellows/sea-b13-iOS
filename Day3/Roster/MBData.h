//
//  MBData.h
//  Roster
//
//  Created by iC on 4/7/14.
//  Copyright (c) 2014 Mac*Citi, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBData : NSObject

+(MBData *)sharedData;

-(void)save;

@property (strong,nonatomic) NSMutableArray *students, *teachers;

@end
