//
//  ViewController.h
//  Brujula
//
//  Created by Profesor on 14/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *compassImage;
@property CLLocationManager * locationManager;


@end

