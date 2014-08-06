//
//  NSBundle+Custom.m
//  Starbucks Singapore
//
//  Created by Kaikai Tang on 1/23/13.
//  Copyright (c) 2013 Comwerks. All rights reserved.
//

#import "NSBundle+Custom.h"

@implementation NSBundle (Custom)

+ (NSBundle *)languageBundle {
    NSBundle *bundle = nil;
    [NSBundle mainBundle];
    NSString *lang = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    
    if ([lang isEqualToString:@"en"]) {
        NSString *path = [[ NSBundle mainBundle ] pathForResource:@"en" ofType:@"lproj" ];
        bundle = [NSBundle bundleWithPath:path];
    } else if ([lang isEqualToString:@"zh-Hans"]) {
        NSString *path = [[ NSBundle mainBundle ] pathForResource:@"zh-Hans" ofType:@"lproj" ];
        bundle = [NSBundle bundleWithPath:path];
    } else {
        NSString *path = [[ NSBundle mainBundle ] pathForResource:@"en" ofType:@"lproj" ];
        bundle = [NSBundle bundleWithPath:path];
    }
        
    return bundle;
}

@end
