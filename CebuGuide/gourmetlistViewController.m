//
//  fourthViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/02.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "gourmetlistViewController.h"

@interface gourmetlistViewController ()

@end

@implementation gourmetlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //プロジェクト内のファイルにアクセスできるオブジェクトを作成
    NSBundle *bundle = [NSBundle mainBundle];
    
    //読み込むプロパティリストのファイルパス（場所）を指定
    NSString *path = [bundle pathForResource:@"gourmet" ofType:@"plist"];
    
    //プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    _gourmetArray = [dic objectForKey:@"Gourmetlist"];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    //ナビゲーションコントローラのタイトル設定
    self.navigationItem.title = [NSString stringWithFormat:@"%@",self.gourmetString];
    
    //友達リストを表示する
    NSString *strNameList = @"";
    NSString *strEvaluationList = @"";
    NSString *strCommentList = @"";
    
    //高速列挙でデータを取り出して文字列変数にセット
    for (NSDictionary *gourmetDic in self.gourmetList) {
        strNameList = [strNameList stringByAppendingString:gourmetDic[@"Name"]];
        strNameList = [strNameList stringByAppendingString:@"\n"];
        
        strEvaluationList = [strEvaluationList stringByAppendingString:gourmetDic[@"Evaluation"]];
        strEvaluationList = [strEvaluationList stringByAppendingString:@"\n"];
        
        strCommentList = [strCommentList stringByAppendingString:gourmetDic[@"Comment"]];
        strCommentList = [strCommentList stringByAppendingString:@"\n"];
        
    }
    
    NSLog(@"%@",strNameList);
    NSLog(@"%@",strEvaluationList);
    NSLog(@"%@",strCommentList);
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _gourmetArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifer = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
    NSDictionary *gourmetDic =(NSDictionary *)_gourmetArray[indexPath.row][@"gourmetlist"];
        
    cell.textLabel.text = [NSString stringWithFormat:@"%@",gourmetDic[@"Name"]];
    
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
