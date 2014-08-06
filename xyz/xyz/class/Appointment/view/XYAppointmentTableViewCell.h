//
//  XYAppointmentTableViewCell.h
//  xyz
//
//  Created by mac on 14-5-24.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYAppointmentInternalView;
@class AsyncImageView;

@interface XYAppointmentTableViewCell : UITableViewCell

@property (nonatomic, strong) XYAppointmentInternalView *internalView;

+ (CGSize)sizeForObject:(id)object;
- (void)setObject:(id)object;

@end

@interface XYAppointmentInternalView : UIView
@property (strong, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet AsyncImageView *picImageView;
@property (weak, nonatomic) IBOutlet UIImageView *noReadImageVIew;

@end