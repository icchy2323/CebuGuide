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
        //self.locationManager.distanceFilter = kCLDistanceFilterNone;    //全ての動きを通知（デフォルト）
        
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
    
    
    
    //プロジェクト内のファイルにアクセスできるオブジェクトを作成
    NSBundle *bundle = [NSBundle mainBundle];
    
    //読み込むプロパティリストのファイルパス（場所）を指定
    NSString *path = [bundle pathForResource:@"wifi" ofType:@"plist"];
    
    //プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    _wifiArray = [dic objectForKey:@"Wifilist"];
    
    //リストを表示する
    NSString *strPictureList = @"";
    NSString *strNameList = @"";
    NSString *strGenreList = @"";
    NSString *strAddressList = @"";
    NSString *strEvaluationList = @"";
    NSString *strCommentList = @"";
    NSString *strLatitudeList = @"";
    NSString *strLongitudeList = @"";
    
    //今何番目か番号を保持しておく
    int index = 0;
    
    //高速列挙でデータを取り出して文字列変数にセット
    for (NSDictionary *wifiDic in _wifiArray) {
        
        strPictureList = @"";
        strNameList = @"";
        strGenreList = @"";
        strAddressList = @"";
        strEvaluationList = @"";
        strCommentList = @"";
        strLatitudeList = @"";
        strLongitudeList = @"";
        
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
        
        strLatitudeList = [strLatitudeList stringByAppendingString:wifiDic[@"wifilist"][@"Latitude"]];
        
        strLongitudeList = [strLongitudeList stringByAppendingString:wifiDic[@"wifilist"][@"Longitude"]];
        
        CLLocationCoordinate2D co;
        
        co.latitude =[strLatitudeList doubleValue];
        co.longitude =[strLongitudeList doubleValue];
        
        annotationWithNumber *pin = [self createdPin:co Title:wifiDic[@"wifilist"][@"Name"] Subtitle:wifiDic[@"wifilist"][@"StarEvaluation"] PinNumber:index];
        
        [_mapView addAnnotation:pin];
        
        index++;
        
    }
    
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
        MKCoordinateSpan coordinateSpan = MKCoordinateSpanMake(0.05, 0.05); //数が小さいほど拡大率アップ
        
        //設定した縮尺で現在地を中心としたマップをセット（初回1回のみ）
        if (_alreadyStartingCoordinateSet == NO) {
            MKCoordinateRegion newRegion = MKCoordinateRegionMake(centerCoordinate, coordinateSpan);
            [_mapView setRegion:newRegion animated:YES];
            _alreadyStartingCoordinateSet = YES;
        }
        
}

    //測位失敗時・位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
        NSLog(@"測位失敗");
}

//ピンを立てる自作メソッド
-(annotationWithNumber *)createdPin:(CLLocationCoordinate2D)co Title:(NSString *)title Subtitle:(NSString *)subtitle PinNumber:(int)pinnumber{
    
    annotationWithNumber *pin = [[annotationWithNumber alloc] init];
    pin.coordinate = co;
    pin.title = title;
    pin.subtitle = subtitle;
    pin.pinNumber = [NSString stringWithFormat:@"%d",pinnumber];
    
    return pin;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *pinIndentifier = @"PinAnnotationID";
    
    //ピン情報の再利用
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinIndentifier];
    
    if (pinView == nil){
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinIndentifier];
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;
        
        pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    
    return pinView;
}

- (void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    //iボタンをタップした時にしたい動作を記述するメソッド
    NSLog(@"%@",view.annotation.title);
    
    SyousaitwoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"syousaitwoViewController"];
    
    annotationWithNumber *currentPin = (annotationWithNumber *)view.annotation;
    
    SyousaitwoViewController.selectNum = [currentPin.pinNumber intValue];
    
    SyousaitwoViewController.selectType = @"wifi";
    
    [self presentViewController:SyousaitwoViewController animated:NO completion:nil];
    
}

    
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

