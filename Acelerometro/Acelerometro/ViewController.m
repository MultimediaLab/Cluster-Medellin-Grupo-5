//
//  ViewController.m
//  Acelerometro
//
//  Created by Profesor on 14/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    double currentAccx;
    double currentAccy;
    double currentAccz;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    currentAccx = 0;
    currentAccy = 0;
    currentAccz = 0;
    
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.accelerometerUpdateInterval = 1;
    
    [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        [self outputAccelerationData:accelerometerData.acceleration];
        if (error) {
            NSLog(@"%@", error);
        }
    }];
    
    [_motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
        [self outputRotationData:gyroData.rotationRate];
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}
-(void)outputRotationData:(CMRotationRate)rotation{
    _rotX.text = [NSString stringWithFormat:@"%.2f", rotation.x];
    _rotY.text = [NSString stringWithFormat:@"%.2f", rotation.y];
    _rotZ.text = [NSString stringWithFormat:@"%.2f", rotation.z];
    
}

-(void)outputAccelerationData:(CMAcceleration)aceleration{
    _accX.text = [NSString stringWithFormat:@"%.2f", aceleration.x];
    _accY.text = [NSString stringWithFormat:@"%.2f", aceleration.y];
    _accZ.text = [NSString stringWithFormat:@"%.2f", aceleration.z];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
