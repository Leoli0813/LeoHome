//
//  MTMemberObject.m
//  xyzApp
//
//  Created by mac on 14-5-19.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTMemberObject.h"
#import "NSDictionary+FQUtil.h"

@implementation MTMemberObject

+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        self.itemid = [JSON numberForKey:@"id"];
        self.storeid = [JSON numberForKey:@"storeid"];
        self.technicalPoint = [JSON numberForKey:@"score1"];
        self.servicePoint = [JSON numberForKey:@"score2"];
        self.remark = [JSON stringForKey:@"remark"];
        self.picUrl = [JSON stringForKey:@"url"];
        self.mobile = [JSON stringForKey:@"mobile"];
        self.name = [JSON stringForKey:@"name"];
        self.creditID = [JSON stringForKey:@"creditID"];
    }
    
    return self;
}

@end

@implementation MTMemberResultObject

+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        
        NSArray *membersData = (NSArray *)[JSON arrayForKey:@"row"];
        NSMutableArray *membersList = [MTMembersMutableArray array];
        
        for(id json in membersData) {
            MTMemberObject *obj = [MTMemberObject objectWithJSON:json];
            [membersList addObject:obj];
        }
        self.members = membersList;
    
    }
    return self;
}


@end
