//
//  XYLoginViewController.m
//  xyz
//
//  Created by mac on 14-5-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYLoginViewController.h"
#import "XYZMainViewController.h"
#import "MTLoginClient.h"
#import "MTMemberClient.h"
#import "UIViewController+ShowAlertBox.h"
#import "UIViewController+ShowLoading.h"

@interface XYLoginViewController ()

@property (nonatomic, strong) XYZMainViewController *mainViewController;

@end

@implementation XYLoginViewController

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
    
    self.navigationController.navigationBarHidden = YES;
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_handleNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_handleNotification:) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonAction:(id)sender {
    
//    if ([self.passWordTextField.text isEqualToString:@"admin"]) {
//        self.mainViewController = [[XYZMainViewController alloc]initWithNibName:@"XYZMainViewController" bundle:nil];
//        //
//        self.mainViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        
////        [self presentViewController:self.mainViewController animated:YES completion:nil];
//        [self.navigationController pushViewController:self.mainViewController animated:YES];
//    }else{
//        [self showAlertWithTitle:@"提示" andBody:@"密码错误"];
//    }
    
    [self.passWordTextField resignFirstResponder];
    
    [self showLoadingText:@"请稍候......"];
    
        [[MTLoginClient sharedClient] loginWithUser:self.userNameTextField.text password:self.passWordTextField.text success:^(MTLoginObject *loginObject) {
            
            [self hideLoadingText];
            
            if ([loginObject.statu isEqualToString:@"SUCCESS"]) {
                
                if (loginObject.storeid) {
                    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                    [userDefaults setObject:loginObject.storeid forKey:@"storeid"];
                    [userDefaults setObject:loginObject.itemid forKey:@"userid"];
                    [userDefaults setObject:loginObject.sessionid forKey:@"sessionid"];
                    
                    self.mainViewController = [[XYZMainViewController alloc]initWithNibName:@"XYZMainViewController" bundle:nil];
                    
                    self.mainViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                    
                    [self.navigationController pushViewController:self.mainViewController animated:YES];
                }else{
                    [self showAlertWithTitle:@"提示" andBody:@"你当前没有可以管理的分店"];
                }
                
            }else{
                [self showAlertWithTitle:@"提示" andBody:@"密码错误"];
            }
        } failure:^(NSError *error) {
            
            [self hideLoadingText];
            
            [self.passWordTextField resignFirstResponder];
            
            [self showAlertWithTitle:@"提示" andBody:@"网络错误"];
        }];
    
}

- (IBAction)bgButtonAction:(id)sender {
    [self.userNameTextField resignFirstResponder];
    [self.passWordTextField resignFirstResponder];
}

- (void)_handleNotification:(NSNotification *)not {
    if ([not.name isEqualToString:UIKeyboardWillShowNotification]) {
        [UIView animateWithDuration:0.3 animations:^{
            self.loginView.center = CGPointMake(512.5,300);
            
        }];
    }
    
    if ([not.name isEqualToString:UIKeyboardWillHideNotification]) {
        [UIView animateWithDuration:0.3 animations:^{
            self.loginView.center = CGPointMake(794.5,375);
            
        }];
    }
    
}

@end
