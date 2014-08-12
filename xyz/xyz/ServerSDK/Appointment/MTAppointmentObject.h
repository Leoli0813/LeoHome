//
//  MTAppointmentObject.h
//  xyz
//
//  Created by mac on 14-5-29.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSMutableArray MTAppointmentsMutableArray;

@interface MTAppointmentObject : NSObject

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *read;
@property (nonatomic, strong) NSNumber *appid;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *membername;
@property (nonatomic, strong) NSNumber *memberphone;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end

@interface MTAppointmentsResultObject : NSObject

@property (nonatomic, strong) MTAppointmentsMutableArray *appointmentsArray;

+ (id)objectWithJSON:(id)JSON;
- (id)initWithJSON:(id)JSON;

@end