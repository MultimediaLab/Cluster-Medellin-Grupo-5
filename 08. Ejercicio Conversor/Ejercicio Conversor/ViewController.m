//
//  ViewController.m
//  Ejercicio Conversor
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"
#import "Persona.h"
#import "DivisaViewController.h"

@interface ViewController (){

    Persona *usuario;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    usuario=[[Persona alloc]init];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UIView * view in self.view.subviews) {
        [view resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DivisaViewController* segunda=[segue destinationViewController];
    segunda.uName=_userText.text;
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    usuario.userName=_userText.text;
    usuario.password=_passwordText.text;
    if ([usuario validateUserLogin]) {
        return YES;
    }
    UIAlertView *alerta=[[UIAlertView alloc] initWithTitle:@"ERROR!" message:@"usuario o contraseña incorrectas!" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
    [alerta show];
    return NO;
    

}
@end
