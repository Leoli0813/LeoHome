//
//  UIImageView+LogoPic.m
//  MobileMaket
//
//  Created by mac on 13-8-7.
//  Copyright (c) 2013年 BeeBox. All rights reserved.
//

#import "UIImageView+LogoPic.h"
#import "MTFileManager.h"
#import "MTUserDefault.h"

#define LogoImageViewTag 11110

@implementation UIImageView(LogoPic)

- (void) setLogoPic {
    self.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *image = [MTFileManager getImageFromLocal:imageNameWithUrlString([MTUserDefault logoPicUrl])];
    
    if ([MTFileManager localHaveFile:MT_LOACTIONDATA_LOGO_IMAGENAME]) {
        image = [MTFileManager getImageFromLocal:MT_LOACTIONDATA_LOGO_IMAGENAME];
    }
    
    [self setTag:LogoImageViewTag];
    if (image) {
        [self setImage:image];
        {
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            if(!window) {
                window = [[UIApplication sharedApplication].windows objectAtIndex:0];
            }
            
            UIView *topView = [[[window rootViewController].view subviews] objectAtIndex:0];
            
            for(UIView *view in topView.subviews) {
                if (view.tag == LogoImageViewTag) {
                    [((UIImageView *) view) setImage:image];
                }
            }
        }
    } else {
        [self setImage:[UIImage imageNamed:NSLocalizedStringWithDefaultValue(@"cLoginViewController.logoImage", @"LoginPageTheme", [NSBundle languageBundle], @"common_logo.png", nil)]];
    }
}
- (void) setBigLogoPic {
    self.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImage *image = [MTFileManager getImageFromLocal:imageNameWithUrlString([MTUserDefault logoPicUrl])];
    if ([MTFileManager localHaveFile:MT_LOACTIONDATA_LOGO_IMAGENAME]) {
        image = [MTFileManager getImageFromLocal:MT_LOACTIONDATA_LOGO_IMAGENAME];
    }
    
    if (image) {
        [self setImage:image];
    } else {
        [self setImage:[UIImage imageNamed:@"common_logo"]];
    }
}
@end
