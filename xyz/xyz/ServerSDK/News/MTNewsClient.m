//
//  MTNewsClient.m
//  xyz
//
//  Created by mac on 14-5-28.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTNewsClient.h"

@implementation MTNewsClient
+ (id)sharedClient {
	static dispatch_once_t pred;
    static MTDataAPIClient *shared_instance = nil;
	
    dispatch_once(&pred, ^{
		shared_instance = [[self alloc] init];
        shared_instance.client = [self sharedHTTPClient];
    });
    
	return shared_instance;
}


- (void)getNewsWithSuccess:(void(^)(MTNewsMutableArray *newsArr))success failure:(void(^)(NSError *error))failure{
    // 1. get full path.
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_NEWS];
    
    // 3. load from server.
    [self.client getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 3.1 Parser json dictionary to data object
        MTNewsResultObject *responseData =[MTNewsResultObject objectWithJSON:((AFJSONRequestOperation *)operation).responseJSON];
        
        // 3.2 Check return code and return.
        success(responseData.newsArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}
- (void)modNewWithUserID:(NSNumber *)userID withNewID:(NSNumber *)newID withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure{
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_READNEWS];
    
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:userID,@"userid",newID,@"id",nil];
    
    // 3. load from server.
    [self.client postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 3.1 Parser json dictionary to data object
        NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:((AFJSONRequestOperation *)operation).responseJSON];
        
        success([resultDic objectForKey:@"statu"]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
