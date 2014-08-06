//
//  UIImageView+Animation.h
//  OrderSystemForZD
//
//  Created by 曹 景成 on 13-5-30.
//  Copyright (c) 2013年 Kings. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Animation)

- (void)fullScreenAnimationWithComplete:(void (^)(void))completion;
- (void)existFullScreenAnimation;

@end
