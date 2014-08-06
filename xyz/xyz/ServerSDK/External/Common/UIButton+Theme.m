//
//  UIButton+Theme.m
//  MobileMaket
//
//  Created by 曹 景成 on 13-8-17.
//  Copyright (c) 2013年 BeeBox. All rights reserved.
//

#import "UIButton+Theme.h"
#import "MTFileManager.h"

@implementation UIButton (Theme)

- (void)setImageName:(NSString *)imageName {
    NSString *n = [NSString stringWithFormat:@"%@_n",imageName];
    NSString *h = [NSString stringWithFormat:@"%@_h",imageName];
    NSString *s = [NSString stringWithFormat:@"%@_h",imageName];
     
    [self setImage:getThemeImage(n) forState:UIControlStateNormal];
    [self setImage:getThemeImage(h) forState:UIControlStateHighlighted];
    [self setImage:getThemeImage(s) forState:UIControlStateSelected];
}

@end
