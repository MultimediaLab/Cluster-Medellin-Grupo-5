//
//  ViewController.m
//  Gestos
//
//  Created by Profesor on 11/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(AVAudioPlayer*)loadAudio:(NSString*)ruta{
    NSURL * url = [[NSBundle mainBundle] URLForResource:ruta withExtension:@"wav"];
    NSError * error;
    AVAudioPlayer * player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!player) {
        NSLog(@"Error");
    }
    else{
        [player prepareToPlay];
    }
    return player;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    _jejeje = [self loadAudio:@"hehehe1"];
    _mordisco = [self loadAudio:@"chomp"];
    [self.view addGestureRecognizer:_tapGesture];

}

- (IBAction)handleTap:(id)sender {
    [_jejeje play];
    UIImage * banana = [UIImage imageNamed:@"object_bananabunch.png"];
    UIImageView * banaView = [[UIImageView alloc] initWithImage:banana];
    UITapGestureRecognizer * gesto = sender;
    CGPoint  puntoTouch = [gesto locationOfTouch:0 inView:gesto.view];
    //banaView.center = CGPointMake(100, 100);
    banaView.center = puntoTouch;
    banaView.userInteractionEnabled = YES;
    [banaView addGestureRecognizer:_pinchGesture];
    [banaView addGestureRecognizer:_panGesture];
    [banaView addGestureRecognizer:_rotationGesture];
    [self.view addSubview:banaView];
}
- (IBAction)handleRotation:(id)sender {
    UIRotationGestureRecognizer * rotate = sender;
    rotate.view.transform = CGAffineTransformRotate(rotate.view.transform, rotate.rotation);
    rotate.rotation = 0;
    
}
- (IBAction)handlePan:(id)sender {
    UIPanGestureRecognizer * pan = sender;
    
    CGPoint tranlationPoint = [pan translationInView:self.view];
    pan.view.center = CGPointMake(pan.view.center.x+tranlationPoint.x, pan.view.center.y+tranlationPoint.y);
    
    [pan setTranslation:CGPointMake(0,0) inView:self.view];
    
    if (pan.view.center.x > _mico.frame.origin.x && pan.view.center.y > _mico.frame.origin.y ) {
        [_mordisco play];
        pan.view.hidden = YES;
        
    }
    
}
- (IBAction)handlePinch:(id)sender {
    UIPinchGestureRecognizer * pinch = sender;
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
    
}














@end
