//
//  UIViewController+ShowAlertBox.m
//  Starbucks Singapore
//
//  Created by Lee, Kenneth on 14/9/12.
//  Copyright (c) 2012 Comwerks. All rights reserved.
//

#import "UIViewController+ShowAlertBox.h"

@implementation UIViewController (ShowAlertBox)
- (void) showAlertWithTitle:(NSString *)title andBody:(NSString *)body
{
    NSString    *showAlertButtonTitle = @"确定";
    UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:title
						  message:body
						  delegate:nil
						  cancelButtonTitle:showAlertButtonTitle
						  otherButtonTitles:nil];
	[alert show];
}

- (void) showCancelConfirmAlertWithTitle:(NSString *)title andBody:(NSString *)body andTag:(int)tag
{
    NSString    *showCancelTitle = @"取消";
    NSString    *showOtherTitle = @"确定";
    
    UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:title
						  message:body
						  delegate:self
						  cancelButtonTitle:showCancelTitle
                          otherButtonTitles:showOtherTitle, nil];
    alert.tag = tag;
	[alert show];
}

@end
