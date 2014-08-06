//
//  XYMemberGridViewCell.h
//  xyz
//
//  Created by mac on 14-5-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "GMGridView.h"

@class XYMemberInternalView;

@interface XYMemberGridViewCell : GMGridViewCell

@property (nonatomic, strong) XYMemberInternalView *internalView;

+ (CGSize)sizeForObject:(id)object;
- (void)setObject:(id)object;

@end
