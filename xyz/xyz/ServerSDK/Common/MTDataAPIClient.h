//
//  MTDataAPIClient.h
//  OrderSystemForZD
//
//  Created by Jason-景成 on 13-2-25.
//  Copyright (c) 2013年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"
#import "MTDataAPIUrl.h"
#import "AFJSONRequestOperation.h"

@interface MTDataAPIClient : NSObject

@property(nonatomic, strong)AFHTTPClient *client;

+ (id)sharedHTTPClient;
+ (id)sharedClient;
+ (NSString *)getFullPathFromPath:(NSString *)path;
- (NSString *)createUUID;

@end
