//
//  XYZDetailViewController.h
//  xyzApp
//
//  Created by mac on 14-5-19.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"
#import "MTMemberObject.h"

@interface XYZDetailViewController : UIViewController
//@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet AsyncImageView *picImage;
@property (strong, nonatomic) MTMemberObject *memberObject;
@property (strong, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIButton *changeIMGButton;

@property (strong, nonatomic) IBOutlet UIView *technologyButtonsView;
@property (strong, nonatomic) IBOutlet UIView *serviceButtonsView;
@property (strong, nonatomic) IBOutlet UIView *conditionsButtonsView;
@property (strong, nonatomic) IBOutlet UIView *appraisalView;
@property (strong, nonatomic) IBOutlet AsyncImageView *memberPicImageView;
@property (strong, nonatomic) IBOutlet AsyncImageView *housePicImageView;

@property (strong, nonatomic) IBOutlet UITextField *inputPhoneTextField;
@property (strong, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UILabel *scoreWillGetLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) IBOutlet UILabel *techLabel;
@property (strong, nonatomic) IBOutlet UILabel *serviceLabel;
@property (strong, nonatomic) IBOutlet UILabel *condLabel;
@property (strong, nonatomic) IBOutlet UIButton *uploadButton;

@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *fixButton;
@property (weak, nonatomic) IBOutlet UITextField *consumeTextField;


@end
