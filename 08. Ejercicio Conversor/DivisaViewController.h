//
//  DivisaViewController.h
//  Ejercicio Conversor
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Divisa.h"
#import "ConfigViewController.h"

@interface DivisaViewController : UIViewController <ConfigViewControllerDelegate>{
    ConfigViewController * config;

}



@property NSString* uName;

@property (strong, nonatomic) IBOutlet UILabel *SaludoUsuario;

@property (strong, nonatomic) IBOutlet UITextField *valorpesos;



- (IBAction)cambiarslider:(id)sender;

@property (strong, nonatomic) IBOutlet UISlider *slider;

@property (strong, nonatomic) IBOutlet UILabel *mintext;



@property (strong, nonatomic) IBOutlet UILabel *currenttext;

@property (strong, nonatomic) IBOutlet UILabel *maxtext;

- (IBAction)salirbttn:(id)sender;



@property (strong, nonatomic) IBOutlet UILabel *resultadotext;



@end
