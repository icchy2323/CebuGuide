//
//  seventhViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/03.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "wifibookmarkViewController.h"
#import "customTableViewCell.h"
#import "TableViewConst.h"
#import "syousaiViewController.h"
#import "annotationWithNumber.h"

@interface wifibookmarkViewController ()

@end

@implementation wifibookmarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //プロジェクト内のファイルにアクセスできるオブジェクトを作成
    NSBundle *bundle = [NSBundle mainBundle];
    
    //読み込むプロパティリストのファイルパス（場所）を指定
    NSString *path = [bundle pathForResource:@"wifi" ofType:@"plist"];
    
    //プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    _wifiArray = [dic objectForKey:@"Wifilist"];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    //ナビゲーションコントローラのタイトル設定
    self.navigationItem.title = [NSString stringWithFormat:@"Wi-Fi"];
    
    //UserDefaultObjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //一旦配列に取り出す
    NSMutableArray *wifiArray = [[defaults objectForKey:@"wifiArray"] mutableCopy];
    
    NSMutableArray *tmpArray = [NSMutableArray new];
    
    for (NSString *favorite_no in wifiArray) {
        for (NSDictionary *shopdic in _wifiArray) {
            if ([favorite_no intValue] == [shopdic[@"NO"] intValue]){
                
                //tmpArray に追加
                [tmpArray addObject:shopdic];
                
                break;
            }
        }
    }
    
    _favoriteArray = tmpArray;
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCustomCell" bundle:nil];
    [self.myTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [customTableViewCell rowHeight];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _favoriteArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *wifiDic = (NSDictionary *)_favoriteArray[indexPath.row][@"wifilist"];
    
    cell.myLabel.text = [NSString stringWithFormat:@"%@",wifiDic[@"Name"]];
    cell.myImageView.image = [UIImage imageNamed:wifiDic[@"Genre"]];
    
    NSString *strEvaluationList = wifiDic[@"Evaluation"];
    
    if ([strEvaluationList intValue] == 1) {
        cell.myImageView2.image = [UIImage imageNamed:@"star1.png"];
    };
    
    if ([strEvaluationList intValue] == 2) {
        cell.myImageView2.image = [UIImage imageNamed:@"star2.png"];
    };
    
    if ([strEvaluationList intValue] == 3) {
        cell.myImageView2.image = [UIImage imageNamed:@"star3.png"];
    };
    
    if ([strEvaluationList intValue] == 4) {
        cell.myImageView2.image = [UIImage imageNamed:@"star4.png"];
    };
    
    if ([strEvaluationList intValue] == 5) {
        cell.myImageView2.image = [UIImage imageNamed:@"star5.png"];
    };

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"move" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ( [[segue identifier] isEqualToString:@"move"] ) {
    syousaiViewController *dvc = [segue destinationViewController];
        
    //UserDefaultObjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
    //一旦配列に取り出す
    NSMutableArray *wifiArray = [[defaults objectForKey:@"wifiArray"] mutableCopy];
        
    NSLog(@"%ld",(long)self.myTableView.indexPathForSelectedRow.row);
        
    dvc.selectNum = [wifiArray[(long)self.myTableView.indexPathForSelectedRow.row] intValue];
    
    dvc.selectType = @"wifi";
        
     }
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
