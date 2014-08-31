//
//  MTSNCodeClient.h
//  xyz
//
//  Created by leo on 14-7-1.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTDataAPIClient.h"
#import "MTExchangeObject.h"

@interface MTSNCodeClient : MTDataAPIClient

- (void)modSNCodeWithString:(NSString *)snCode withStoreID:(NSString *)storeid withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure;

- (void)getExchangeWithStoreID:(NSString *)storeid withSuccess:(void(^)(MTExchangesMutableArray *result))success failure:(void(^)(NSError *error))failure;

@end
