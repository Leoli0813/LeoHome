//
//  MTAppointmentClient.h
//  xyz
//
//  Created by leo on 14-7-1.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTDataAPIClient.h"
#import "MTAppointmentObject.h"

@interface MTAppointmentClient : MTDataAPIClient


- (void)getAppointmentsWithStoreID:(NSNumber *)storeid withSuccess:(void(^)(MTAppointmentsMutableArray *appointments))success failure:(void(^)(NSError *error))failure;

- (void)modAppointmentsWithID:(NSNumber *)appid withLevel:(NSNumber *)level withSuccess:(void(^)(NSString *resultStr))success failure:(void(^)(NSError *error))failure;
@end
