//
//  XYAppointmentViewController.m
//  xyz
//
//  Created by mac on 14-5-24.
//  Copyright (c) 2014年 mac. All rights reserved.
//

//level:状态级别：'0:未读，1：已读，2已处理，3忽略'

#import "XYAppointmentViewController.h"
#import "XYAppointmentTableViewCell.h"
#import "MTAppointmentClient.h"
#import "UIViewController+ShowLoading.h"
#import "UIViewController+ShowAlertBox.h"

@interface XYAppointmentViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *appointmentsArray;
@property (nonatomic, strong) NSMutableArray *appointmentsAllArray;

@end

@implementation XYAppointmentViewController

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
    
    self.appointmentsArray = [[NSMutableArray alloc] init];
    self.appointmentsAllArray = [[NSMutableArray alloc] init];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [[MTAppointmentClient sharedClient] getAppointmentsWithStoreID:[userDefaults objectForKey:@"storeid"] withSuccess:^(NSMutableArray *appointments) {
        
        self.appointmentsAllArray = appointments;
        
        for (MTAppointmentObject *object in self.appointmentsAllArray) {
            
            if ([object.read isEqualToString:@"0"]||[object.read isEqualToString:@"1"]) {
                [self.appointmentsArray addObject:object];
            }
        }
        
        [self.appointmentTableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.appointmentsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    XYAppointmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[XYAppointmentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] ;
        [cell.internalView.clickButton addTarget:cell action:@selector(cancelNoRead:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [cell setObject:[self.appointmentsArray objectAtIndex:indexPath.row]];
    
    if (self.menuView.alpha==1) {
        [UIView animateWithDuration:0.3 animations:^{
            self.menuView.alpha=0;
        }];
    }
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	return [XYAppointmentTableViewCell sizeForObject:nil].height;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.appointmentsArray count]) {
        MTAppointmentObject *currentObject =[self.appointmentsArray objectAtIndex:0];
        if (currentObject.read.intValue==2) {
            return 0;
        }
        return 1;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{//请求数据源提交的插入或删除指定行接收者。
    if (editingStyle ==UITableViewCellEditingStyleDelete) {//如果编辑样式为删除样式
        
        MTAppointmentObject *currentObject =[self.appointmentsArray objectAtIndex:indexPath.row];
        
        if (currentObject.read.intValue==0) {
            
//            self.appointmentsAllArray = [[NSMutableArray alloc] init];
//            
//            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//            [[MTAppointmentClient sharedClient] getAppointmentsWithStoreID:[userDefaults objectForKey:@"storeid"] withSuccess:^(NSMutableArray *appointments) {
//                
//                self.appointmentsAllArray = appointments;
//                
//            } failure:^(NSError *error) {
//                
//            }];
            
            [self showLoadingText];
            
            [[MTAppointmentClient sharedClient] modAppointmentsWithID:currentObject.appid withLevel:[NSNumber numberWithInt:1] withSuccess:^(NSString *resultStr) {
                
                [self hideLoadingText];
                
                [self.appointmentsArray removeObject:currentObject];
                
                [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                                 withRowAnimation:UITableViewRowAnimationFade];
            } failure:^(NSError *error) {
                
                [self hideLoadingText];
                
                [self showAlertWithTitle:@"提示" andBody:@"网络错误"];
                
            }];
        }else if (currentObject.read.intValue==1){
            
//            self.appointmentsAllArray = [[NSMutableArray alloc] init];
//            
//            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//            [[MTAppointmentClient sharedClient] getAppointmentsWithStoreID:[userDefaults objectForKey:@"storeid"] withSuccess:^(NSMutableArray *appointments) {
//                
//                self.appointmentsAllArray = appointments;
//                
//            } failure:^(NSError *error) {
//                
//            }];
            
            [self showLoadingText];
            
            [[MTAppointmentClient sharedClient] modAppointmentsWithID:currentObject.appid withLevel:[NSNumber numberWithInt:2] withSuccess:^(NSString *resultStr) {
                
                [self hideLoadingText];
                
                [self.appointmentsArray removeObject:currentObject];
                
                [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                                 withRowAnimation:UITableViewRowAnimationFade];
            } failure:^(NSError *error) {
                
                [self hideLoadingText];
                
                [self showAlertWithTitle:@"提示" andBody:@"网络错误"];
                
            }];
        }
        
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"标识为已处理";
}

#pragma mark IBAction
- (IBAction)menuButton:(id)sender {
    if (self.menuView.alpha==0) {
        [UIView animateWithDuration:0.3 animations:^{
            self.menuView.alpha=1;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.menuView.alpha=0;
        }];
    }
}

- (IBAction)complateButtonAction:(id)sender {
    self.appointmentsArray = [[NSMutableArray alloc] init];
    self.appointmentsAllArray = [[NSMutableArray alloc] init];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [[MTAppointmentClient sharedClient] getAppointmentsWithStoreID:[userDefaults objectForKey:@"storeid"] withSuccess:^(NSMutableArray *appointments) {
        
        self.appointmentsAllArray = appointments;
        
        for (MTAppointmentObject *object in self.appointmentsAllArray) {
            
            if ([object.read isEqualToString:@"2"]) {
                [self.appointmentsArray addObject:object];
            }
        }
        
        [self.appointmentTableView reloadData];
        [self menuButton:sender];
    } failure:^(NSError *error) {
        
    }];
}
- (IBAction)waitButtonAction:(id)sender {
    self.appointmentsArray = [[NSMutableArray alloc] init];
    self.appointmentsAllArray = [[NSMutableArray alloc] init];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [[MTAppointmentClient sharedClient] getAppointmentsWithStoreID:[userDefaults objectForKey:@"storeid"] withSuccess:^(NSMutableArray *appointments) {
        
        self.appointmentsAllArray = appointments;
        
        for (MTAppointmentObject *object in self.appointmentsAllArray) {
            
            if ([object.read isEqualToString:@"0"]||[object.read isEqualToString:@"1"]) {
                [self.appointmentsArray addObject:object];
            }
        }
        
        [self.appointmentTableView reloadData];
        [self menuButton:sender];
    } failure:^(NSError *error) {
        
    }];
}

@end
