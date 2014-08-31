//
//  MTExchangeObject.h
//  xyz
//
//  Created by leo on 27/8/14.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSMutableArray MTExchangesMutableArray;

@interface MTExchangeObject : NSObject

@property (nonatomic, strong) NSString *usedate;

@property (nonatomic, strong) NSString *prizetitle;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end

@interface MTExchangeObjectResultObject : NSObject

@property (nonatomic, strong) MTExchangesMutableArray *exchanges;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end
