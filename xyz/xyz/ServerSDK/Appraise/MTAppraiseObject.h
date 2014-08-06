//
//  MTAppraiseObject.h
//  xyz
//
//  Created by leo on 14-6-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTAppraiseObject : NSObject

@property (nonatomic, strong) NSNumber *styllistID;
@property (nonatomic, strong) NSNumber *storeID;
@property (nonatomic, strong) NSNumber *environment;
@property (nonatomic, strong) NSNumber *service;
@property (nonatomic, strong) NSNumber *skill;
@property (nonatomic, strong) NSString *remarks;

+ (id)objectWithStyllistID:(NSNumber *)styllistid withStoreID:(NSNumber *)storeid withEnvironment:(NSNumber *)environment withService:(NSNumber *)service withSkill:(NSNumber *)skill withRemarks:(NSString *)remarks;

- (id)initWithStyllistID:(NSNumber *)styllistid withStoreID:(NSNumber *)storeid withEnvironment:(NSNumber *)environment withService:(NSNumber *)service withSkill:(NSNumber *)skill withRemarks:(NSString *)remarks;

@end

@interface MTAppraiseResultObject : NSObject

@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *statu;
@property (nonatomic, strong) NSNumber *score;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end
