//
//  ViewController.m
//  Brujula
//
//  Created by Profesor on 14/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    [_locationManager startUpdatingHeading];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    float puntoIni = -manager.heading.trueHeading * M_PI/180.0f;
    float puntoFin = -newHeading.trueHeading * M_PI/180.0f;
    
    CABasicAnimation * rotateCompass;
    rotateCompass = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateCompass.fromValue = [NSNumber numberWithFloat:puntoIni];
    rotateCompass.toValue = [NSNumber numberWithFloat:puntoFin];
    rotateCompass.duration = 0.5f;
    
    [_compassImage.layer addAnimation:rotateCompass forKey:@"animacion"];
    _compassImage.transform = CGAffineTransformMakeRotation(puntoFin);
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
