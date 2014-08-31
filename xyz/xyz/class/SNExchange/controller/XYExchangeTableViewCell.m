//
//  XYExchangeTableViewCell.m
//  xyz
//
//  Created by leo on 27/8/14.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "XYExchangeTableViewCell.h"
#import "MTExchangeObject.h"

@implementation XYExchangeTableViewCell

+ (CGSize) sizeForObject:(id)object {
    return CGSizeMake(576 , 59);
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"XYExchangeInternalView" owner:self options:nil];
        
        self.internalView = [nibArray objectAtIndex:0];
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        [self.contentView addSubview:self.internalView];
    }
    
    return self;
}

- (void)setObject:(id)object {
    
    if ([object isKindOfClass:[MTExchangeObject class]]) {
        MTExchangeObject *exchangeObject = (MTExchangeObject *)object;
        
        self.internalView.timeLabel.text =exchangeObject.usedate;
        self.internalView.somethingLabel.text = exchangeObject.prizetitle;
    }
    
}

@end

@implementation XYExchangeInternalView


@end