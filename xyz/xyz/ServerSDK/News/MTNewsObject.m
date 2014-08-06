//
//  MTNewsObject.m
//  xyz
//
//  Created by mac on 14-5-28.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTNewsObject.h"
#import "NSDictionary+FQUtil.h"

@implementation MTNewsObject

+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        self.contact = [JSON stringForKey:@"content"];
        self.date = [JSON stringForKey:@"createdate"];
        self.flag = [JSON numberForKey:@"flag"];
        self.newid = [JSON numberForKey:@"id"];
    }
    return self;
}
@end

@implementation MTNewsResultObject

+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        
        NSArray *newsData = (NSArray *)[JSON arrayForKey:@"row"];
        NSMutableArray *newsList = [MTNewsMutableArray array];
        
        for(id json in newsData) {
            MTNewsObject *obj = [MTNewsObject objectWithJSON:json];
            [newsList addObject:obj];
        }
        self.newsArray = newsList;
    }
    return self;
}

@end