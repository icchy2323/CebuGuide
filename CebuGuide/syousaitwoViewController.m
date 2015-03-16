//
//  syousaitwoViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/18.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "syousaitwoViewController.h"
#import "wifilistViewController.h"
#import "gourmetlistViewController.h"

@interface syousaitwoViewController ()

@end

@implementation syousaitwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //textViewを角丸にする
    [[self.myTextView3 layer] setCornerRadius:10.0];
    [self.myTextView3 setClipsToBounds:YES];
    
    //textViewに黒色の枠を付ける
    [[self.myTextView3 layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[self.myTextView3 layer] setBorderWidth:1.0];
    
    NSLog(@"%d",_selectNum);
    
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

    //wifi,gourmetどちらから来たか判定する
    NSDictionary *commonDic = [[NSDictionary alloc]init];
    
    if ([self.selectType isEqualToString:@"wifi"]) {
        NSDictionary *wifiDic = _wifiArray[self.selectNum];
        
        commonDic = wifiDic[@"wifilist"];
        _ListNO = [wifiDic[@"NO"] intValue];
        
        //UserDefaultObjectを用意する
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        //一旦配列に取り出す
        NSMutableArray *wifiArray = [[defaults objectForKey:@"wifiArray"] mutableCopy];
        
        for (NSString *favorite_no in wifiArray) {
            if ([favorite_no intValue] == _ListNO){
                    
                    self.myButton.enabled = NO;
                    self.myButton.alpha = 0.0;
                    self.myImageView4.image = [UIImage imageNamed:@"Check.png"];
                
                
                    break;
                }
            }

    } else {
        NSDictionary *gourmetDic = _gourmetArray[self.selectNum];
        
        commonDic = gourmetDic[@"gourmetlist"];
        _ListNO = [gourmetDic[@"NO"] intValue];
        
        //UserDefaultObjectを用意する
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        //一旦配列に取り出す
        NSMutableArray *gourmetArray = [[defaults objectForKey:@"gourmetArray"] mutableCopy];
        
        for (NSString *favorite_no in gourmetArray) {
            if ([favorite_no intValue] == _ListNO){
                
                self.myButton.enabled = NO;
                self.myButton.alpha = 0.0;
                self.myImageView4.image = [UIImage imageNamed:@"Check.png"];
                
                
                break;
            }
        
        }

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
    self.myImageView5.image = [UIImage imageNamed:@"Comment.png"];
    self.myImageView6.image = [UIImage imageNamed:@"Address.png"];
    self.myImageView7.image = [UIImage imageNamed:@"Memo.png"];
    
    self.myTextView3.delegate = self;
    
////////////////////////////////////////////////////////////////////////////////////////
    
//    //UserDefaultObjectを用意する
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    //文字を保存
//    [defaults setObject:self.myTextView3.text forKey:@"Memo"];
//    
//    [defaults synchronize];
//    
//    //保存されたデータを取り出す
//    NSString *memoStr = [defaults stringForKey:@"Memo"];
//    
//    self.myTextView3.text = memoStr;
    
///////////////////////////////////////////////////////////////////////////////////////

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
    
    //AlertViewに番号をつける
    alert.tag = 1;
    
    //設定したAlertViewを表示
    [alert show];
}

- (IBAction)tapBtn2:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapBtn3:(id)sender {
    
    //アラートを表示する
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Memo"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Cansel"
                                            otherButtonTitles:@"OK", nil];
    
    //AlertViewに番号をつける
    message.tag = 0;
    
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    [message show];
}

//ボタンがクリックされた時に、どのボタンが押されたか認識できるメソッド
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSLog(@"OK");
        
        if (alertView.tag == 0) {
            
            //メモ
            if (buttonIndex == 1) {
                
                //UserDefaultObjectを用意する
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                
                //文字を保存
                [defaults setObject:self.myTextView3.text forKey:@"Memo"];
                
                [defaults synchronize];
                
                //保存されたデータを取り出す
                NSString *memoStr = [defaults stringForKey:@"Memo"];
                
                self.myTextView3.text = memoStr;
            }
            

        }else{
            //お気に入り
        }
        
        self.myButton.enabled = NO;
        self.myButton.alpha = 0.0;
        self.myImageView4.image = [UIImage imageNamed:@"Check.png"];
        
        //UserDefaultObjectを用意する
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        if ([self.selectType isEqualToString:@"wifi"]) {
            //一旦配列に取り出す
            NSMutableArray *wifiArray = [[defaults objectForKey:@"wifiArray"] mutableCopy];
            
            if (wifiArray == nil) {
                
                wifiArray = [NSMutableArray new];
                
                //配列に新しいデータを追加
                [wifiArray addObject:[NSString stringWithFormat:@"%d",_ListNO]];
                
                //wifiArrayを保存
                [defaults setObject:wifiArray forKey:@"wifiArray"];
                
                [defaults synchronize];
                
            }else {
                
                //配列に新しいデータを追加
                [wifiArray addObject:[NSString stringWithFormat:@"%d",_ListNO]];
                
                //wifiArrayを保存
                [defaults setObject:wifiArray forKey:@"wifiArray"];
                
                [defaults synchronize];
            }
            
        }else{
            
            //gourmet
            //一旦配列に取り出す
            NSMutableArray *gourmetArray = [[defaults objectForKey:@"gourmetArray"] mutableCopy];
            
            if (gourmetArray == nil) {
                
                gourmetArray = [NSMutableArray new];
                
                //配列に新しいデータを追加
                [gourmetArray addObject:[NSString stringWithFormat:@"%d",_ListNO]];
                
                //gourmetArrayを保存
                [defaults setObject:gourmetArray forKey:@"gourmetArray"];
                
                [defaults synchronize];
                
            }else {
                
                //配列に新しいデータを追加
                [gourmetArray addObject:[NSString stringWithFormat:@"%d",_ListNO]];
                
                //gourmetArrayを保存
                [defaults setObject:gourmetArray forKey:@"gourmetArray"];
                
                [defaults synchronize];

            }
        }

    }else{
        
        NSLog(@"Cancel");
        
    }
}

@end
