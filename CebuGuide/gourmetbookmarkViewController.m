//
//  sixthViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/03.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "gourmetbookmarkViewController.h"
#import "customTableViewCell.h"
#import "TableViewConst.h"

@interface gourmetbookmarkViewController ()

//テーブルに表示する情報が入ります。
@property (nonatomic, strong) NSArray *dataSourceName;
@property (nonatomic, strong) NSArray *dataSourceHyouka;


@end

@implementation gourmetbookmarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // デリゲートメソッドをこのクラスで実装する
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    
    // テーブルに表示したいデータソースをセット
    self.dataSourceName = @[@"a", @"b", @"c"];
    self.dataSourceHyouka = @[@"⭐︎", @"⭐︎⭐︎", @"⭐︎⭐︎⭐︎"];
    

    
    UINib *nib = [UINib nibWithNibName:@"TableViewCustomCell" bundle:nil];
    [self.myTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [customTableViewCell rowHeight];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    
    //customTableViewCell *cell;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
       cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
