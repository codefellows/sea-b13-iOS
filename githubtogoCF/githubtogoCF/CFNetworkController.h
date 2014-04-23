//
//  CFNetworkController.h
//  githubtogoCF
//
//  Created by Brad on 4/22/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFNetworkController : NSObject

-(void)requestOAuthAccess;
-(void)handleOAuthCallbackWithURL:(NSURL *)url;


@end
