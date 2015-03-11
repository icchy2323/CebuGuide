//
//  syousaitwoViewController.h
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/18.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface syousaitwoViewController : UIViewController{
    NSArray *_gourmetArray;
    NSArray *_wifiArray;
    int _ListNO;
}

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UILabel *myLabel2;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView2;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView3;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView4;

@property (nonatomic,assign) int selectNum;

@property (nonatomic,strong) NSString *selectType;

@property (nonatomic,strong) NSArray *wifilist;
@property (nonatomic,strong) NSString *wifiString;

@property (nonatomic,strong) NSArray *gourmetlist;
@property (nonatomic,strong) NSString *gourmetString;


- (IBAction)tapBtn:(id)sender;
- (IBAction)tapBtn2:(id)sender;

@end
