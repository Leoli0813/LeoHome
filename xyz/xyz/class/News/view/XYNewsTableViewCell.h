//
//  XYNewsTableViewCell.h
//  xyz
//
//  Created by mac on 14-5-24.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTNewsObject.h"

@class XYNewsInternalView;
@class AsyncImageView;

@interface XYNewsTableViewCell : UITableViewCell

@property (nonatomic, strong) XYNewsInternalView *internalView;

+ (CGSize)sizeForObject:(id)object;
- (void)setObject:(id)object;

@end

@interface XYNewsInternalView : UIView
@property (strong, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UIImageView *noReadImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *clickButton;

@end
