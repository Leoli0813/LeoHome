//
//  MTRankingObject.m
//  xyz
//
//  Created by mac on 14-5-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTRankingObject.h"
#import "NSDictionary+FQUtil.h"

@implementation MTRankingObject

+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        self.picUrl = [JSON stringForKey:@"url"];
        self.point = [[JSON numberForKey:@"skill"] stringValue];
        self.name = [JSON stringForKey:@"name"];
        
    }
    return self;
}

@end

@implementation MTRankingResultObject

+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        
        NSArray *rankingsData = (NSArray *)[JSON arrayForKey:@"row"];
        NSMutableArray *rankingsList = [MTRankingsMutableArray array];
        
        for(id json in rankingsData) {
            MTRankingObject *obj = [MTRankingObject objectWithJSON:json];
            [rankingsList addObject:obj];
        }
        self.rankings = rankingsList;
        
    }
    return self;
}


@end
