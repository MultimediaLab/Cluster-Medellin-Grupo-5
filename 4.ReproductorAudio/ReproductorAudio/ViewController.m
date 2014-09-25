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
    NSArray * canciones;
    NSDictionary * cancion1;
    NSDictionary * cancion2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    cancion1 = @{
                 @"file":@"musica",
                 @"img":@"homero.jpg"
                 };
    cancion2 = @{
                 @"file":@"demo",
                 @"img":@"imagen.jpg"
                 };
    
    canciones = @[cancion1, cancion2];
    
    [self loadSong:[cancion1 objectForKey:@"file"] andCover:[cancion1 objectForKey:@"img"]];
}

-(void)loadSong:(NSString*)song andCover:(NSString*)image
{
    NSString * ruta = [[NSBundle mainBundle] pathForResource:song ofType:@"mp3"];
    NSError * error;
    NSURL * url = [[NSURL alloc] initFileURLWithPath:ruta];
    _reproductor = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    _imageCover.image = [UIImage imageNamed:image];
    _reproductor.volume = 1;
    _reproductor.pan = 0.5;
    _reproductor.rate= 1;
    _reproductor.enableRate = YES;
    _reproductor.numberOfLoops = -1;
    _reproductor.delegate = self;
    [_reproductor prepareToPlay];
}


-(NSString*)convertTime:(float)time{
    int minutes = (int)(time/60) % 60;
    int seconds = (int)time % 60;
    return [NSString stringWithFormat:@"%02i:%02i", minutes, seconds];
}
- (IBAction)nextSong:(id)sender {
    [_reproductor stop];
    [self loadSong:[cancion2 objectForKey:@"file"] andCover:[cancion2 objectForKey:@"img"]];
    [_reproductor play];
    
}
- (IBAction)prevSong:(id)sender {
    [_reproductor stop];
    [self loadSong:[cancion1 objectForKey:@"file"] andCover:[cancion1 objectForKey:@"img"]];
    [_reproductor play];
}

- (IBAction)playButton:(id)sender {
    [_reproductor play];
    progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgressBar) userInfo:nil repeats:YES];
}
-(void)updateProgressBar{
    _progreso.progress = _reproductor.currentTime/_reproductor.duration;
    _timerSong.text = [self convertTime:_reproductor.currentTime];
    
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
