//
//  fifthViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/02.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "wifilistViewController.h"
#import "customTableViewCell.h"
#import "TableViewConst.h"

@interface wifilistViewController ()

@end

@implementation wifilistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Tab barを表示させる
    //self.hidesBottomBarWhenPushed = NO;
    
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
    
    //リストを表示する
    NSString *strPictureList = @"";
    NSString *strNameList = @"";
    NSString *strGenreList = @"";
    NSString *strAddressList = @"";
    NSString *strEvaluationList = @"";
    NSString *strCommentList = @"";
    
    //高速列挙でデータを取り出して文字列変数にセット
    for (NSDictionary *wifiDic in self.wifilist) {
        strPictureList = [strPictureList stringByAppendingString:wifiDic[@"Picture"]];
        strPictureList = [strPictureList stringByAppendingString:@"\n"];
        
        strNameList = [strNameList stringByAppendingString:wifiDic[@"Name"]];
        strNameList = [strNameList stringByAppendingString:@"\n"];
        
        strGenreList = [strGenreList stringByAppendingString:wifiDic[@"Genre"]];
        strGenreList = [strGenreList stringByAppendingString:@"\n"];
        
        strAddressList = [strAddressList stringByAppendingString:wifiDic[@"Address"]];
        strAddressList = [strAddressList stringByAppendingString:@"\n"];
        
        strEvaluationList = [strEvaluationList stringByAppendingString:wifiDic[@"Evaluation"]];
        strEvaluationList = [strEvaluationList stringByAppendingString:@"\n"];
        
        strCommentList = [strCommentList stringByAppendingString:wifiDic[@"Comment"]];
        strCommentList = [strCommentList stringByAppendingString:@"\n"];
        
    }
    
    NSLog(@"%@",strPictureList);
    NSLog(@"%@",strNameList);
    NSLog(@"%@",strGenreList);
    NSLog(@"%@",strAddressList);
    NSLog(@"%@",strEvaluationList);
    NSLog(@"%@",strCommentList);
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCustomCell" bundle:nil];
    [self.myTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [customTableViewCell rowHeight];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _wifiArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifer = @"cell";
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
//    }
    
    NSDictionary *wifiDic =(NSDictionary *)_wifiArray[indexPath.row][@"wifilist"];
    
    cell.myLabel.text =[NSString stringWithFormat:@"%@",wifiDic[@"Name"]];
    //cell.myLabel2.text =[NSString stringWithFormat:@"%@",wifiDic[@"Evaluation"]];
    cell.myImageView.image = [UIImage imageNamed:wifiDic[@"Picture"]];
    
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
    
    SyousaitwoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"syousaitwoViewController"];
    
    SyousaitwoViewController.selectNum = (int)self.myTableView.indexPathForSelectedRow.row;
    
    SyousaitwoViewController.selectType = @"wifi";
    
    [self presentViewController:SyousaitwoViewController animated:NO completion:nil];
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
    wifimainViewController *WifimainViewController;
    
    WifimainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"wifimainViewController"];
    
    WifimainViewController.selectType = @"wifi";
    
    WifimainViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:WifimainViewController animated:YES completion:nil];
}

@end
