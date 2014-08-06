//
//  UIViewController+ShowLoading.h
//  Starbucks Singapore
//
//  Created by Terrence Tee on 9/11/12.
//  Copyright (c) 2012 Comwerks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowLoading)
- (void) showLoadingText;
- (void) showLoadingText:(NSString*)text;
- (void) showLoadingText:(NSString*)text onView:(UIView *)view;
- (void) showShortDurationMessage:(NSString*)text;
- (void) showShortDurationMessage:(NSString*)text withBlock:(void(^)())block;
- (void) hideLoadingText;
- (void) hideLoadingTextOnView:(UIView*)view animated:(BOOL)animated;
@end

@interface UIImagePickerController(Nonrotating)
- (BOOL)shouldAutorotate;
@end

@implementation UIImagePickerController(Nonrotating)

- (BOOL)shouldAutorotate {
    return NO;
}
@end
