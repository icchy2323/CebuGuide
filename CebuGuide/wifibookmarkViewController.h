//
//  seventhViewController.h
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/03.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wifibookmarkViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_wifiArray;
    NSArray *_favoriteArray;
}

@property (nonatomic,assign) int selectNum;

@property (nonatomic,strong)NSArray *wifilist;
@property (nonatomic,strong)NSString *wifiString;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
