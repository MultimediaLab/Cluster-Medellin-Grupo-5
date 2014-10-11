//
//  ViewController.m
//  DIstancias y Anotaciones
//
//  Created by Profesor on 9/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property MKPolyline * line;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView.delegate = self;
    
    // Bogota
    CLLocationCoordinate2D bgt;
    bgt.latitude = 4.60971;
    bgt.longitude = -74.08175;
    
    MiPunto * bgtPoint = [[MiPunto alloc] initWithCoordinate:bgt title:@"Bogota"];
    
    //Medellin
    MiPunto * mdePoint = [[MiPunto alloc] init];
    
    //Manizales
    MiPunto * mzePoint = [[MiPunto alloc] initWithCoordinate:CLLocationCoordinate2DMake(5.07, -75.52056) title:@"Manizales"];
    
    [_mapView addAnnotations:[NSArray arrayWithObjects:bgtPoint, mdePoint, mzePoint,nil]];
    
    //Calcular Distancia
    CLLocation * punto1 = [[CLLocation alloc] initWithLatitude:bgt.latitude longitude:bgt.longitude];
    
    CLLocation * punto2 = [[CLLocation alloc] initWithLatitude:6.235925 longitude:-75.57513];
    
    CLLocationDistance distance = [punto1 distanceFromLocation:punto2];
    
    UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Distacia" message:[NSString stringWithFormat:@"La distancia entre Medellin y Bogota es de : %.02f km", distance/1000] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alerta show];
    //@property MKPolyline * line;
    //Linea entre Bogota y Medellin
    MKMapPoint * pointArray = malloc(sizeof(CLLocationCoordinate2D)*2);
    pointArray[0] = MKMapPointForCoordinate(bgt);
    pointArray[1] = MKMapPointForCoordinate(CLLocationCoordinate2DMake(6.235925, -75.57513));
    _line = [MKPolyline polylineWithPoints:pointArray count:2];
    [_mapView addOverlay:_line];
    
}
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKPolyline * ruta = overlay;
    MKPolylineRenderer * rutaRender = [[MKPolylineRenderer alloc] initWithPolyline:ruta];
    rutaRender.strokeColor = [UIColor redColor];
    return rutaRender;
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    IconAnnotationView * icon = [[[NSBundle mainBundle] loadNibNamed:@"IconAnnotationView" owner:self options:nil] objectAtIndex:0];
    return icon;

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    MKCoordinateRegion region;
    region.center.latitude = 4.60971;
    region.center.longitude = -74.08175;
    region.span.latitudeDelta = 5;
    region.span.longitudeDelta = 5;
    [_mapView setRegion:region];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
