//
//  OCTClient+Authentication.h
//  OctoKit
//
//  Created by duanhongjin on 16/7/24.
//  Copyright © 2016年 GitHub. All rights reserved.
//

#import <OctoKit/OctoKit.h>

@interface OCTClient (Authentication)

- (RACSignal *)exchangeTokenWithCode:(NSString *)code;

@end
