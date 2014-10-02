//
//  ViewController.m
//  Picker y Navegador
//
//  Created by Profesor on 30/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   /* _pickerPaises.delegate = self;
    _pickerPaises.dataSource = self;*/
    
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"Paises" ofType:@"plist"];
    _paises = [[NSArray alloc] initWithContentsOfFile:ruta];
    
    //NSLog(@"%@", _paises);
    
    
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_paises count];

}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_paises objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
        
    UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Opcion Seleccionada" message:[_paises objectAtIndex:row] delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
    [alerta show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fechaCambio:(id)sender {
    UIDatePicker * control = sender;

    _textDate.text = [NSString stringWithFormat:@"%@", control.date ];
}
@end
