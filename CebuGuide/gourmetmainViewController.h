//
//  secondViewController.h
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/02.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "gourmetlistViewController.h"

@interface gourmetmainViewController : UIViewController<MKMapViewDelegate>{
    MKMapView *_mapView;
    BOOL _alreadyStartingCoordinateSet;
}

@property (nonatomic) CLLocationManager *locationManager;

@property (nonatomic,strong) NSString *selectType;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
- (IBAction)tapBtn:(id)sender;

@end
