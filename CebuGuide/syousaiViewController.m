//
//  eighthViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/09.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "syousaiViewController.h"
#import "wifibookmarkViewController.h"
#import "gourmetbookmarkViewController.h"

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
    NSString *path2 = [bundle pathForResource:@"gourmet" ofType:@"plist"];
    
    //プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *dic2 = [NSDictionary dictionaryWithContentsOfFile:path2];
    
    _wifiArray = [dic objectForKey:@"Wifilist"];
    _gourmetArray = [dic2 objectForKey:@"Gourmetlist"];
    
    NSDictionary *wifiDic = _wifiArray[self.selectNum];
    NSDictionary *gourmetDic = _gourmetArray[self.selectNum];
    
    //ナビゲーションコントローラのタイトル設定
    self.navigationItem.title = [NSString stringWithFormat:@"Wi-Fi"];

    //wifi,gourmetどちらから来たか判定する
    NSDictionary *commonDic = [[NSDictionary alloc]init];
    
    if ([self.selectType isEqualToString:@"wifi"]) {
        commonDic = wifiDic[@"wifilist"];
    } else {
        commonDic = gourmetDic[@"gourmetlist"];
    }
    
    //リストを表示する
    NSString *strPictureList = @"";
    NSString *strNameList = @"";
    NSString *strGenreList = @"";
    NSString *strAddressList = @"";
    NSString *strEvaluationList = @"";
    NSString *strCommentList = @"";
    
    strPictureList = [strPictureList stringByAppendingString:commonDic[@"Picture"]];
    strPictureList = [strPictureList stringByAppendingString:@"\n"];
    
    strNameList = [strNameList stringByAppendingString:commonDic[@"Name"]];
    strNameList = [strNameList stringByAppendingString:@"\n"];
    
    strGenreList = [strGenreList stringByAppendingString:commonDic[@"Genre"]];
    strGenreList = [strGenreList stringByAppendingString:@"\n"];
    
    strAddressList = [strAddressList stringByAppendingString:commonDic[@"Address"]];
    strAddressList = [strAddressList stringByAppendingString:@"\n"];
    
    strEvaluationList = [strEvaluationList stringByAppendingString:commonDic[@"Evaluation"]];
    strEvaluationList = [strEvaluationList stringByAppendingString:@"\n"];
    
    strCommentList = [strCommentList stringByAppendingString:commonDic[@"Comment"]];
    strCommentList = [strCommentList stringByAppendingString:@"\n"];
    
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
