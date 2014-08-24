//
//  MTMemberObject.h
//  xyzApp
//
//  Created by mac on 14-5-19.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSMutableArray MTMembersMutableArray;

@interface MTMemberObject : NSObject

@property (nonatomic, strong) NSNumber *itemid;
@property (nonatomic, strong) NSNumber *storeid;
@property (nonatomic, strong) NSNumber *technicalPoint;
@property (nonatomic, strong) NSNumber *servicePoint;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *creditID;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end

@interface MTMemberResultObject : NSObject

@property (nonatomic, strong) MTMembersMutableArray *members;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end
