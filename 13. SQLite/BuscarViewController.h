//
//  BuscarViewController.h
//  SQLite
//
//  Created by Profesor on 7/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Clients.h"

@interface BuscarViewController : UIViewController

@property Clients * buscarCliente;

@property (strong, nonatomic) IBOutlet UITextField *textSearch;
- (IBAction)searchClient:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *nameClient;
@property (strong, nonatomic) IBOutlet UILabel *nitClient;
@property (strong, nonatomic) IBOutlet UILabel *adressClient;
@property (strong, nonatomic) IBOutlet UILabel *phoneClient;
@property (strong, nonatomic) IBOutlet UILabel *result;

@end
