//
//  AdicionarViewController.m
//  SQLite
//
//  Created by Profesor on 4/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "AdicionarViewController.h"

@interface AdicionarViewController ()

@end

@implementation AdicionarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _clientNew = [[Clients alloc] init];
}


- (IBAction)saveClient:(id)sender {
    _clientNew.clName = _nameTxt.text;
    _clientNew.clNIT = _nitTxt.text;
    _clientNew.clAdress = _adressTxt.text;
    _clientNew.clPhone = _phoneTxt.text;
    
    [_clientNew insertClientInDatabase];
    
    _resultTxt.text = _clientNew.status;
    [self.view endEditing:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UIView * vi in self.view.subviews) {
        [vi resignFirstResponder];
    }

}
@end
