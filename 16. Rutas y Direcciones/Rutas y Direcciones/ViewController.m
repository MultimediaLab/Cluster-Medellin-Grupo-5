//
//  ViewController.m
//  Rutas y Direcciones
//
//  Created by Profesor on 9/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLLocationManager * locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _activity.hidden = YES;
    _mapView.delegate = self;

    //IOS 8
    
    //info.plist
    //<key>NSLocationAlwaysUsageDescription</key>
    //<string>Permitir Acceso?</string>
    //<key>NSLocationWhenInUseUsageDescription</key>
    //<string>Permitir Acceso?</string>
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager requestAlwaysAuthorization];
    
    [_mapView setShowsUserLocation:YES];

}

- (IBAction)handleRoute:(id)sender {
    _activity.hidden = NO;
    _routeButton.enabled = NO;
    [_activity startAnimating];
    
    //Crear una solicitud de direccion
    MKDirectionsRequest * directionRequest = [MKDirectionsRequest new];
    
    //Punto Inicial -> Punto Actual
    MKMapItem * source = [MKMapItem mapItemForCurrentLocation];
    [directionRequest setSource:source];
    
    //Punto Final - USA - CASA BLANCA
    CLLocationCoordinate2D casaBlanca = CLLocationCoordinate2DMake(38.8977, -77.0365);
    MKPlacemark * casaPlace = [[MKPlacemark alloc] initWithCoordinate:casaBlanca addressDictionary:nil];
    MKMapItem * destination = [[MKMapItem alloc] initWithPlacemark:casaPlace];
    [directionRequest setDestination:destination];
    
    MKDirections * directions = [[MKDirections alloc] initWithRequest:directionRequest];
    
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        [_activity stopAnimating];
        _activity.hidden = YES;
        _routeButton.enabled = YES;
        if (error) {
            NSLog(@"Error: %@", error.description);
            return;
        }
        currentRoute = [response.routes firstObject];
        [self drawRouteMap:currentRoute];
    }];
}
-(void)drawRouteMap:(MKRoute*)route{
    if (linea) {
        [_mapView removeOverlay:linea];
    }
    linea = route.polyline;
    [_mapView addOverlay:linea];
}
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKPolyline * ruta = overlay;
    MKPolylineRenderer * rutaRender = [[MKPolylineRenderer alloc] initWithPolyline:ruta];
    rutaRender.strokeColor = [UIColor redColor];
    return rutaRender;
}
@end
