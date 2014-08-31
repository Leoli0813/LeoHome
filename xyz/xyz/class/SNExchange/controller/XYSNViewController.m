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
#import "XYExchangeTableViewCell.h"


@interface XYSNViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) MTExchangesMutableArray *exchangesArray;

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
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATIONTOREFRESHAPPINTMENT" object:nil];
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
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
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [[MTSNCodeClient sharedClient] modSNCodeWithString:self.SNCodeTextField.text withStoreID:[userDefaults objectForKey:@"storeid"] withSuccess:^(NSString *resultStr) {
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
- (IBAction)historylistButtonAction:(id)sender {
    [self showLoadingText:@"正在查询......"];
    
    [self.historyView setFrame:CGRectMake(43+100, 105, 576, 558)];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [[MTSNCodeClient sharedClient] getExchangeWithStoreID:[userDefaults objectForKey:@"storeid"] withSuccess:^(MTExchangesMutableArray *result) {
        [self hideLoadingText];
        
        [UIView animateWithDuration:0.5 animations:^{
            [self.historyView setAlpha:1.0];
            [self.historyView setFrame:CGRectMake(43, 105, 576, 558)];
        }];
        //43,105,576,558
        self.exchangesArray = result;
        [self.historyTableView reloadData];
    } failure:^(NSError *error) {
        
        [self hideLoadingText];
        
        [self showAlertWithTitle:@"提示" andBody:@"查询失败"];
    }];
}
- (IBAction)backExchangeButtonAction:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        [self.historyView setAlpha:0];
        [self.historyView setFrame:CGRectMake(43-100, 105, 576, 558)];
    }];
}
#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.exchangesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellTableIdentifier = @"cellID";
    
    XYExchangeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    
    if (cell == nil) {
        cell = [[XYExchangeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier] ;
    }
    
    [cell setObject:[self.exchangesArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	return [XYExchangeTableViewCell sizeForObject:nil].height;
}


@end
