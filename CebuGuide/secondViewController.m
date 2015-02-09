//
//  secondViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/02.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    MKMapView *mapView = [[MKMapView alloc] init];
    
    mapView.delegate = self;
    
    mapView.frame = CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height - 130);
    
//    //表示位置の中心を設定
//    CLLocationCoordinate2D co;
//    
//    //アヤラの位置を設定
//    co.latitude = 10.317347; //緯度
//    co.longitude = 123.905759; //経度
//    
//    [mapView setCenterCoordinate:co];
//
//    
//    //縮尺を設定
//    MKCoordinateRegion cr = mapView.region;
//    cr.span.latitudeDelta = 0.03; //数字を小さくすると、詳細な地図（範囲が狭い）になる 緯度
//    cr.span.longitudeDelta = 0.03; //　　　　　　　　同上　　　　　　　　　　　　　　　経度
//    
//    [mapView setRegion:cr];
//
//    //地図の表示種類設定
//    mapView.mapType = MKMapTypeHybrid;
    
    //現在地を表示
    mapView.showsUserLocation = YES;
    
    [self.view addSubview:mapView];
    
//    [mapView.userLocation addObserver:self
//                           forKeyPath:@"location"
//                              options:0
//                              context:NULL];
}

//-(void)observeValueForKeyPath:(NSString *)keyPath
//                     ofObject:(id)object
//                       change:(NSDictionary *)change
//                      context:(void *)context
//{
//    
//    MKMapView *mapView = [[MKMapView alloc] init];
//    // 地図の中心座標に現在地を設定
//    mapView.centerCoordinate = mapView.userLocation.location.coordinate;
//    // 表示倍率の設定
//    MKCoordinateSpan span = MKCoordinateSpanMake(0.03, 0.03);
//    MKCoordinateRegion region = MKCoordinateRegionMake(mapView.userLocation.coordinate, span);
//    [mapView setRegion:region animated:YES];
//    
//    // 一度しか更新しない場合はremoveする
//    [mapView.userLocation removeObserver:self forKeyPath:@"location"];
//    
//}

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

-(IBAction)returnMain:(UIStoryboardSegue *)segue {
    }

- (IBAction)tapBtn:(id)sender {
   }
@end
