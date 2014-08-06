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

#pragma mark UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	return [XYNewsTableViewCell sizeForObject:nil].height;
}

@end
