//
//  UIViewController+ShowLoading.m
//  Starbucks Singapore
//
//  Created by Terrence Tee on 9/11/12.
//  Copyright (c) 2012 Comwerks. All rights reserved.
//

#import "UIViewController+ShowLoading.h"
#import "MBProgressHUD.h"
@implementation UIViewController (ShowLoading)

// This category gives a UIViewController ability to show loading message

//---------------------------------
// Private Functions
//---------------------------------

#pragma mark - Private Functions

- (void) delayedCallBackWithBlock:(void (^)(void))block
{
    block();
}

//---------------------------------
// Inherited Functions
//---------------------------------

#pragma mark - Inherited Functions

//---------------------------------
// Public Functions
//---------------------------------

#pragma mark - Public Functions

- (void) showLoadingText:(NSString*)text
{
    // display a nice loading spinner
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    if(hud == nil)
    {
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    hud.labelText = text;
}

- (void) showLoadingText
{
    // if no argument
    // display a standard loading text
    [self showLoadingText:@"Loading..."];
}

- (void) showShortDurationMessage:(NSString*)text
{
    // display a message similar to loading spinner, but we will hide it in a while
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    if(hud == nil)
    {
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    hud.labelText = text;
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:2];
}

- (void) showShortDurationMessage:(NSString*)text withBlock:(void(^)())block
{
    // display a message similar to loading spinner, but we will hide it in a while and callback
    [self showShortDurationMessage:text];
    [self performSelector:@selector(delayedCallBackWithBlock:) withObject:block afterDelay:2];
}

- (void) showLoadingText:(NSString*)text onView:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if(hud == nil)
    {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    hud.labelText = text;
}

- (void) hideLoadingText
{
    // make sure we hide it
    if ([NSThread isMainThread]) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    } else {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
        });
    }
}

- (void) hideLoadingTextOnView:(UIView*)view animated:(BOOL)animated
{
    [MBProgressHUD hideAllHUDsForView:view animated:animated];
}



//---------------------------------
// Delegate Functions
//---------------------------------

#pragma mark - Delegate Functions

//---------------------------------
// Events
//---------------------------------

#pragma mark - Events

//---------------------------------
// System Functions
//---------------------------------

#pragma mark - System Functions

@end
