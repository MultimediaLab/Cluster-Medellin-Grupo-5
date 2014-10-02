//
//  ViewController.h
//  Picker y Navegador
//
//  Created by Profesor on 30/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *pickerPaises;
@property (strong, nonatomic) IBOutlet UITextField *textDate;
@property (strong, nonatomic) IBOutlet UIDatePicker *pickerFechas;
- (IBAction)fechaCambio:(id)sender;

@property NSArray * paises;


@end

