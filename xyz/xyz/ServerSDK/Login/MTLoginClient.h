//
//  MTLoginClient.h
//  xyzApp
//
//  Created by mac on 14-5-12.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTDataAPIClient.h"
#import "MTLoginObject.h"
#import "MTMemberObject.h"

@interface MTLoginClient : MTDataAPIClient

- (void)loginWithUser:(NSString *)user
			 password:(NSString *)password
			  success:(void(^)(MTLoginObject *loginObject))success
			  failure:(void(^)(NSError *error))failure;


- (void)postImageWithMemberObject:(MTMemberObject *)memberObject WithImage:(UIImage*)Image success:(void (^)(NSString *SuccessStr))success failure:(void (^)(NSError *error))failure;


@end
