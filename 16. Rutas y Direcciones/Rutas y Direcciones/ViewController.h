
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    MKPolyline * linea;
    MKRoute * currentRoute;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (strong, nonatomic) IBOutlet UIButton *routeButton;

- (IBAction)handleRoute:(id)sender;



@end

