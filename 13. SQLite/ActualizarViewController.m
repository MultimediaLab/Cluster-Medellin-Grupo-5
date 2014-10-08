//
//  ActualizarViewController.m
//  SQLite
//
//  Created by Profesor on 7/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ActualizarViewController.h"

@interface ActualizarViewController ()

@end

@implementation ActualizarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _buscarCliente = [[Clients alloc] init];

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

- (IBAction)searchClient:(id)sender {
    _buscarCliente.clName = _searchText.text;
    [_buscarCliente searchClientInDatabase];
    
    _nameTxt.text = _buscarCliente.clName;
    _nitTxt.text = _buscarCliente.clNIT;
    _adressTxt.text =_buscarCliente.clAdress;
    _phoneTxt.text = _buscarCliente.clPhone;
    
    _resultTxt.text = _buscarCliente.status;
    [self.view endEditing:YES];
}
- (IBAction)updateClient:(id)sender{
    _buscarCliente.clName = _nameTxt.text;
    _buscarCliente.clNIT = _nitTxt.text;
    _buscarCliente.clAdress = _adressTxt.text;
    _buscarCliente.clPhone = _phoneTxt.text;
    
    [_buscarCliente updateClientInDatabase];
    
    _resultTxt.text = _buscarCliente.status;
    [self.view endEditing:YES];

}
@end
