//
//  UIView+CustomAutoFlow.m
//  Starbucks Singapore
//
//  Created by Lee, Kenneth on 21/9/12.
//  Copyright (c) 2012 Comwerks. All rights reserved.
//

#import "UIView+CustomAutoFlow.h"

@implementation UIView (CustomAutoFlow)

// This class helps us to append views below multiline labels easily.

//---------------------------------
// Private Functions
//---------------------------------

#pragma mark - Private Functions

//---------------------------------
// Inherited Functions
//---------------------------------

#pragma mark - Inherited Functions

//---------------------------------
// Public Functions
//---------------------------------

#pragma mark - Public Functions

- (void) stickBelowView:(UIView*)view withOffset:(float)offset
{
    if([view isKindOfClass:[UILabel class]])
    {
        UILabel *label = (UILabel *)view;
        // setup label that we want to follow
        label.numberOfLines = 0;
        [label sizeToFit];
    }
    
    if([self isKindOfClass:[UILabel class]])
    {
        UILabel *label = (UILabel *)self;
        // setup label that we want to follow
        label.numberOfLines = 0;
        [label sizeToFit];
    }
    
    CGRect myFrame = self.frame;
    myFrame.origin.y = view.frame.origin.y + view.frame.size.height + offset;
    self.frame = myFrame;
}

- (void) setFrameWidth:(float)width
{
    // this function will set frame width without a long code
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
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
