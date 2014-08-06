//
//  MTLoginObject.h
//  xyzApp
//
//  Created by mac on 14-5-12.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTLoginObject : NSObject

@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *statu;
@property (nonatomic, strong) NSNumber *itemid;
@property (nonatomic, strong) NSString *storeid;
@property (nonatomic, strong) NSString *sessionid;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end
