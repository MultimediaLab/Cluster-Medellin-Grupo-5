//
//  ThirdViewController.m
//  Convertidor
//
//  Created by Profesor on 20/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)convertDataToK:(id)sender {
    _convertResult.text = [conversor convertCelsiusToKelvin:[_dataToConvert.text floatValue]];
    [self.view endEditing:YES];
}

- (IBAction)convertDatatoC:(id)sender {
    _convertResult.text = [conversor convertKelvinToCelsius:[_dataToConvert.text floatValue]];
    [self.view endEditing:YES];
}

@end
