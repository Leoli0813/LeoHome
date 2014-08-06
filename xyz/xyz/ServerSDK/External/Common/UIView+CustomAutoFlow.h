//
//  UIView+CustomAutoFlow.h
//  Starbucks Singapore
//
//  Created by Lee, Kenneth on 21/9/12.
//  Copyright (c) 2012 Comwerks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CustomAutoFlow)
- (void) setFrameWidth:(float)width;
- (void) stickBelowView:(UIView*)view withOffset:(float)offset;
@end
