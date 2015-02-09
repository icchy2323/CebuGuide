//
//  customTableViewCell.h
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/06.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UILabel *myLabel2;

+ (CGFloat)rowHeight;

@end
