//
//  AlertasViewController.m
//  Alertas y Segues
//
//  Created by Profesor on 23/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "AlertasViewController.h"

@interface AlertasViewController ()
{
    UIAlertView * alerta;
}

@end

@implementation AlertasViewController

- (IBAction)alertSimple:(id)sender {
    alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Hola iOS, soy un error" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: @"Cancelar", @"Omitir", nil];
    alerta.tag=1;
    [alerta show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
        switch (buttonIndex) {
            case 0:
                NSLog(@"Clic en Aceptar");
                break;
            case 1:
                NSLog(@"Clic en Cancelar");
                break;
            case 2:
                NSLog(@"Clic en Omitir");
                break;
        }
    } else if (alertView.tag == 2)
    {
        switch (buttonIndex) {
            case 0:
                NSLog(@"Clic en Cerrar");
                break;
            case 1:
                NSLog(@"Clic en Ingresar, usuario: %@, contraseña: %@", [alertView textFieldAtIndex:0].text, [alertView textFieldAtIndex:1].text);
                break;
        }
    }
}
- (IBAction)alertOptions:(id)sender {
    alerta = [[UIAlertView alloc] initWithTitle:@"Error 2" message:@"Hola iOS, soy un error 2" delegate:self cancelButtonTitle:@"Cerrar" otherButtonTitles: @"Ingresar", nil];
    alerta.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    alerta.tag=2;
    [alerta show];
    
}
- (IBAction)actionSheet:(id)sender {
    UIActionSheet * options = [[UIActionSheet alloc] initWithTitle:@"Opciones" delegate:self cancelButtonTitle:@"Cerrar" destructiveButtonTitle:@"Eliminar" otherButtonTitles:@"Enviar", @"Aceptar", @"Compartir", nil];
    [options showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _nameLabel.text = _nameValue;
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

- (IBAction)exitView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}






@end
