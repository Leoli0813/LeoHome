//
//  UIViewController+ShowAlertBox.h
//  Starbucks Singapore
//
//  Created by Lee, Kenneth on 14/9/12.
//  Copyright (c) 2012 Comwerks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowAlertBox)
- (void) showAlertWithTitle:(NSString *)title andBody:(NSString *)body;
- (void) showCancelConfirmAlertWithTitle:(NSString *)title andBody:(NSString *)body andTag:(int)tag;
@end
