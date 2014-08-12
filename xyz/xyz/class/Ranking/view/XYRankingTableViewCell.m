//
//  XYRankingTableViewCell.m
//  xyz
//
//  Created by mac on 14-5-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYRankingTableViewCell.h"
#import "MTRankingObject.h"
#import "AsyncImageView.h"
#import "MTDataAPIUrl.h"

@implementation XYRankingTableViewCell

+ (CGSize) sizeForObject:(id)object {
    return CGSizeMake(106 , 157);
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"XYRankingInternalView" owner:self options:nil];
        
        if ([reuseIdentifier isEqualToString:@"FristId"]) {
            self.internalView = [nibArray objectAtIndex:0];
        }else{
            self.internalView = [nibArray objectAtIndex:1];
        }
        
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.internalView];
    }
    
    return self;
}

- (void)setObject:(id)object {
    
    if ([object isKindOfClass:[MTRankingObject class]]) {
        MTRankingObject *rankingObject = (MTRankingObject *)object;
        
        self.internalView.nameLabel.text =rankingObject.name;
        self.internalView.pointLabel.text = rankingObject.point;
        [self.internalView.picImageView setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",OrderSystem_BASE,rankingObject.picUrl]]];
        
//        [self.internalView.picImageView setImageURL:[NSURL URLWithString:rankingObject.picUrl]];
        double moveleft = 0;
        
        double point = rankingObject.point.doubleValue;
        
        moveleft = 140 - 14*point + (5-(ceil(point/2))) * 11;
        
        [self.internalView.yellowLine setCenter:CGPointMake(self.internalView.yellowLine.center.x - moveleft, self.internalView.yellowLine.center.y)];
    }
    
    
}

@end

@implementation XYRankingInternalView


@end
