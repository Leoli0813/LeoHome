//
//  MTLoginObject.m
//  xyzApp
//
//  Created by mac on 14-5-12.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "MTLoginObject.h"
#import "NSDictionary+FQUtil.h"

@implementation MTLoginObject

+ (id)objectWithJSON:(id)JSON {
    return [[self alloc]initWithJSON:JSON];
}

- (id)initWithJSON:(id)JSON {
    if (self = [super init]) {
        self.msg =[JSON stringForKey:@"msg"];
        self.statu =[JSON stringForKey:@"statu"];
        
        NSArray * idlist =  (NSArray *)[JSON arrayForKey:@"row"];
        
        for (id jjson in idlist) {
            self.storeid = [jjson stringForKey:@"storeid"];
            self.itemid = [jjson numberForKey:@"id"] ;
            self.sessionid =[jjson stringForKey:@"sessionid"];
        }
    }
    
    return self;
}

@end
