//
//  XYZMainViewController.h
//  xyzApp
//
//  Created by mac on 14-5-11.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GMGridView;
@interface XYZMainViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *navbarView;
@property (strong, nonatomic) IBOutlet UIButton *memberButton;
@property (strong, nonatomic) IBOutlet UIButton *rankingButton;
@property (strong, nonatomic) IBOutlet UIButton *snExchangeButton;
@property (strong, nonatomic) IBOutlet UIButton *appointmentButton;
@property (strong, nonatomic) IBOutlet UIButton *newsButton;


@property (strong, nonatomic) IBOutlet UIButton *pullButton;
@property (strong, nonatomic) IBOutlet GMGridView *membersGridView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end
