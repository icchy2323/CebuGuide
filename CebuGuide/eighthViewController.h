//
//  eighthViewController.h
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/09.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface eighthViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView2;
@property (weak, nonatomic) IBOutlet UILabel *myLabel2;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
- (IBAction)tapBtn:(id)sender;
- (IBAction)tapBtn2:(id)sender;

@end