//
//  XYNewsTableViewCell.m
//  xyz
//
//  Created by mac on 14-5-24.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYNewsTableViewCell.h"
#import "MTNewsObject.h"
#import "PRPAlertView.h"
#import "MTNewsClient.h"

@implementation XYNewsTableViewCell

+ (CGSize) sizeForObject:(id)object{
    return CGSizeMake(106 , 174);
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"XYNewsInternalView" owner:self options:nil];
        
        self.internalView = [nibArray objectAtIndex:0];
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.internalView];
    }
    
    return self;
}

- (void)setObject:(id)object {
    if ([object isKindOfClass:[MTNewsObject class]]) {
        MTNewsObject *item = (MTNewsObject *)object;
        [self.internalView.dateLabel setText:item.date];
        [self.internalView.contentTextView setText:item.contact];
        self.internalView.clickButton.tag = item.newid.intValue;
        
        if (item.flag) {
            [self.internalView.noReadImageVIew setAlpha:0];
        }
    }
}

- (void)cancelNoRead:(UIButton *)sender{
    [PRPAlertView showWithTitle:@"提示" message:@"是否标识为已读?" cancelTitle:@"是" cancelBlock:^{
        [UIView animateWithDuration:0.5 animations:^{
            [self.internalView.noReadImageVIew setAlpha:0];
        }];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [[MTNewsClient sharedClient] modNewWithUserID:[userDefaults objectForKey:@"userid"]  withNewID:[NSNumber numberWithInt:sender.tag] withSuccess:^(NSString *resultStr) {
            
        } failure:^(NSError *error) {
            
        }];
    } otherTitle:@"否" otherBlock:nil];
    
}

@end

@implementation XYNewsInternalView

@end
