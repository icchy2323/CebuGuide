//
//  fifthViewController.h
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/02.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wifilistViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
     NSArray *_wifiArray;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic,assign) int
selectNum;
@property (nonatomic,strong)NSArray *wifiList;
@property (nonatomic,strong)NSString *wifiString;

- (IBAction)tapBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end
