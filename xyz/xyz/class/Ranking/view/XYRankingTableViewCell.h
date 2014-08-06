//
//  XYRankingTableViewCell.h
//  xyz
//
//  Created by mac on 14-5-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYRankingInternalView;
@class AsyncImageView;

@interface XYRankingTableViewCell : UITableViewCell

@property (nonatomic, strong) XYRankingInternalView *internalView;

+ (CGSize)sizeForObject:(id)object;
- (void)setObject:(id)object;

@end

@interface XYRankingInternalView : UIView
@property (strong, nonatomic) IBOutlet UILabel *rankingLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;
@property (weak, nonatomic) IBOutlet AsyncImageView *picImageView;
@property (strong, nonatomic) IBOutlet UIImageView *yellowLine;


@end
