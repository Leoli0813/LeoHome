//
//  MTSNCodeClient.m
//  xyz
//
//  Created by leo on 14-7-1.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTSNCodeClient.h"

@implementation MTSNCodeClient

+ (id)sharedClient {
	static dispatch_once_t pred;
    static MTDataAPIClient *shared_instance = nil;
	
    dispatch_once(&pred, ^{
		shared_instance = [[self alloc] init];
        shared_instance.client = [self sharedHTTPClient];
    });
    
	return shared_instance;
}

- (void)modSNCodeWithString:(NSString *)snCode withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure{
    // 1. get full path.
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_SNCODE];
    
    // 2. create params.
    
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:snCode,@"sncode",nil];
    
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
