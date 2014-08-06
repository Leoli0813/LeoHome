//
//  MTDataAPIClient.m
//  OrderSystemForZD
//
//  Created by Jason-景成 on 13-2-25.
//  Copyright (c) 2013年 Jason. All rights reserved.
//

#import "MTDataAPIClient.h"
#import "AFJSONUtilities.h"

@implementation MTDataAPIClient

+ (id)sharedHTTPClient {
    AFHTTPClient *shared_instance = [[self alloc] init];
    shared_instance = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:OrderSystem_BASE_URL]];
    [shared_instance registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [shared_instance setDefaultHeader:@"Accept" value:@"application/json"];
    shared_instance.parameterEncoding = AFJSONParameterEncoding;
    
	return shared_instance;
}

+ (id)sharedClient {
	static dispatch_once_t pred;
    static MTDataAPIClient *shared_instance = nil;
	
    dispatch_once(&pred, ^{
		shared_instance = [[self alloc] init];
        shared_instance.client = [self sharedHTTPClient];
    });
    
	return shared_instance;
}

+ (NSString *)getFullPathFromPath:(NSString *)path {
//    NSString *basePath = OrderSystem_BASE_PATH;
//    NSString *tokenURL = OrderSystem_TOKEN_URL;
//    
//    if ([path isEqualToString:OrderSystem_PATH_LOGIN]) {
//        return [NSString stringWithFormat:@"%@%@",basePath,path];
//    }
//    
//    if (![tokenURL isEqualToString:@"(null)"]) {
//        return [[NSString stringWithFormat:@"%@%@",basePath,path] stringByAppendingString:tokenURL];
//    }else {
//        return [NSString stringWithFormat:@"%@%@",basePath,path];
//    }
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *tokenURL = [userDefaults objectForKey:@"sessionid"];
    
    return [NSString stringWithFormat:@"%@?s=%@",path,tokenURL];
}

- (NSString *)createUUID
{
    // Create universally unique identifier (object)
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    
    // Get the string representation of CFUUID object.
    NSString *uuidStr = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidObject));
    
    // If needed, here is how to get a representation in bytes, returned as a structure
    // typedef struct {
    //   UInt8 byte0;
    //   UInt8 byte1;
    //   ...
    //   UInt8 byte15;
    // } CFUUIDBytes;
//    CFUUIDBytes bytes = CFUUIDGetUUIDBytes(uuidObject);
    
    return uuidStr;
}

@end
