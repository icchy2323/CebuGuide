//
//  ViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/01/28.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<MKMapViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 地図の表示
    MKMapView *mapView = [[MKMapView alloc] init];
    
    mapView.delegate = self;
    
    mapView.frame = CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height - 130);
    
    [self.view addSubview:mapView];
    
    [mapView.userLocation addObserver:self
                           forKeyPath:@"location"
                              options:0
                              context:NULL];
}

-(void)observeValueForKeyPath:(NSString *)keyPath
ofObject:(id)object
change:(NSDictionary *)change
context:(void *)context
{
    
    MKMapView *mapView = [[MKMapView alloc] init];
    // 地図の中心座標に現在地を設定
    mapView.centerCoordinate = mapView.userLocation.location.coordinate;
    // 表示倍率の設定
    MKCoordinateSpan span = MKCoordinateSpanMake(0.005, 0.005);
    MKCoordinateRegion region = MKCoordinateRegionMake(mapView.userLocation.coordinate, span);
    [mapView setRegion:region animated:YES];
    
    // 一度しか更新しない場合はremoveする 
    [mapView.userLocation removeObserver:self forKeyPath:@"location"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)returnMain:(UIStoryboardSegue *)segue{
}

- (IBAction)tapBtn:(id)sender {
}
@end
