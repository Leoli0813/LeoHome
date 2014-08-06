//
//  XYMemberGridViewCell.m
//  xyz
//
//  Created by mac on 14-5-22.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYMemberGridViewCell.h"
#import "XYMemberInternalView.h"
#import "MTMemberObject.h"
#import "AsyncImageView.h"
#import "MTDataAPIUrl.h"

@implementation XYMemberGridViewCell

+ (CGSize)sizeForObject:(id)object {
    return CGSizeMake(194.0f, 214.0f);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"XYMemberInternalView" owner:self options:nil];
        
        self.internalView = [nibArray objectAtIndex:0];
        
        self.contentView = self.internalView;
        
    }
    
    return self;
}


- (void)setObject:(id)object {
    if ([object isKindOfClass:[MTMemberObject class]]) {
        MTMemberObject *item = (MTMemberObject *)object;
        
//        NSString *imageName = imageNameWithUrlString(item.picUrl);
//        NSString *smallImageName = smallImageNameWithImageName(imageName);
        
        
//        self.internalView.numberLabel.text = item.number;
//        OrderSystem_BASE
//        [self.internalView.picImageView setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",OrderSystem_BASE,item.picUrl]]];
        if ([item.picUrl isEqualToString:@"AddMore"]) {
            [self.internalView.picImageView setImage:[UIImage imageNamed:@"01_main_cellbgmore"]];
        }else{
//            [self.internalView.picImageView setImageURL:[NSURL URLWithString:item.picUrl]];
            [self.internalView.picImageView setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",OrderSystem_BASE,item.picUrl]]];
        }
        
        self.internalView.nameLabel.text = item.name;
    }
}

@end
