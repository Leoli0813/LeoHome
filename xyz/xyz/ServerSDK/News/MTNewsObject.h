//
//  MTNewsObject.h
//  xyz
//
//  Created by mac on 14-5-28.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSMutableArray MTNewsMutableArray;

@interface MTNewsObject : NSObject

@property (nonatomic, strong) NSString *contact;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSNumber *flag;
@property (nonatomic, strong) NSNumber *newid;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end

@interface MTNewsResultObject : NSObject

@property (nonatomic, strong) MTNewsMutableArray *newsArray;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end
