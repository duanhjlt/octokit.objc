//
//  OCTUsersSearchResult.h
//  OctoKit
//
//  Created by duanhongjin on 2017/3/25.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import <OctoKit/OctoKit.h>

@interface OCTUsersSearchResult : OCTObject

// The total users count of the search results.
@property (assign, nonatomic, readonly) NSUInteger totalCount;

// Indicates whether the results incomplete or not.
@property (assign, nonatomic, readonly, getter = isIncompleteResults) BOOL incompleteResults;

// The user array of the search results.
@property (strong, nonatomic, readonly) NSArray *users;

@end
