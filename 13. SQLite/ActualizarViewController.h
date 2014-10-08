//
//  ActualizarViewController.h
//  SQLite
//
//  Created by Profesor on 7/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Clients.h"

@interface ActualizarViewController : UIViewController

@property Clients * buscarCliente;
@property (strong, nonatomic) IBOutlet UITextField *searchText;

@property (strong, nonatomic) IBOutlet UITextField *nameTxt;
@property (strong, nonatomic) IBOutlet UITextField *nitTxt;
@property (strong, nonatomic) IBOutlet UITextField *adressTxt;

@property (strong, nonatomic) IBOutlet UITextField *phoneTxt;
@property (strong, nonatomic) IBOutlet UILabel *resultTxt;
- (IBAction)updateClient:(id)sender;
- (IBAction)searchClient:(id)sender;

@end
