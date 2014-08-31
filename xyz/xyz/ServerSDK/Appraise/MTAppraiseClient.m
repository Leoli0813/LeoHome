//
//  MTAppraiseClient.m
//  xyz
//
//  Created by leo on 14-6-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTAppraiseClient.h"
#import "NSDictionary+FQUtil.h"

@implementation MTAppraiseClient

+ (id)sharedClient {
	static dispatch_once_t pred;
    static MTDataAPIClient *shared_instance = nil;
	
    dispatch_once(&pred, ^{
		shared_instance = [[self alloc] init];
        shared_instance.client = [self sharedHTTPClient];
    });
    
	return shared_instance;
}

- (void)modAppraiseWithObject:(MTAppraiseObject*)appraise withSuccess:(void(^)(MTAppraiseResultObject *resultObject))success failure:(void(^)(NSError *error))failure{
    // 1. get full path.
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_SCORE];
    
    // 2. create params.
    
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:appraise.styllistID,@"styllistid",appraise.storeID,@"storeid",appraise.environment,@"environment",appraise.service,@"service",appraise.skill,@"skill",appraise.consume,@"ammount",appraise.remarks,@"remarks",nil];
    
    // 3. load from server.
    [self.client postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //
        //        NSLog(@"%@",((AFJSONRequestOperation *)operation).responseJSON);
        // 3.1 Parser json dictionary to data object
        
        // 3.2 Check return code and return.
        
        MTAppraiseResultObject *responseData =[MTAppraiseResultObject objectWithJSON:((AFJSONRequestOperation *)operation).responseJSON];
        
        // 3.2 Check return code and return.
        success(responseData);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)getPointWithPhone:(NSNumber *)phone WithStoreID:(NSString *)storeID  withAmmout:(NSString *)ammount withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure{
    // 1. get full path.
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_GETPOINT];
    
    // 2. create params.
    
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:storeID,@"storeid",phone,@"phonenumber",ammount,@"ammount",nil];
    
    // 3. load from server.
    [self.client postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //
        //        NSLog(@"%@",((AFJSONRequestOperation *)operation).responseJSON);
        // 3.1 Parser json dictionary to data object
        
        // 3.2 Check return code and return.
        
        NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:((AFJSONRequestOperation *)operation).responseJSON];
        
        success([resultDic objectForKey:@"statu"]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
