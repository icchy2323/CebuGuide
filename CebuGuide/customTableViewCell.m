//
//  customTableViewCell.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/06.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "customTableViewCell.h"

@implementation customTableViewCell

+ (CGFloat)rowHeight
{
    return 60.0f;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
