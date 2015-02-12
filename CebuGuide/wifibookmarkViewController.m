//
//  seventhViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/03.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "wifibookmarkViewController.h"
#import "syousaiViewController.h"

@interface wifibookmarkViewController ()

@end

@implementation wifibookmarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _wifiArray = @[@"a",@"b",@"c"];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _wifiArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell.textLabel.text = [NSString stringWithFormat:@"%@",_wifiArray[indexPath.row]];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_wifiArray[indexPath.row]];
    return cell;
}

//ryoma0211
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"Hoge" sender:self];
}
//////////

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
     if ( [[segue identifier] isEqualToString:@"Hoge"] ) {
    syousaiViewController *dvc = [segue destinationViewController];
    dvc.selectNum = (int)self.myTableView.indexPathForSelectedRow.row;
     }
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

@end
