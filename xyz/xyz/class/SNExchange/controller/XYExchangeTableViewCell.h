//
//  XYExchangeTableViewCell.h
//  xyz
//
//  Created by leo on 27/8/14.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYExchangeInternalView;

@interface XYExchangeTableViewCell : UITableViewCell

@property (nonatomic, strong) XYExchangeInternalView *internalView;

+ (CGSize)sizeForObject:(id)object;
- (void)setObject:(id)object;

@end

@interface XYExchangeInternalView : UIView

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *somethingLabel;

@end