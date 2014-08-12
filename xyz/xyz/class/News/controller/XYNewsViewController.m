//
//  XYNewsViewController.m
//  xyz
//
//  Created by mac on 14-5-24.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYNewsViewController.h"
#import "XYNewsTableViewCell.h"
#import "MTNewsClient.h"
#import "UIViewController+ShowLoading.h"
#import "MTNewsClient.h"
//#import "UITableView+SubviewAdditions.h"

@interface XYNewsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *news;

@end

@implementation XYNewsViewController

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
    
    self.news = [[NSMutableArray alloc] init];
    [[MTNewsClient sharedClient] getNewsWithSuccess:^(NSMutableArray *newsArr) {
        self.news = newsArr;
        
        [self.newsTabelView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATIONTOREFRESHAPPINTMENT" object:nil];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Private
- (void)cancelNoRead:(UIButton *)sender{
    
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.news.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    XYNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[XYNewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        [cell.internalView.clickButton addTarget:cell action:@selector(cancelNoRead:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [cell setObject:[self.news objectAtIndex:indexPath.row]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 0;
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle ==UITableViewCellEditingStyleDelete) {
        [self showLoadingText];
        
//        [[MTAppointmentClient sharedClient] modAppointmentsWithID:currentObject.appid withLevel:[NSNumber numberWithInt:1] withSuccess:^(NSString *resultStr) {
//            
//            [self hideLoadingText];
//            
//            [self.appointmentsArray removeObject:currentObject];
//            
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
//                             withRowAnimation:UITableViewRowAnimationFade];
//        } failure:^(NSError *error) {
//            
//            [self hideLoadingText];
//            
//            [self showAlertWithTitle:@"提示" andBody:@"网络错误"];
//            
//        }];
        
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//        [[MTNewsClient sharedClient] modNewWithUserID:[userDefaults objectForKey:@"userid"]  withNewID:[NSNumber numberWithInteger:sender.tag] withSuccess:^(NSString *resultStr) {
//            
//        } failure:^(NSError *error) {
//            
//        }];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	return [XYNewsTableViewCell sizeForObject:nil].height;
}

@end
