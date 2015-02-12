//
//  eighthViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/09.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "syousaiViewController.h"
#import "wifibookmarkViewController.h"

@interface syousaiViewController ()

@end

@implementation syousaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%d",self.selectNum);
    
    _wifiArray = @[@{@"name":@"a",@"desc":@"⭐︎"},@{@"name":@"b",@"desc":@"⭐︎⭐︎"},@{@"name":@"c",@"desc":@"⭐︎⭐︎⭐︎"}];
                            
    self.myLabel.text = [NSString stringWithFormat:@"%@",_wifiArray[self.selectNum][@"name"]];
    self.myLabel3.text = [NSString stringWithFormat:@"%@",_wifiArray[self.selectNum][@"desc"]];
    
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
    
    //    AlertViewの設定
    UIAlertView *alert= [[UIAlertView alloc]
                         initWithTitle:@"Add to" message:@"Bookmark?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    //    設定したAlertViewを表示
    [alert show];
}

- (IBAction)tapBtn2:(id)sender {
    
     [self dismissViewControllerAnimated:YES completion:nil];
    
}

//ボタンがクリックされた時に、どのボタンが押されたか認識できるメソッド
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        NSLog(@"OK");
    } else {
        NSLog(@"Cancel");
    }
}

@end
