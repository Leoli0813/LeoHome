//
//  CAAnimation+Transition.m
//  MobileMaket
//
//  Created by 曹 景成 on 13-7-25.
//  Copyright (c) 2013年 BeeBox. All rights reserved.
//

#import "CAAnimation+Transition.h"

@implementation CAAnimation (Transition)

+ (CATransition *)oglFlipAnimationWithSubtype:(NSString *)subType {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"oglFlip";
    
    return transition;
}
+ (CATransition *)oglFadeAnimationWithSubtype:(NSString *)subType {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"moveIn";
    transition.subtype = subType;
    
    return transition;
}

@end
