//
//  sixthViewController.h
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/03.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gourmetbookmarkViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_gourmetArray;
}

@property (nonatomic,assign) int
selectNum;
@property (nonatomic,strong)NSArray *gourmetList;
@property (nonatomic,strong)NSString *gourmetString;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
