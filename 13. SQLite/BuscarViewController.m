//
//  BuscarViewController.m
//  SQLite
//
//  Created by Profesor on 7/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "BuscarViewController.h"

@interface BuscarViewController ()

@end

@implementation BuscarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _buscarCliente =[[Clients alloc] init];
}




- (IBAction)searchClient:(id)sender {
    
    
    _buscarCliente.clName = _textSearch.text;
    [_buscarCliente searchClientInDatabase];
    
    _nameClient.text = _buscarCliente.clName;
    _nitClient.text = _buscarCliente.clNIT;
    _adressClient.text =_buscarCliente.clAdress;
    _phoneClient.text = _buscarCliente.clPhone;
    
    _result.text = _buscarCliente.status;
    [self.view endEditing:YES];
    
}
@end
