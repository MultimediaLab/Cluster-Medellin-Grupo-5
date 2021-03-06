//
//  ViewController.h
//  ReproductorAudio
//
//  Created by Profesor on 20/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <AVAudioPlayerDelegate>

@property AVAudioPlayer * reproductor;

@property (strong, nonatomic) IBOutlet UIImageView *imageCover;

@property (strong, nonatomic) IBOutlet UIProgressView *progreso;

@property (strong, nonatomic) IBOutlet UILabel *timerSong;
- (IBAction)playButton:(id)sender;
- (IBAction)pauseButton:(id)sender;
- (IBAction)stopButton:(id)sender;
- (IBAction)volumeSlider:(id)sender;
- (IBAction)switchOptions:(id)sender;
- (IBAction)rateSlider:(id)sender;
- (IBAction)nextSong:(id)sender;
- (IBAction)prevSong:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *options;

@end

