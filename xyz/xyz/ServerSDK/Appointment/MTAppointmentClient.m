//
//  MTAppointmentClient.m
//  xyz
//
//  Created by leo on 14-7-1.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTAppointmentClient.h"

@implementation MTAppointmentClient
+ (id)sharedClient {
	static dispatch_once_t pred;
    static MTDataAPIClient *shared_instance = nil;
	
    dispatch_once(&pred, ^{
		shared_instance = [[self alloc] init];
        shared_instance.client = [self sharedHTTPClient];
    });
    
	return shared_instance;
}

- (void)getAppointmentsWithStoreID:(NSNumber *)storeid withSuccess:(void(^)(MTAppointmentsMutableArray *appointments))success failure:(void(^)(NSError *error))failure{
    // 1. get full path.
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_APPOINTMENT];
    
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:storeid,@"storeid",nil];
    
    // 3. load from server.
    [self.client postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 3.1 Parser json dictionary to data object
        MTAppointmentsResultObject *responseData =[MTAppointmentsResultObject objectWithJSON:((AFJSONRequestOperation *)operation).responseJSON];
        
        // 3.2 Check return code and return.
        success(responseData.appointmentsArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}


- (void)modAppointmentsWithID:(NSNumber *)appid withLevel:(NSNumber *)level withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure{
    // 1. get full path.
    NSString *path = [MTDataAPIClient getFullPathFromPath:OrderSystem_APPOINTMENTUPDATE];
    
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:level,@"level",appid,@"id",nil];
    
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
