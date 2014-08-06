//
//  XYAppointmentTableViewCell.m
//  xyz
//
//  Created by mac on 14-5-24.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYAppointmentTableViewCell.h"
#import "MTAppointmentObject.h"
#import "MTDataAPIClient.h"
#import "AsyncImageView.h"
#import "PRPAlertView.h"
#import "MTAppointmentClient.h"

@implementation XYAppointmentTableViewCell

+ (CGSize) sizeForObject:(id)object {
    return CGSizeMake(106 , 186);
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"XYAppointmentInternalView" owner:self options:nil];
        
        self.internalView = [nibArray objectAtIndex:0];
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.internalView];
    }
    
    return self;
}

- (void)setObject:(id)object {
    if ([object isKindOfClass:[MTAppointmentObject class]]) {
        MTAppointmentObject *appointmentObject = (MTAppointmentObject *)object;
        self.internalView.contentTextView.text = [NSString stringWithFormat:@"项目:%@\n备注:%@",appointmentObject.content,appointmentObject.remark];;
        self.internalView.nameLabel.text = appointmentObject.name;
        self.internalView.timeLabel.text = appointmentObject.date;
        
        self.internalView.noReadImageVIew.tag = appointmentObject.appid.intValue;
        
        if ([appointmentObject.read isEqualToString:@"0"]) {
            [self.internalView.noReadImageVIew setAlpha:1.0];
        }else{
            [self.internalView.noReadImageVIew setAlpha:0];
        }
    
        [self.internalView.picImageView setImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",OrderSystem_BASE,appointmentObject.picUrl]]];
//        [self.internalView.picImageView setImageURL:[NSURL URLWithString:appointmentObject.picUrl]];
    }
}

- (void)cancelNoRead:(UIButton *)sender{
    [PRPAlertView showWithTitle:@"提示" message:@"是否标识为已读?" cancelTitle:@"是" cancelBlock:^{
        [UIView animateWithDuration:0.5 animations:^{
            [self.internalView.noReadImageVIew setAlpha:0];
        }];
        [[MTAppointmentClient sharedClient] modAppointmentsWithID:[NSNumber numberWithInt:self.internalView.noReadImageVIew.tag] withLevel:[NSNumber numberWithInt:1] withSuccess:^(NSString *resultStr) {
            
        } failure:^(NSError *error) {
            
        }];
    } otherTitle:@"否" otherBlock:nil];
    
}

@end

@implementation XYAppointmentInternalView


@end
