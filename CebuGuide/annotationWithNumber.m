//
//  annotationWithNumber.m
//  CebuGuide
//
//  Created by 市川 貴章 on 2015/02/27.
//  Copyright (c) 2015年 市川 貴章. All rights reserved.
//

#import "annotationWithNumber.h"

@implementation annotationWithNumber

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
@synthesize pinNumber;

-(id)initWithCoordinate:(CLLocationCoordinate2D)co{
    coordinate = co;
    return  self;
}

@end
