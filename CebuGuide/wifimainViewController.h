//
//  ViewController.h
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/01/28.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface wifimainViewController : UIViewController<CLLocationManagerDelegate>
{
    MKMapView *_mapView;
    BOOL _alreadyStartingCoordinateSet;

}
@property (nonatomic) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
- (IBAction)tapBtn:(id)sender;

@end
