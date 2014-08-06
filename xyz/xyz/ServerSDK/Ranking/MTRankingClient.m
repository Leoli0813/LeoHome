//
//  MTRankingClient.m
//  xyz
//
//  Created by mac on 14-5-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTRankingClient.h"

@implementation MTRankingClient

+ (id)sharedClient {
	static dispatch_once_t pred;
    static MTDataAPIClient *shared_instance = nil;
	
    dispatch_once(&pred, ^{
		shared_instance = [[self alloc] init];
        shared_instance.client = [self sharedHTTPClient];
    });
    
	return shared_instance;
}

- (void)getRankingWithStoreID:(NSString *)storeid WithSuccess:(void(^)(MTRankingsMutableArray *rankingArr))success failure:(void(^)(NSError *error))failure{
    // 1. get full path.
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_RANKING];
    
    // 2. create params.
    //    memberOject.storeid,@"storeid",
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:storeid,@"storeid",nil];
    
    // 3. load from server.
    [self.client postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 3.1 Parser json dictionary to data object
        MTRankingResultObject *responseData =[MTRankingResultObject objectWithJSON:((AFJSONRequestOperation *)operation).responseJSON];
        
        // 3.2 Check return code and return.
        success(responseData.rankings);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}
@end
