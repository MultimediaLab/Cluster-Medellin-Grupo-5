//
//  FourthViewController.m
//  Convertidor
//
//  Created by Profesor on 20/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    conversor = [[Temperature alloc] init];
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
- (IBAction)convertDataToF:(id)sender {
    _convertResult.text = [conversor convertKelvinToFarenheit:[_dataToConvert.text floatValue]];
    [self.view endEditing:YES];
}

- (IBAction)convertDatatoK:(id)sender {
    _convertResult.text = [conversor convertFarenheitToKelvin:[_dataToConvert.text floatValue]];
    [self.view endEditing:YES];
}

@end
