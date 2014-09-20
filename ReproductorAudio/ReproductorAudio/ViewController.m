//
//  ViewController.m
//  ReproductorAudio
//
//  Created by Profesor on 20/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer * progressTimer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"musica" ofType:@"mp3"];
    NSError * error;
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    
    _reproductor = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    _reproductor.volume = 1;
    _reproductor.pan = 0.5;
    _reproductor.rate= 1;
    _reproductor.enableRate = YES;
    _reproductor.numberOfLoops = -1;
    _reproductor.delegate = self;
    [_reproductor prepareToPlay];
}
- (IBAction)playButton:(id)sender {
    [_reproductor play];
    progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgressBar) userInfo:nil repeats:YES];
}
-(void)updateProgressBar{
    _progreso.progress = _reproductor.currentTime/_reproductor.duration;
    
}
- (IBAction)pauseButton:(id)sender {
    [_reproductor pause];
}

- (IBAction)stopButton:(id)sender {
    _reproductor.currentTime = 0;
    [_reproductor stop];
    [progressTimer invalidate];
    _progreso.progress = 0;

}

- (IBAction)volumeSlider:(id)sender {
   /* UISlider * control = sender;
    _reproductor.volume = control.value;*/
    
    _reproductor.volume = ((UISlider*)sender).value;
    
}

- (IBAction)switchOptions:(id)sender {
    UISwitch * control = sender;
    _options.hidden = !control.on;
}

- (IBAction)rateSlider:(id)sender {
    _reproductor.rate = ((UISlider *)sender).value;
}


@end
