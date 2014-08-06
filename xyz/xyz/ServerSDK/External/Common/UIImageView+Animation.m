//
//  UIImageView+Animation.m
//  OrderSystemForZD
//
//  Created by 曹 景成 on 13-5-30.
//  Copyright (c) 2013年 Kings. All rights reserved.
//

#import "UIImageView+Animation.h"

#define TEMP_IMAGEVIEW_GUID 111111

@implementation UIImageView (Animation)

- (void)fullScreenAnimationWithComplete:(void (^)(void))completion{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    
    UIView *topView = [[window subviews] objectAtIndex:0];
    
    for(UIView *view in topView.subviews) {
        if (view.tag == TEMP_IMAGEVIEW_GUID) {
            return;
        }
    }
    
    CGRect rect = [self convertRect:self.frame toView:topView];
    
    UIImageView *tempImageView = [[UIImageView alloc]initWithFrame:rect];
    tempImageView.image = self.image;
    [topView addSubview:tempImageView];
    tempImageView.tag = TEMP_IMAGEVIEW_GUID;
    
    [UIView animateWithDuration:.35f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^ {
        tempImageView.frame = CGRectMake(0, 0, 1024.0f, 768.0f);
    }completion:^(BOOL isfin) {
        if (isfin) {
            completion();
        }
    }];
    
}

- (void)existFullScreenAnimation {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(!window) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    
    UIView *topView = [[window subviews] objectAtIndex:0];
    CGRect rect = [self convertRect:self.frame toView:topView];
    
    UIImageView *tempImageView;
    
    for(UIView *view in topView.subviews) {
        if (view.tag == TEMP_IMAGEVIEW_GUID) {
            tempImageView = (UIImageView *)view;
        }
    }
    
    if (tempImageView) {        
        [UIView animateWithDuration:.35f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^ {
            tempImageView.frame = rect;
        }completion:^(BOOL isfin) {
            if (isfin) {
                [tempImageView removeFromSuperview];
            }
        }];
    }
    
    
}

@end
