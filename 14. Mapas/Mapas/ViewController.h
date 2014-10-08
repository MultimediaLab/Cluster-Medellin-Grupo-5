//
//  ViewController.h
//  Mapas
//
//  Created by Profesor on 7/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MiPunto.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager * locationManager;
}

@property (strong, nonatomic) IBOutlet MKMapView *worldView;
- (IBAction)changeMap:(id)sender;

@end

