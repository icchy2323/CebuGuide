//
//  eighthViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/09.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "eighthViewController.h"

@interface eighthViewController ()

@end

@implementation eighthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
                         initWithTitle:@"Bookmark" message:@"に追加しますか?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    //    設定したAlertViewを表示
    [alert show];
}

- (IBAction)tapBtn2:(id)sender {
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
