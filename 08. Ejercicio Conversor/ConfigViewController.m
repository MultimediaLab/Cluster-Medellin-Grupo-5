//
//  ConfigViewController.m
//  Ejercicio Conversor
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ConfigViewController.h"
#import "Divisa.h"
@interface ConfigViewController ()

@end

@implementation ConfigViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButton:(id)sender {
    Divisa * div =[[Divisa alloc]init];
    
    [div setMin:[_minText.text floatValue]];
    
    [div setMax:[_maxText.text floatValue]];
    
    if( [div validateConfig]){
        
        
    [self dismissViewControllerAnimated:YES completion:nil];
        
    [self.delegate changeSliders:[_minText.text floatValue] andMax:[_maxText.text floatValue]];
        
    }else
    {
        UIAlertView * alerta= [[UIAlertView alloc] initWithTitle:@"Error" message:@"Datos Incorrectos" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [alerta  show];
    }
}
@end
