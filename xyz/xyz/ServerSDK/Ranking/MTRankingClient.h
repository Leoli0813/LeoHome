//
//  MTRankingClient.h
//  xyz
//
//  Created by mac on 14-5-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTDataAPIClient.h"
#import "MTRankingObject.h"

@interface MTRankingClient : MTDataAPIClient

- (void)getRankingWithStoreID:(NSString *)storeid WithSuccess:(void(^)(MTRankingsMutableArray *rankingArr))success failure:(void(^)(NSError *error))failure;

@end
