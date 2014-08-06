//
//  MTNewsClient.h
//  xyz
//
//  Created by mac on 14-5-28.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTDataAPIClient.h"
#import "MTNewsObject.h"

@interface MTNewsClient : MTDataAPIClient

- (void)getNewsWithSuccess:(void(^)(MTNewsMutableArray *newsArr))success failure:(void(^)(NSError *error))failure;

- (void)modNewWithUserID:(NSNumber *)userID withNewID:(NSNumber *)newID withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure;

@end
