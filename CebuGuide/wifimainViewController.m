//
//  ViewController.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/01/28.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "wifimainViewController.h"

@interface wifimainViewController ()<MKMapViewDelegate>

@end

@implementation wifimainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _alreadyStartingCoordinateSet = NO;
    
    //ユーザーによる位置情報サービスの許可状態をチェック
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted ||
        [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        //ユーザーはこのアプリによる位置情報サービスの利用を許可していない、または「設定」で無効にしている
        NSLog(@"Location services is unauthorized.");
    }
    else {
        //位置情報サービスを利用できる、またはまだ利用許可要求を行っていない
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        //利用許可要求をまだ行っていない状態であれば要求
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
            //許可の要求
            //アプリがフォアグラウンドにある間のみ位置情報サービスを使用する許可を要求
            [self.locationManager requestWhenInUseAuthorization];
        }
        
        //精度要求
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        //最小移動間隔
        self.locationManager.distanceFilter = 100.0;                    //100m 移動ごとに通知
        //        self.locationManager.distanceFilter = kCLDistanceFilterNone;    //全ての動きを通知（デフォルト）
        
        //測位開始
        [self.locationManager startUpdatingLocation];
    }
    
        // 地図の表示
        _mapView = [[MKMapView alloc] init];
    
        _mapView.delegate = self;
    
        _mapView.frame = CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height - 130);

        //地図の表示種類設定
        _mapView.mapType = MKMapTypeHybrid;
    
        //現在地を表示
        _mapView.showsUserLocation = YES;
    
        [self.view addSubview:_mapView];
}

    //位置情報更新時に呼ばれる
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
        //ユーザの位置を表示するかどうか
        _mapView.showsUserLocation = YES;
        
        //最新の位置情報を取得し、そこからマップの中心座標を決定
        CLLocation *currentLocation = locations.lastObject;
        CLLocationCoordinate2D centerCoordinate = currentLocation.coordinate;
        //縮尺度を指定
        MKCoordinateSpan coordinateSpan = MKCoordinateSpanMake(0.03, 0.03); //数が小さいほど拡大率アップ
        
        //設定した縮尺で現在地を中心としたマップをセット（初回1回のみ）
        if (_alreadyStartingCoordinateSet == NO) {
            MKCoordinateRegion newRegion = MKCoordinateRegionMake(centerCoordinate, coordinateSpan);
            [_mapView setRegion:newRegion animated:YES];
            _alreadyStartingCoordinateSet = YES;
        }
        
}

    //測位失敗時・位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
        NSLog(@"didFailWithError.");
}
    

    
//    // 地図の表示
//    MKMapView *mapView = [[MKMapView alloc] init];
//    
//    mapView.delegate = self;
//    
//    mapView.frame = CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height - 130);
//    
//    [self.view addSubview:mapView];
//    
//    [mapView.userLocation addObserver:self
//                           forKeyPath:@"location"
//                              options:0
//                              context:NULL];
//}
//
//-(void)observeValueForKeyPath:(NSString *)keyPath
//ofObject:(id)object
//change:(NSDictionary *)change
//context:(void *)context
//{
//    
//    MKMapView *mapView = [[MKMapView alloc] init];
//    // 地図の中心座標に現在地を設定
//    mapView.centerCoordinate = mapView.userLocation.location.coordinate;
//    // 表示倍率の設定
//    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
//    MKCoordinateRegion region = MKCoordinateRegionMake(mapView.userLocation.coordinate, span);
//    [mapView setRegion:region animated:YES];
//    
//    // 一度しか更新しない場合はremoveする 
//    [mapView.userLocation removeObserver:self forKeyPath:@"location"];
//    
//}


-(IBAction)returnMain:(UIStoryboardSegue *)segue{
}

-(IBAction)tapBtn:(id)sender {
    wifilistViewController *WifilistViewController;
    
    WifilistViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"wifilistViewController"];
    
    WifilistViewController.selectType = @"wifi";
    
    WifilistViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:WifilistViewController animated:YES completion:nil];
}

-(void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

@end

