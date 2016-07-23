//
//  OCTClient+Authentication.m
//  OctoKit
//
//  Created by duanhongjin on 16/7/24.
//  Copyright © 2016年 GitHub. All rights reserved.
//

#import "OCTClient+Authentication.h"
#import "OCTClient+Private.h"

@interface OCTClient ()

// Returns any OAuth client ID previously given to +setClientID:clientSecret:.
+ (NSString *)clientID;

// Returns any OAuth client secret previously given to
// +setClientID:clientSecret:.
+ (NSString *)clientSecret;

@end

@implementation OCTClient (Authentication)

- (RACSignal *)exchangeTokenWithCode:(NSString *)code {
	NSParameterAssert(code.length > 0);
	
	NSString *clientId = [[self class]clientID];
	NSString *clientSecret = [[self class]clientSecret];
	
	NSDictionary *dic = @{@"client_id":clientId, @"client_secret":clientSecret, @"code":code};
	NSMutableURLRequest *request = [self requestWithMethod:@"POST" path:@"" parameters:dic];
	
	request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
	request.URL = [NSURL URLWithString:@"login/oauth/access_token" relativeToURL:[OCTServer dotComServer].baseWebURL];
	
	// The `Accept` string we normally use (where we specify the beta
	// version of the API) doesn't work for this endpoint. Just plain
	// JSON.
	[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
	
	return [[self enqueueRequest:request resultClass:[OCTAccessToken class]]oct_parsedResults];
}

@end
