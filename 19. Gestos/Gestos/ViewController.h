//
//  ViewController.h
//  Gestos
//
//  Created by Profesor on 11/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

//GESTOS
//TAP
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
- (IBAction)handleTap:(id)sender;

//PINCH
@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGesture;
- (IBAction)handlePinch:(id)sender;

//PAN
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
- (IBAction)handlePan:(id)sender;

//ROTATION
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *rotationGesture;
- (IBAction)handleRotation:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *mico;


//AUDIOS
@property AVAudioPlayer * jejeje;
@property AVAudioPlayer * mordisco;


@end

