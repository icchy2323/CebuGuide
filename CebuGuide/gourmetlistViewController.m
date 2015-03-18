//
//  fourthViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/02.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "gourmetlistViewController.h"
#import "customTableViewCell.h"
#import "TableViewConst.h"

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
    
    //リストを表示する
    NSString *strPictureList = @"";
    NSString *strNameList = @"";
    NSString *strGenreList = @"";
    NSString *strAddressList = @"";
    NSString *strEvaluationList = @"";
    NSString *strCommentList = @"";
    
    //高速列挙でデータを取り出して文字列変数にセット
    for (NSDictionary *gourmetDic in self.gourmetlist) {
        strPictureList = [strPictureList stringByAppendingString:gourmetDic[@"Picture"]];
        strPictureList = [strPictureList stringByAppendingString:@"\n"];

        strNameList = [strNameList stringByAppendingString:gourmetDic[@"Name"]];
        strNameList = [strNameList stringByAppendingString:@"\n"];
        
        strGenreList = [strGenreList stringByAppendingString:gourmetDic[@"Genre"]];
        strGenreList = [strGenreList stringByAppendingString:@"\n"];
        
        strAddressList = [strAddressList stringByAppendingString:gourmetDic[@"Address"]];
        strAddressList = [strAddressList stringByAppendingString:@"\n"];

        strEvaluationList = [strEvaluationList stringByAppendingString:gourmetDic[@"Evaluation"]];
        strEvaluationList = [strEvaluationList stringByAppendingString:@"\n"];
        
        strCommentList = [strCommentList stringByAppendingString:gourmetDic[@"Comment"]];
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
    return _gourmetArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifer = @"cell";
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    NSDictionary *gourmetDic =(NSDictionary *)_gourmetArray[indexPath.row][@"gourmetlist"];
    
    cell.myLabel.text =[NSString stringWithFormat:@"%@",gourmetDic[@"Name"]];
    
    cell.myImageView.image = [UIImage imageNamed:gourmetDic[@"Genre"]];
                               
    NSString *strEvaluationList = gourmetDic[@"Evaluation"];
                               
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
    
    SyousaitwoViewController.selectType = @"gourmet";
    
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
    gourmetmainViewController *GourmetmainViewController;

    GourmetmainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"gourmetmainViewController"];
    
    GourmetmainViewController.selectType = @"gourmet";
    
    GourmetmainViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:GourmetmainViewController animated:YES completion:nil];

}

@end
