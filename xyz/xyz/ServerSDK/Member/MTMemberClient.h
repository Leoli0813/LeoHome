//
//  MTMemberClient.h
//  xyzApp
//
//  Created by mac on 14-5-19.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTDataAPIClient.h"
#import "MTMemberObject.h"

@interface MTMemberClient : MTDataAPIClient

- (void)getAllMemberWithStoreID:(NSString *)storeid withSuccess:(void(^)(MTMembersMutableArray *memberObject))success failure:(void(^)(NSError *error))failure;

- (void)modMemberWithObject:(MTMemberObject*)memberOject withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure;

- (void)addMemberWithObject:(MTMemberObject*)memberOject withStoreid:(NSString *)storeid withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure;

- (void)testFunction;

@end
