//
//  ViewController.m
//  ValidarEdad
//
//  Created by Profesor on 18/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _result.text = @"";
    /*user = [[Person alloc] init];
    [user setName:@"James Rodriguez"];
    [user setAge:20];
    
    if ([user isThisPersonAdult]) {
        NSLog(@"%@ es adulto", [user readName]);
    }else{
        NSLog(@"%@ es menor de edad", [user readName]);
    }*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)validateAge:(id)sender {
    user = [[Person alloc] init];
    
    [user setName:_userText.text];
    [user setAge:[_ageText.text intValue]];
    
    if ([user isThisPersonAdult]) {
        _result.text = [NSString stringWithFormat:@"%@ tiene %i años y si es mayor de edad", [user readName], [user readAge]];
    }else{
        _result.text = [NSString stringWithFormat:@"%@ tiene %i años y no es mayor de edad", [user readName], [user readAge]];
    }
    [self.view endEditing:YES];
}
@end
