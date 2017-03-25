//
//  OCTUsersSearchResult.m
//  OctoKit
//
//  Created by duanhongjin on 2017/3/25.
//  Copyright © 2017年 GitHub. All rights reserved.
//

#import "OCTUsersSearchResult.h"

@implementation OCTUsersSearchResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	NSDictionary *dic = @{@"totalCount": @"total_count",
						  @"incompleteResults": @"incomplete_results",
						  @"users": @"items"};
	
	return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:dic];
}

+ (NSValueTransformer *)usersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:OCTUser.class];
}

@end
