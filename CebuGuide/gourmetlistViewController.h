//
//  fourthViewController.h
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/02.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "syousaitwoViewController.h"
#import "gourmetmainViewController.h"

@interface gourmetlistViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_gourmetArray;
    syousaitwoViewController *SyousaitwoViewController;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic,assign) int selectNum;

@property (nonatomic,strong) NSString *selectType;

@property (nonatomic,strong)NSArray *gourmetlist;
@property (nonatomic,strong)NSString *gourmetString;

- (IBAction)tapBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end
