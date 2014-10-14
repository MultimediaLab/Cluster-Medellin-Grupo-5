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


//AUDIOS
@property AVAudioPlayer * jejeje;
@property AVAudioPlayer * mordisco;


@end

