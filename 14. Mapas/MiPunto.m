//
//  MiPunto.m
//  Mapas
//
//  Created by Profesor on 7/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "MiPunto.h"


@implementation MiPunto
-(id)initWithCoordinate:(CLLocationCoordinate2D)coor title:(NSString *)text{
    self = [super init];
    if (self) {
        _coordinate = coor;
        _title = text;
    }
    return self;
}

-(id)init{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(6.235925, -75.57513) title:@"Medellin"];
}

@end
