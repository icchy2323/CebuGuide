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
#import "syousaitwoViewController.h"

@interface syousaiViewController ()

@end

@implementation syousaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //textViewを角丸にする
    [[self.myTextView3 layer] setCornerRadius:10.0];
    [self.myTextView3 setClipsToBounds:YES];
    
    //textViewに黒色の枠を付ける
    [[self.myTextView3 layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[self.myTextView3 layer] setBorderWidth:1.0];
    
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
   
//    //if文の中に移動
//    NSDictionary *wifiDic = _wifiArray[self.selectNum];
//    NSDictionary *gourmetDic = _gourmetArray[self.selectNum];
    
//    //ナビゲーションコントローラのタイトル設定
//    self.navigationItem.title = [NSString stringWithFormat:@"Wi-Fi"];

    //wifi,gourmetどちらから来たか判定する
    NSDictionary *commonDic = [[NSDictionary alloc]init];
    
    if ([self.selectType isEqualToString:@"wifi"]) {
        
//        //UserDefaultObjectを用意する
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        
//        //一旦配列に取り出す
//        NSMutableArray *wifiArray = [[defaults objectForKey:@"wifiArray"] mutableCopy];
//
//        _ListNO = [wifiArray[self.selectNum] intValue];
        
        NSDictionary *wifiDic = _wifiArray[self.selectNum -1];
        
        commonDic = wifiDic[@"wifilist"];
        
        
    } else {
        
//        //UserDefaultObjectを用意する
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        
//        //一旦配列に取り出す
//        NSMutableArray *gourmetArray = [[defaults objectForKey:@"gourmetArray"] mutableCopy];
//        
//        _ListNO = [gourmetArray[self.selectNum] intValue];

        NSDictionary *gourmetDic = _gourmetArray[self.selectNum -1];
        
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
    
    if ([strEvaluationList intValue] == 1) {
        self.myImageView3.image = [UIImage imageNamed:@"star1.png"];
    };
    
    if ([strEvaluationList intValue] == 2) {
        self.myImageView3.image = [UIImage imageNamed:@"star2.png"];
    };
    
    if ([strEvaluationList intValue] == 3) {
        self.myImageView3.image = [UIImage imageNamed:@"star3.png"];
    };
    
    if ([strEvaluationList intValue] == 4) {
        self.myImageView3.image = [UIImage imageNamed:@"star4.png"];
    };
    
    if ([strEvaluationList intValue] == 5) {
        self.myImageView3.image = [UIImage imageNamed:@"star5.png"];
    };

    self.myImageView.image = [UIImage imageNamed:commonDic[@"Picture"]];
    self.myImageView2.image = [UIImage imageNamed:commonDic[@"Genre"]];
    self.myLabel.text = strNameList;
    self.myTextView2.text = strAddressList;
    self.myTextView.text = strCommentList;
    self.myLabel3.text = strGenreList;
    self.myImageView4.image = [UIImage imageNamed:@"Comment.png"];
    self.myImageView5.image = [UIImage imageNamed:@"Address.png"];
    self.myImageView6.image = [UIImage imageNamed:@"Memo.png"];
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

- (IBAction)tapBtn2:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
