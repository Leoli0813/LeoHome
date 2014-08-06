//
//  MTLoginClient.m
//  xyzApp
//
//  Created by mac on 14-5-12.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTLoginClient.h"
#import "AFJSONUtilities.h"

@implementation MTLoginClient

+ (id)sharedClient {
	static dispatch_once_t pred;
    static MTDataAPIClient *shared_instance = nil;
	
    dispatch_once(&pred, ^{
		shared_instance = [[self alloc] init];
        shared_instance.client = [self sharedHTTPClient];
    });
    
	return shared_instance;
}

- (void)loginWithUser:(NSString *)user
			 password:(NSString *)password
			  success:(void(^)(MTLoginObject *loginObject))success
			  failure:(void(^)(NSError *error))failure {
    
    // 1. get full path.
    NSString *path = OrderSystem_BASE_URL;
    
    // 2. create params.
    NSDictionary * params = [NSDictionary dictionaryWithObjectsAndKeys:user,@"username",password,@"password",nil];
    
    // 3. load from server.
    [self.client postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"%@",((AFJSONRequestOperation *)operation).responseJSON);
        // 3.1 Parser json dictionary to data object
        MTLoginObject *responseData =[MTLoginObject objectWithJSON:((AFJSONRequestOperation *)operation).responseJSON];
        
        // 3.2 Check return code and return.
        success(responseData);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}


- (void)postImageWithMemberObject:(MTMemberObject *)memberObject WithImage:(UIImage*)Image success:(void (^)(NSString *SuccessStr))success failure:(void (^)(NSError *error))failure{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATIONTOSHOW" object:nil];
    NSData *data = UIImagePNGRepresentation(Image);
//    NSUInteger dataLegth = data.length;
    // 1. get full path.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *tokenURL = [userDefaults objectForKey:@"sessionid"];
    
    NSString *pathfrist = [NSString stringWithFormat:@"%@?id=%d",OrderSystem_UPLOAD_IMAGE,memberObject.itemid.intValue];
    
    NSString *path = [NSString stringWithFormat:@"%@&s=%@",pathfrist,tokenURL];
    
//    NSString *theImagePath = [[NSBundle mainBundle] pathForResource:@"123" ofType:@"png"];

    NSMutableURLRequest *fileUpRequest = [self.client multipartFormRequestWithMethod:@"POST" path:path parameters:nil constructingBodyWithBlock:^(id formData) {
        //文件
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:theImagePath] name:@"file" error:nil];
        [formData appendPartWithFileData:data name:@"file" fileName:@"file.png" mimeType:@"image/png"];
    }];

    AFHTTPRequestOperation *operation1 = [[AFHTTPRequestOperation alloc]initWithRequest:fileUpRequest];
    
    [operation1 setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
//        startUp.enabled = NO;
//        [startUp setTitle:@"正在上传" forState:UIControlStateNormal];
        CGFloat progress = ((float)totalBytesWritten) / totalBytesExpectedToWrite;
//             [uploadFileProgressView setProgress:progress animated:YES];
        NSLog(@"%f",progress);
     }];

      [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//         startUp.enabled = NO;
//           [startUp setTitle:@"完成" forState:UIControlStateNormal];
     NSLog(@"upload finish ---%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
          [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATIONTOSTOP" object:nil];
          [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATIONTOREFRESH" object:nil];
          success([[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"error %@",error);
             failure(error);
          }];
    
    [operation1 start];
}
@end
