//
//  MTExchangeObject.m
//  xyz
//
//  Created by leo on 27/8/14.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTExchangeObject.h"
#import "NSDictionary+FQUtil.h"

@implementation MTExchangeObject
+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        self.usedate = [JSON stringForKey:@"usedate"];
        self.prizetitle = [JSON stringForKey:@"prize_title"];
    }
    
    return self;
}
@end

@implementation MTExchangeObjectResultObject

+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        NSArray *exchangesData = (NSArray *)[JSON arrayForKey:@"row"];
        NSMutableArray *exchangesList = [MTExchangesMutableArray array];
        
        for(id json in exchangesData) {
            MTExchangeObject *obj = [MTExchangeObject objectWithJSON:json];
            [exchangesList addObject:obj];
        }
        self.exchanges = exchangesList;
    }
    
    return self;
}

@end