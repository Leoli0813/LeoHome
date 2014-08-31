//
//  MTAppointmentObject.m
//  xyz
//
//  Created by mac on 14-5-29.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTAppointmentObject.h"
#import "NSDictionary+FQUtil.h"

@implementation MTAppointmentObject
+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        self.membername = [JSON stringForKey:@"styllist_name"];
        self.memberphone = [JSON numberForKey:@"mobile"];
        self.name = [JSON stringForKey:@"name"];
        self.content = [JSON stringForKey:@"project"];
        self.date = [JSON stringForKey:@"orderdate"];
        self.picUrl = [JSON stringForKey:@"url"];
        self.remark = [JSON stringForKey:@"remark"];
        self.read = [[JSON numberForKey:@"read"] stringValue];
        self.appid = [JSON numberForKey:@"id"] ;
    }
    
    return self;
}
@end

@implementation MTAppointmentsResultObject

+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        
        NSArray *newsData = (NSArray *)[JSON arrayForKey:@"row"];
        NSMutableArray *appointmentsList = [MTAppointmentsMutableArray array];
        
        for(id json in newsData) {
            MTAppointmentObject *obj = [MTAppointmentObject objectWithJSON:json];
            [appointmentsList addObject:obj];
        }
        self.appointmentsArray = appointmentsList;
    }
    return self;
}

@end
