  //
//  XYRankingViewController.m
//  xyz
//
//  Created by mac on 14-5-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYRankingViewController.h"
#import "XYRankingTableViewCell.h"
#import "MTRankingClient.h"

@interface XYRankingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) MTRankingsMutableArray *rankingArray;

@end

@implementation XYRankingViewController

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
    
    self.rankingArray = [[NSMutableArray alloc] init];
    
//    MTRankingObject *obj1 = [[MTRankingObject alloc] init];
//    obj1.name = @"张三";
//    obj1.point = @"4.5";
//    obj1.picUrl = @"http://yfjbtf.com/res/img/a.jpg";
//    
//    
//    MTRankingObject *obj2 = [[MTRankingObject alloc] init];
//    obj2.name = @"李四";
//    obj2.point = @"4";
//    obj2.picUrl = @"http://yfjbtf.com/res/img/b.jpg";
//    
//    MTRankingObject *obj3 = [[MTRankingObject alloc] init];
//    obj3.name = @"李四";
//    obj3.point = @"4";
//    obj3.picUrl = @"http://yfjbtf.com/res/img/b.jpg";
//    
//    [self.rankingArray addObject:obj1];
//    [self.rankingArray addObject:obj2];
//    [self.rankingArray addObject:obj3];
//    
//    [self.rankingTableView reloadData];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [[MTRankingClient sharedClient] getRankingWithStoreID:[userDefaults objectForKey:@"storeid"] WithSuccess:^(NSMutableArray *rankingArr) {
        self.rankingArray = rankingArr;
        [self.rankingTableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATIONTOREFRESHAPPINTMENT" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.rankingArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = @"";
    if (indexPath.row==0) {
        cellId = @"FristId";
    }else{
        cellId = @"OtherId";
    }

    XYRankingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[XYRankingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] ;
    }
    
    [cell setObject:[self.rankingArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        return [XYRankingTableViewCell sizeForObject:nil].height;
    }
	return [XYRankingTableViewCell sizeForObject:nil].width;
}


@end
