//
//  ViewController.m
//  Animaciones
//
//  Created by Profesor on 30/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animarSimple:(id)sender {
    UISwitch * control = sender;
    if (control.on) {
        [UIView animateWithDuration:1 animations:^{
            _view1.frame= CGRectMake(_view1.frame.origin.x, _view1.frame.origin.y, _view1.frame.size.width, 172);
           // _view1.alpha=1.0;
        }];
    }else{
        [UIView animateWithDuration:1 animations:^{
            _view1.frame= CGRectMake(_view1.frame.origin.x, _view1.frame.origin.y, _view1.frame.size.width, 0);
            //_view1.alpha=0.0;
        }];
    
    }
}

- (IBAction)animarDoble:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        _view2.backgroundColor = [UIColor blueColor];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            _view2.alpha = 0.0;
        }];
    }];
}

- (IBAction)animarOpciones:(id)sender {
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        _view2.alpha= 0.0;
    } completion:nil];
}

- (IBAction)stopAnimatios:(id)sender {
    [_view2.layer removeAllAnimations];
    _view2.alpha=1.0;
}




















@end
