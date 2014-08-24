//
//  MTMemberClient.m
//  xyzApp
//
//  Created by mac on 14-5-19.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTMemberClient.h"

@implementation MTMemberClient

+ (id)sharedClient {
	static dispatch_once_t pred;
    static MTDataAPIClient *shared_instance = nil;
	
    dispatch_once(&pred, ^{
		shared_instance = [[self alloc] init];
        shared_instance.client = [self sharedHTTPClient];
    });
    
	return shared_instance;
}

- (void)getAllMemberWithStoreID:(NSString *)storeid withSuccess:(void(^)(MTMembersMutableArray *memberObject))success
                        failure:(void(^)(NSError *error))failure{
    // 1. get full path.
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_STYLLIST];
    
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:storeid,@"storeid",nil];
    
    // 3. load from server.
    [self.client postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //
        //        NSLog(@"%@",((AFJSONRequestOperation *)operation).responseJSON);
        // 3.1 Parser json dictionary to data object
        MTMemberResultObject *responseData =[MTMemberResultObject objectWithJSON:((AFJSONRequestOperation *)operation).responseJSON];
        
        // 3.2 Check return code and return.
        success(responseData.members);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)modMemberWithObject:(MTMemberObject*)memberOject withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure{
    // 1. get full path.
//    NSString *path = OrderSystem_MODIFYSTYLLIST;
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_MODIFYSTYLLIST];
    
    // 2. create params.
//    memberOject.storeid,@"storeid",
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:memberOject.itemid,@"id",memberOject.name,@"name",memberOject.mobile,@"mobile",memberOject.creditID,@"creditID",memberOject.remark,@"remark",nil];
    
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

- (void)addMemberWithObject:(MTMemberObject*)memberOject withStoreid:(NSString *)storeid withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure{
    // 1. get full path.
    //    NSString *path = OrderSystem_MODIFYSTYLLIST;
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_MODIFYSTYLLIST];
    
    // 2. create params.
    //    memberOject.storeid,@"storeid",
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:storeid,@"storeid",memberOject.name,@"name",memberOject.mobile,@"mobile",memberOject.remark,@"remark",nil];
    
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

- (void)testFunction{
#if 0
    MTMemberObject *memberObject = [[MTMemberObject alloc] init];
    memberObject.storeid = [NSNumber numberWithInt:1];
    memberObject.itemid = [NSNumber numberWithInt:1];
    memberObject.name = @"李四";
    memberObject.mobile = @"1868686868";
    memberObject.remark = @"备注";
    
    [self modMemberWithObject:memberObject withSuccess:^(NSString *resultStr) {
        NSLog(@"%@",resultStr);
    } failure:^(NSError *error) {
        
    }];
#endif
    
}
@end
