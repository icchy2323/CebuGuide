//
//  annotationWithNumber.h
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/27.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface annotationWithNumber : NSObject<MKAnnotation>{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
    NSString *pinNumber;
}

@property(nonatomic)CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;
@property(nonatomic, copy) NSString *pinNumber;

-(id)initWithCoordinate:(CLLocationCoordinate2D)co;

@end
