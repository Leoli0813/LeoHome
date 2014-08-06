//
//  MTRankingObject.h
//  xyz
//
//  Created by mac on 14-5-27.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSMutableArray MTRankingsMutableArray;

@interface MTRankingObject : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *point;
@property (nonatomic, strong) NSString *picUrl;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end

@interface MTRankingResultObject : NSObject

@property (nonatomic, strong) MTRankingsMutableArray *rankings;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end
