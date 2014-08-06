//
//  MTAppraiseClient.h
//  xyz
//
//  Created by leo on 14-6-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTDataAPIClient.h"
#import "MTAppraiseObject.h"

@interface MTAppraiseClient : MTDataAPIClient

- (void)modAppraiseWithObject:(MTAppraiseObject*)appraise withSuccess:(void(^)(MTAppraiseResultObject *resultObject))success failure:(void(^)(NSError *error))failure;

- (void)getPointWithPhone:(NSNumber *)phone WithStoreID:(NSString *)storeID withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure;


@end
