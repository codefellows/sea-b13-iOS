//
//  CFNetworkController.m
//  githubtogoCF
//
//  Created by Brad on 4/22/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "CFNetworkController.h"

#define GITHUB_CLIENT_ID @"cf366f2f13e356021dbb"
#define GITHUB_CLIENT_SECRET @"bbd8370161b6060bd0d62e0925fae9c47fb76108"
#define GITHUB_CALLBACK_URI @"gitauthbrad://git_callback"
#define GITHUB_OAUTH_URL @"https://github.com/login/oauth/authorize?client_id=%@&redirect_uri=%@&scope=%@"


@implementation CFNetworkController

-(void)requestOAuthAccess
{
    NSString *urlString = [NSString stringWithFormat:GITHUB_OAUTH_URL,GITHUB_CLIENT_ID,GITHUB_CALLBACK_URI,@"user,repo"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    
}

-(void)handleOAuthCallbackWithURL:(NSURL *)url
{
    
    NSLog(@" %@",url);
    NSString *code = [self getCodeFromCallBackURL:url];
    NSString *postString = [NSString stringWithFormat:@"client_id=%@&client_secret=%@&code=%@",GITHUB_CLIENT_ID,GITHUB_CLIENT_SECRET,code];
    NSData *postData = [postString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //sessionConfiguration.HTTPAdditionalHeaders = @{@"Authorization:": @"}
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSMutableURLRequest *request = [NSMutableURLRequest new];
    [request setURL:[NSURL URLWithString:@"https://github.com/login/oauth/access_token"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error)
        {
            NSLog(@"error: %@", error.description);
        }
        
        NSLog(@" %@",response.description);
        
        [self convertResponseDataIntoToken:data];

    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
}

-(NSString *)convertResponseDataIntoToken:(NSData*)responseData
{
    NSString *tokenResponse = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    NSArray *tokenComponents = [tokenResponse componentsSeparatedByString:@"&"];
    NSString *accessTokenWithCode = tokenComponents[0];
    NSArray *access_token_array = [accessTokenWithCode componentsSeparatedByString:@"="];
    
    NSLog(@"%@",access_token_array[1]);
    
    return access_token_array[1];
}

-(NSString *)getCodeFromCallBackURL:(NSURL *)callBackURL
{
    NSString *query = [callBackURL query];
    NSLog(@" %@",query);
    NSArray *components = [query componentsSeparatedByString:@"code="];
    
    
    return [components lastObject];
    
}



@end
