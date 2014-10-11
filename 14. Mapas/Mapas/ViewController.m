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
    
    [locationManager startUpdatingLocation];
    //[locationManager stopUpdatingLocation];
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([userLocation coordinate], 500, 500);
    [_worldView setRegion:region animated:YES];
    
    //Simulador 6.235925, -75.57513
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation * newLocation = [locations lastObject];
    NSLog(@"%@", newLocation);
    MiPunto * punto = [[MiPunto alloc] initWithCoordinate:[newLocation coordinate] title:@"Manejando"];
    [_worldView addAnnotation:punto];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeMap:(id)sender {
    int index = (int)[sender selectedSegmentIndex];
    switch (index) {
        case 0:
            [_worldView setMapType:MKMapTypeStandard];
            break;
        case 1:
            [_worldView setMapType:MKMapTypeSatellite];
            break;
        case 2:
            [_worldView setMapType:MKMapTypeHybrid];
            break;
    }
}
@end
