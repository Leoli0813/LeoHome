//
//  CAAnimation+Transition.h
//  MobileMaket
//
//  Created by 曹 景成 on 13-7-25.
//  Copyright (c) 2013年 BeeBox. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (Transition)

+ (CATransition *)oglFlipAnimationWithSubtype:(NSString *)subType;

+ (CATransition *)oglFadeAnimationWithSubtype:(NSString *)subType;

@end
