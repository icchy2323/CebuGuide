//
//  fifthViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/02.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "wifilistViewController.h"

@interface wifilistViewController ()

@end

@implementation wifilistViewController

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
    self.navigationItem.title = [NSString stringWithFormat:@"%@",self.wifiString];
    
    //友達リストを表示する
    NSString *strNameList = @"";
    NSString *strEvaluationList = @"";
    NSString *strCommentList = @"";
    
    //高速列挙でデータを取り出して文字列変数にセット
    for (NSDictionary *wifiDic in self.wifiList) {
        strNameList = [strNameList stringByAppendingString:wifiDic[@"Name"]];
        strNameList = [strNameList stringByAppendingString:@"\n"];
        
        strEvaluationList = [strEvaluationList stringByAppendingString:wifiDic[@"Evaluation"]];
        strEvaluationList = [strEvaluationList stringByAppendingString:@"\n"];
        
        strCommentList = [strCommentList stringByAppendingString:wifiDic[@"Comment"]];
        strCommentList = [strCommentList stringByAppendingString:@"\n"];
        
     }
    
    NSLog(@"%@",strNameList);
    NSLog(@"%@",strEvaluationList);
    NSLog(@"%@",strCommentList);
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _wifiArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifer = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
    NSDictionary *wifiDic =(NSDictionary *)_wifiArray[indexPath.row][@"wifilist"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",wifiDic[@"Name"]];
    
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

- (IBAction)tapBtn:(id)sender {
}
@end
