//
//  ViewController.m
//  Convertidor Dolares
//
//  Created by Profesor on 27/09/14.
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

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    user = [[User alloc]init];
    user.userName = _userNameText.text;
    user.userPass = _userPassText.text;
    if([user validateUser]){
        return YES;   
    }
    return NO;
}

@end
