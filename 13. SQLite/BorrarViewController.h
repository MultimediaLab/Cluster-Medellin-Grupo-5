//
//  BorrarViewController.h
//  SQLite
//
//  Created by Profesor on 7/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Clients.h"

@interface BorrarViewController : UIViewController
@property Clients * deleteClient;

@property (strong, nonatomic) IBOutlet UITextField *txtSearch;
- (IBAction)deleteClient:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *result;

@end
