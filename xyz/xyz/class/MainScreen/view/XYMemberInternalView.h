//
//  XYMemberInternalView.h
//  xyz
//
//  Created by mac on 14-5-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AsyncImageView;

@interface XYMemberInternalView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *bgImageView;
@property (strong, nonatomic) IBOutlet AsyncImageView *picImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end
