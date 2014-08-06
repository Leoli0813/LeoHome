//
//  XYZMainViewController.m
//  xyzApp
//
//  Created by mac on 14-5-11.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYZMainViewController.h"
#import "MTMemberClient.h"
#import "GMGridView.h"
#import "XYMemberGridViewCell.h"
#import "XYRankingViewController.h"
#import "XYSNViewController.h"
#import "XYAppointmentViewController.h"
#import "XYNewsViewController.h"
#import "XYZDetailViewController.h"

@interface XYZMainViewController ()<GMGridViewActionDelegate,GMGridViewDataSource>

@property (nonatomic, strong) NSMutableArray *members;
@property (nonatomic, strong) XYRankingViewController *rankingViewController;
@property (nonatomic, strong) XYSNViewController *snViewController;
@property (nonatomic, strong) XYAppointmentViewController *appointmentViewController;
@property (nonatomic, strong) XYNewsViewController *newsViewController;
@property (nonatomic, strong) XYZDetailViewController *detailViewController;

@end

@implementation XYZMainViewController

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
    // Do any additional setup after loading the view.
    
    self.membersGridView.actionDelegate = self;
    
    
    self.members = [[NSMutableArray alloc] init];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [[MTMemberClient sharedClient] getAllMemberWithStoreID:[userDefaults objectForKey:@"storeid"] withSuccess:^(NSMutableArray *memberObjects) {
        self.members = memberObjects;
        
        MTMemberObject * addMore = [[MTMemberObject alloc] init];
        
        addMore.name = @"";
        addMore.mobile = @"";
        addMore.picUrl = @"AddMore";
        
        
        [self.members addObject:addMore];
        
        [self.membersGridView reloadData];
    } failure:^(NSError *error) {

    }];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_handleNotification:) name:@"NOTIFICATIONTOREFRESH" object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Private
- (void)_contentViewAddSubView:(UIView *)view {
    
    if (self.contentView.alpha==0) {
        self.contentView.alpha = 1;
    }
    
    if (self.contentView.subviews.count>0) {
        UIView *aView = [self.contentView.subviews objectAtIndex:0];
        
        [UIView animateWithDuration:0.25f animations:^ {
            aView.alpha = 0.0f;
        }completion:^ (BOOL isfin) {
            if (isfin) {
                [aView removeFromSuperview];
                
                view.alpha = 0.0f;
                [self.contentView addSubview:view];
                
                [UIView animateWithDuration:0.25f animations:^ {
                    view.alpha = 1.0f;
                }];
            }
        }];
    }else {
        [self.contentView addSubview:view];
    }
}

- (void)_button:(UIButton *)button setselect:(BOOL)flag {
    [button setSelected:flag];
    
    CGAffineTransform transform;
    
    if (flag) {
        transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    }
    
    else {
        transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    }
    
    [UIView animateWithDuration:0.35f animations:^ {
        button.transform = transform;
    }];
}

- (void)_resetBarButton {
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    
    [UIView animateWithDuration:0.35f animations:^ {
        self.rankingButton.transform = transform;
        self.snExchangeButton.transform = transform;
        self.appointmentButton.transform = transform;
        self.newsButton.transform = transform;
        self.memberButton.transform = transform;
        
        [self.rankingButton setSelected:NO];
        [self.snExchangeButton setSelected:NO];
        [self.appointmentButton setSelected:NO];
        [self.newsButton setSelected:NO];
        [self.memberButton setSelected:NO];
    }];
}

- (void)_handleNotification:(NSNotification *)not{
    if ([not.name isEqualToString:@"NOTIFICATIONTOREFRESH"]) {
        self.members = [[NSMutableArray alloc] init];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [[MTMemberClient sharedClient] getAllMemberWithStoreID:[userDefaults objectForKey:@"storeid"] withSuccess:^(NSMutableArray *memberObjects) {
            self.members = memberObjects;
            
            MTMemberObject * addMore = [[MTMemberObject alloc] init];
            
            addMore.name = @"";
            addMore.mobile = @"";
            addMore.picUrl = @"AddMore";
            
            
            [self.members addObject:addMore];
            
            [self.membersGridView reloadData];
        } failure:^(NSError *error) {
            
        }];
    }
}

#pragma mark IBAction

- (IBAction)pushdetailView:(id)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        if (self.navbarView.frame.origin.x!=0) {
            [self.navbarView setFrame:CGRectMake(0, self.navbarView.frame.origin.y, self.navbarView.frame.size.width, self.navbarView.frame.size.height)];
            [self.pullButton setAlpha:0];
        }
    }];
    
//    [self performSegueWithIdentifier:@"mainDetailSegueId" sender:self];
}
- (IBAction)hidedetailView:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.navbarView setFrame:CGRectMake(-225, self.navbarView.frame.origin.y, self.navbarView.frame.size.width, self.navbarView.frame.size.height)];
        
        [self.pullButton setAlpha:1.0];
    }];
}

- (IBAction)memberDetailButtonAction:(id)sender {
    
//    if ([(UIButton *)sender isSelected]) {
//        return;
//    }
//    
//    [self _resetBarButton];
//    
//    [self _button:sender setselect:YES];
//    //重新加载页面
//    self.detailViewController = nil;
//    self.detailViewController = [[XYZDetailViewController alloc] initWithNibName:@"XYZDetailViewController" bundle:nil];
//    self.detailViewController.memberObject =[self.members objectAtIndex:0];
//    
//    [self _contentViewAddSubView:self.detailViewController.view];
    [self hideButtonAction:nil];
}
- (IBAction)rankingButtonAction:(id)sender {
    
    if ([(UIButton *)sender isSelected]) {
        return;
    }
    
    [self _resetBarButton];
    
    [self _button:sender setselect:YES];
    //重新加载页面
    self.rankingViewController = nil;
    
    if (!self.rankingViewController) {
        self.rankingViewController = [[XYRankingViewController alloc] initWithNibName:@"XYRankingViewController" bundle:nil];
    }
    
    [self _contentViewAddSubView:self.rankingViewController.view];
}
- (IBAction)exchangeButtonAction:(id)sender {

    if ([(UIButton *)sender isSelected]) {
        return;
    }
    
    [self _resetBarButton];
    
    [self _button:sender setselect:YES];
    //重新加载页面
    self.snViewController = nil;
    
    if (!self.snViewController) {
        self.snViewController = [[XYSNViewController alloc] initWithNibName:@"XYSNViewController" bundle:nil];
    }
    
    [self _contentViewAddSubView:self.snViewController.view];
    
}
- (IBAction)appointmentButtonAction:(id)sender {
    
    if ([(UIButton *)sender isSelected]) {
        return;
    }
    
    [self _resetBarButton];
    
    [self _button:sender setselect:YES];
    //重新加载页面
    self.appointmentViewController = nil;
    
    if (!self.appointmentViewController) {
        self.appointmentViewController = [[XYAppointmentViewController alloc] initWithNibName:@"XYAppointmentViewController" bundle:nil];
    }
    
    [self _contentViewAddSubView:self.appointmentViewController.view];
}
- (IBAction)newsButtonAction:(id)sender {
    
    if ([(UIButton *)sender isSelected]) {
        return;
    }
    
    [self _resetBarButton];
    
    [self _button:sender setselect:YES];
    //重新加载页面
    self.newsViewController = nil;
    
    if (!self.newsViewController) {
        self.newsViewController = [[XYNewsViewController alloc] initWithNibName:@"XYNewsViewController" bundle:nil];
    }
    
    [self _contentViewAddSubView:self.newsViewController.view];
}

- (IBAction)hideButtonAction:(id)sender {
    [self hidedetailView:nil];
    [self _resetBarButton];
    [UIView animateWithDuration:0.5 animations:^{
        [self _contentViewAddSubView:nil];
        [self.contentView setAlpha:0];
    }];
}

#pragma mark -- GMGridViewDataSource
- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView {
    return self.members.count;
}

- (CGSize)GMGridView:(GMGridView *)gridView sizeForItemsInInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return  [XYMemberGridViewCell sizeForObject:nil];
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index {
    CGSize size = [self GMGridView:gridView sizeForItemsInInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
    
    XYMemberGridViewCell *cell = (XYMemberGridViewCell *)[gridView dequeueReusableCell];
    
    if (!cell)
    {
        cell = [[XYMemberGridViewCell alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    }
    
    [cell setObject:[self.members objectAtIndex:index]];
    
    return cell;
    
}

#pragma mark -- GMGridViewActionDelegate

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position {
    
    
    MTMemberObject *object = [self.members objectAtIndex:position];
    
//    if (!self.detailViewController) {
        self.detailViewController = [[XYZDetailViewController alloc] initWithNibName:@"XYZDetailViewController" bundle:nil];
//    }
    
    self.detailViewController.memberObject = object;
    
    [self _contentViewAddSubView:self.detailViewController.view];
//
//    ZCProductDetailViewController *vc = [ZCProductDetailViewController detailViewControllerWithObject:object];
//    vc.delegate = self;
//    
//    //    [self.navigationController.view.layer addAnimation:[CAAnimation oglFadeAnimationWithSubtype:kCATransitionFromRight] forKey:nil];
//    
//    [self.navigationController pushViewController:vc animated:NO];
}


@end
