//
//  ViewController.m
//  Mapas
//
//  Created by Profesor on 7/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _worldView.delegate = self;
    MiPunto * medellin = [[MiPunto alloc] init];
    [_worldView addAnnotation:medellin];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;

    //IOS 8
    [locationManager requestAlwaysAuthorization];
    
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [_worldView setShowsUserLocation:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeMap:(id)sender {
}
@end
