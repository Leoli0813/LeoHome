//
//  MTAppraiseObject.m
//  xyz
//
//  Created by leo on 14-6-30.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTAppraiseObject.h"
#import "NSDictionary+FQUtil.h"

@implementation MTAppraiseObject

+ (id)objectWithStyllistID:(NSNumber *)styllistid withStoreID:(NSNumber *)storeid withEnvironment:(NSNumber *)environment withService:(NSNumber *)service withSkill:(NSNumber *)skill withConsume:(NSString *)consume withRemarks:(NSString *)remarks{
    return [[self alloc] initWithStyllistID:styllistid withStoreID:storeid withEnvironment:environment withService:service withSkill:skill withConsume:consume withRemarks:remarks];
}

- (id)initWithStyllistID:(NSNumber *)styllistid withStoreID:(NSNumber *)storeid withEnvironment:(NSNumber *)environment withService:(NSNumber *)service withSkill:(NSNumber *)skill withConsume:(NSString *)consume withRemarks:(NSString *)remarks{
    if (self = [super init]) {
        self.styllistID = styllistid;
        self.storeID = storeid;
        self.environment = environment;
        self.service = service;
        self.skill = skill;
        self.consume = consume;
        self.remarks = remarks;
    }
    return self;
}

@end

@implementation MTAppraiseResultObject

+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        self.msg =[JSON stringForKey:@"msg"];
        self.statu =[JSON stringForKey:@"statu"];
        
        NSArray * idlist =  (NSArray *)[JSON arrayForKey:@"row"];
        
        for (id jjson in idlist) {
            self.score = [jjson numberForKey:@"score"];
        }
    }
    
    return self;
}

@end
