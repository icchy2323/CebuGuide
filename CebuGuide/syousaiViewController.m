//
//  eighthViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/09.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "syousaiViewController.h"
#import "gourmetbookmarkViewController.h"
#import "wifibookmarkViewController.h"

@interface syousaiViewController ()

@end

@implementation syousaiViewController

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
    
    //ナビゲーションコントローラのタイトル設定
    self.navigationItem.title = [NSString stringWithFormat:@"Wi-Fi"];
    
    //リストを表示する
    NSString *strPictureList = @"";
    NSString *strNameList = @"";
    NSString *strGenreList = @"";
    NSString *strAddressList = @"";
    NSString *strEvaluationList = @"";
    NSString *strCommentList = @"";
    
    
    //ボタンが押された時
    NSDictionary *wifiDic = _wifiArray[self.selectNum];
    
    strPictureList = [strPictureList stringByAppendingString:wifiDic[@"wifilist"][@"Picture"]];
    strPictureList = [strPictureList stringByAppendingString:@"\n"];
    
    strNameList = [strNameList stringByAppendingString:wifiDic[@"wifilist"][@"Name"]];
    strNameList = [strNameList stringByAppendingString:@"\n"];
    
    strGenreList = [strGenreList stringByAppendingString:wifiDic[@"wifilist"][@"Genre"]];
    strGenreList = [strGenreList stringByAppendingString:@"\n"];
    
    strAddressList = [strAddressList stringByAppendingString:wifiDic[@"wifilist"][@"Address"]];
    strAddressList = [strAddressList stringByAppendingString:@"\n"];
    
    strEvaluationList = [strEvaluationList stringByAppendingString:wifiDic[@"wifilist"][@"Evaluation"]];
    strEvaluationList = [strEvaluationList stringByAppendingString:@"\n"];
    
    strCommentList = [strCommentList stringByAppendingString:wifiDic[@"wifilist"][@"Comment"]];
    strCommentList = [strCommentList stringByAppendingString:@"\n"];

//    //高速列挙でデータを取り出して文字列変数にセット
//    for (NSDictionary *wifiDic in self.wifiList) {
//        strPictureList = [strPictureList stringByAppendingString:wifiDic[@"Picture"]];
//        strPictureList = [strPictureList stringByAppendingString:@"\n"];
//        
//        strNameList = [strNameList stringByAppendingString:wifiDic[@"Name"]];
//        strNameList = [strNameList stringByAppendingString:@"\n"];
//        
//        strGenreList = [strGenreList stringByAppendingString:wifiDic[@"Genre"]];
//        strGenreList = [strGenreList stringByAppendingString:@"\n"];
//        
//        strAddressList = [strAddressList stringByAppendingString:wifiDic[@"Address"]];
//        strAddressList = [strAddressList stringByAppendingString:@"\n"];
//        
//        strEvaluationList = [strEvaluationList stringByAppendingString:wifiDic[@"Evaluation"]];
//        strEvaluationList = [strEvaluationList stringByAppendingString:@"\n"];
//        
//        strCommentList = [strCommentList stringByAppendingString:wifiDic[@"Comment"]];
//        strCommentList = [strCommentList stringByAppendingString:@"\n"];
//        
//    }
    
    NSLog(@"%@",strPictureList);
    NSLog(@"%@",strNameList);
    NSLog(@"%@",strGenreList);
    NSLog(@"%@",strAddressList);
    NSLog(@"%@",strEvaluationList);
    NSLog(@"%@",strCommentList);
    
    self.myImageView.image = [UIImage imageNamed:@"Picture.png"];
    self.myImageView2.image = [UIImage imageNamed:@"Genre.png"];
    self.myLabel.text = strNameList;
    self.myLabel2.text = strAddressList;
    self.myLabel3.text = strEvaluationList;
    self.myTextView.text = strCommentList;
    
//  self.myLabel.text = [NSString stringWithFormat:@"%@",_wifiArray[self.selectNum][@"Name"]];
//  self.myLabel2.text = [NSString stringWithFormat:@"%@",_wifiArray[self.selectNum][@"Address"]];
//  self.myLabel3.text = [NSString stringWithFormat:@"%@",_wifiArray[self.selectNum][@"Evaluation"]];
//  self.myTextView.text = [NSString stringWithFormat:@"%@",_wifiArray[self.selectNum][@"Comment"]];
    
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
    
    //AlertViewの設定
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Add to" message:@"Bookmark?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    
    //設定したAlertViewを表示
    [alert show];
}

- (IBAction)tapBtn2:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//ボタンがクリックされた時に、どのボタンが押されたか認識できるメソッド
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        NSLog(@"OK");
    } else {
        NSLog(@"Cancel");
    }
}

@end
