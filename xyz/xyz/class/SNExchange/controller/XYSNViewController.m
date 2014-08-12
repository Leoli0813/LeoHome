//
//  XYSNViewController.m
//  xyz
//
//  Created by mac on 14-5-24.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYSNViewController.h"
#import "UIViewController+ShowAlertBox.h"
#import "MTSNCodeClient.h"
#import "UIViewController+ShowLoading.h"

@interface XYSNViewController ()

@end

@implementation XYSNViewController

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
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATIONTOREFRESHAPPINTMENT" object:nil];
    // Do any additional setup after loading the view from its nib.
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_handleNotification:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_handleNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_handleNotification:(NSNotification *)not {
    if ([not.name isEqualToString:UIKeyboardWillShowNotification]) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.center = CGPointMake(self.view.center.x, 280);
            
        }];
    }
    
    if ([not.name isEqualToString:UIKeyboardWillHideNotification]) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.center = CGPointMake(self.view.center.x,375);
            
        }];
    }
    
}

- (IBAction)submitButtonAction:(id)sender {
    
    [self.SNCodeTextField resignFirstResponder];
    
    [self showLoadingText:@"请稍候......"];
    
    [[MTSNCodeClient sharedClient] modSNCodeWithString:self.SNCodeTextField.text withSuccess:^(NSString *resultStr) {
        [self hideLoadingText];
        if ([resultStr isEqualToString:@"SUCCESS"]) {
            [self.messageImageView setImage:[UIImage imageNamed:@"05_snkey_success"]];
            
            [self.backgroundButton setAlpha:1];
            [self.messageImageView setAlpha:1];
        }else{
            [self.messageImageView setImage:[UIImage imageNamed:@"05_snkey_failure"]];
            [self.SNCodeTextField setText:@""];
            [self.backgroundButton setAlpha:1];
            [self.messageImageView setAlpha:1];
            
        }
    } failure:^(NSError *error) {
        [self hideLoadingText];
        [self showAlertWithTitle:@"提示" andBody:@"兑换失败"];
    }];
    
//    [self showAlertWithTitle:@"提示" andBody:@"提交成功"];
}
- (IBAction)backgroundButtonAction:(id)sender {
    
    [self.backgroundButton setAlpha:0];
    [self.messageImageView setAlpha:0];
}

@end
