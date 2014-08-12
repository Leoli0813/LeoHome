//
//  XYZDetailViewController.m
//  xyzApp
//
//  Created by mac on 14-5-19.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYZDetailViewController.h"
#import "UIViewController+ShowLoading.h"
#import "MTLoginClient.h"
#import "UIViewController+ShowAlertBox.h"
#import "MTMemberClient.h"
#import "MTAppraiseClient.h"

@interface XYZDetailViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UIPopoverController *popViewController;
@property (nonatomic, strong) NSArray *viewsArray;

@property (nonatomic, strong) NSNumber *technologyPoint;
@property (nonatomic, strong) NSNumber *servicePoint;
@property (nonatomic, strong) NSNumber *conditionsPoint;

@end

@implementation XYZDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewsArray = [[NSBundle mainBundle]loadNibNamed:@"XYZDetailViewController" owner:self options:nil];
    
//    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_changeImage:)];
//    
//    [self.picImage setUserInteractionEnabled:YES];
//    [self.picImage addGestureRecognizer:tapGestureRecognizer];
    
    if (self.memberObject && ![self.memberObject.picUrl isEqualToString:@"AddMore"]) {
        [self.changeIMGButton setAlpha:1.0];
        self.nameTextField.text = self.memberObject.name;
//        [self.internalView.picImageView setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",OrderSystem_BASE,self.memberObject.picUrl]];
        [self.picImage setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",OrderSystem_BASE,self.memberObject.picUrl]]];
        
        self.picImage.layer.cornerRadius=10;
        self.picImage.layer.borderWidth = 0;
        self.picImage.layer.borderColor = [[UIColor blackColor] CGColor];
        self.picImage.layer.masksToBounds = YES;
        
        self.memberPicImageView.layer.cornerRadius=10;
        self.memberPicImageView.layer.borderWidth = 0;
        self.memberPicImageView.layer.borderColor = [[UIColor blackColor] CGColor];
        self.memberPicImageView.layer.masksToBounds = YES;
        
        self.housePicImageView.layer.cornerRadius=10;
        self.housePicImageView.layer.borderWidth = 0;
        self.housePicImageView.layer.borderColor = [[UIColor blackColor] CGColor];
        self.housePicImageView.layer.masksToBounds = YES;
//        [self.memberPicImageView setImageURL:[NSURL URLWithString:self.memberObject.picUrl]];
//        [self.housePicImageView setImageURL:[NSURL URLWithString:self.memberObject.picUrl]];//houseUrl

//        [self.picImage setImageURL:[NSURL URLWithString:self.memberObject.picUrl]];
//        [self.memberPicImageView setImageURL:[NSURL URLWithString:self.memberObject.picUrl]];
//        [self.housePicImageView setImageURL:[NSURL URLWithString:self.memberObject.picUrl]];//houseUrl

        self.scoreLabel.text = [NSString stringWithFormat:@"%.1f",self.memberObject.technicalPoint.floatValue];
        
        
    }else{
        [self.changeIMGButton setAlpha:0];
        [self.nameTextField setUserInteractionEnabled:YES];
        [self.picImage setImage:[UIImage imageNamed:@"01_main_cellbgmore"]];
        [self.appraisalView setAlpha:0];
        [self.uploadButton setAlpha:1];
        self.scoreLabel.text = @"0.00";
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_handleNotification:) name:@"NOTIFICATIONTOSHOW" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_handleNotification:) name:@"NOTIFICATIONTOSTOP" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Private
- (IBAction)_changeImage:(UIButton *)sender{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.delegate = self;
        [imagePicker setAllowsEditing:NO];
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        self.popViewController = popover;
        [self.popViewController presentPopoverFromRect:sender.frame inView:self.detailView permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"连接到图片库错误"
                              message:@""
                              delegate:nil
                              cancelButtonTitle:@"确定"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)_viewAddSubView:(UIView *)view {
    
    if (self.view.subviews.count>0) {
        UIView *aView = [self.view.subviews objectAtIndex:0];
        
        [UIView animateWithDuration:0.25f animations:^ {
            aView.alpha = 0.0f;
        }completion:^ (BOOL isfin) {
            if (isfin) {
                [aView removeFromSuperview];
                
                view.alpha = 0.0f;
                [self.view addSubview:view];
                
                [UIView animateWithDuration:0.25f animations:^ {
                    view.alpha = 1.0f;
                }];
            }
        }];
    }else {
        [self.view addSubview:view];
    }
}

- (void)_handleNotification:(NSNotification *)not{
    if ([not.name isEqualToString:@"NOTIFICATIONTOSHOW"]) {
        [self showLoadingText:@"正在上传图片"];
    }else if([not.name isEqualToString:@"NOTIFICATIONTOSTOP"]){
        [self hideLoadingText];
    }
}
#pragma mark IBAction
- (IBAction)appraiseButtonAction:(id)sender {
    
//    UIView *view = [self.viewsArray objectAtIndex:1];
//    
//    [view setFrame:CGRectMake(47, 236, view.frame.size.width, view.frame.size.height)];
//    
//    [self _viewAddSubView:view];
}

- (IBAction)submitAppraiseButtonAction:(id)sender {
    
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    MTAppraiseObject *currentObject = [[MTAppraiseObject alloc] initWithStyllistID:self.memberObject.itemid  withStoreID:self.memberObject.storeid withEnvironment:self.conditionsPoint withService:self.servicePoint withSkill:self.technologyPoint withRemarks:self.memberObject.remark];
    
    [[MTAppraiseClient sharedClient] modAppraiseWithObject:currentObject withSuccess:^(MTAppraiseResultObject *resultObject) {
        
        self.scoreLabel.text = resultObject.score.stringValue;
        
        [self.detailView setAlpha:0];
        
        UIView *view = [self.viewsArray objectAtIndex:1];
        
//        [view setFrame:CGRectMake(47, 278, view.frame.size.width, view.frame.size.height)];
        
        [self _viewAddSubView:view];
    } failure:^(NSError *error) {
        [self showAlertWithTitle:@"提示" andBody:@"提交失败"];
    }];
}

- (IBAction)upLoadButtonAction:(id)sender{
    [self showLoadingText];
    self.memberObject.name = self.nameTextField.text;
    self.memberObject.picUrl = @"/upload/addmore.png";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
     
    [[MTMemberClient sharedClient] addMemberWithObject:self.memberObject withStoreid:[userDefaults objectForKey:@"storeid"] withSuccess:^(NSString *resultStr) {
        [self hideLoadingText];
        if ([resultStr isEqualToString:@"SUCCESS"]) {
            [self showAlertWithTitle:@"提示" andBody:@"提交成功"];
            [UIView animateWithDuration:0.5 animations:^{
                [self.view setAlpha:0];
                [self.view.superview setAlpha:0];
                [self.inputPhoneTextField resignFirstResponder];
            } completion:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATIONTOREFRESH" object:nil];
        }else{
            [self showAlertWithTitle:@"提示" andBody:@"提交失败"];
        }
        
    } failure:^(NSError *error) {
        [self hideLoadingText];
        [self showAlertWithTitle:@"提示" andBody:@"提交失败"];
    }];
    
    
}

- (IBAction)finishedButtonAction:(id)sender {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *phonestr = [NSString stringWithFormat:@"%@",self.inputPhoneTextField.text];
    [[MTAppraiseClient sharedClient] getPointWithPhone:[NSNumber numberWithDouble:phonestr.doubleValue]    WithStoreID:[userDefaults objectForKey:@"storeid"] withSuccess:^(NSString *resultStr) {
    
        [self showAlertWithTitle:@"提示" andBody:@"提交成功"];
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.view setAlpha:0];
            [self.view.superview setAlpha:0];
            [self.inputPhoneTextField resignFirstResponder];
        } completion:nil];
        
    } failure:^(NSError *error) {
        
        [self showAlertWithTitle:@"提示" andBody:@"提交失败"];
        
    }];
    
}

- (IBAction)starButtonAction:(UIButton *)sender {
    
    for (UIButton *btn in [sender.superview subviews]) {
        if (btn.tag<=sender.tag) {
            [btn setSelected:YES];
        }else{
            [btn setSelected:NO];
        }
    }
    
    if([sender.superview isEqual:self.technologyButtonsView]) {
       self.technologyPoint = [NSNumber numberWithInt:sender.tag];
        self.techLabel.text = [NSString stringWithFormat:@"%d分",sender.tag];
    }
    if([sender.superview isEqual:self.serviceButtonsView]) {
        self.servicePoint = [NSNumber numberWithInt:sender.tag];
        self.serviceLabel.text = [NSString stringWithFormat:@"%d分",sender.tag];
    }
    if([sender.superview isEqual:self.conditionsButtonsView]) {
        self.conditionsPoint = [NSNumber numberWithInt:sender.tag];
        self.condLabel.text = [NSString stringWithFormat:@"%d分",sender.tag];
    }
    
}

#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    
    [[MTLoginClient sharedClient] postImageWithMemberObject:self.memberObject WithImage:image success:^(NSString *SuccessStr) {
        [self showAlertWithTitle:@"提示" andBody:@"上传成功"];
        [self.picImage setImage:image];
    } failure:^(NSError *error) {
        [self showAlertWithTitle:@"提示" andBody:@"上传失败"];
    }];

    [self.popViewController dismissPopoverAnimated:YES];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
//    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
