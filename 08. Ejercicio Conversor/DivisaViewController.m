//
//  DivisaViewController.m
//  Ejercicio Conversor
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "DivisaViewController.h"

@interface DivisaViewController (){
    Divisa * divi;
}

@end

@implementation DivisaViewController

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
    
    _SaludoUsuario.text = _uName;
    
    divi = [[Divisa alloc]init];
    
    _slider.minimumValue = 1900;
    _slider.maximumValue = 2200;
    
    
   
    
    _mintext.text = [NSString stringWithFormat:@"%.f",_slider.minimumValue];
    
     _maxtext.text = [NSString stringWithFormat:@"%.f",_slider.maximumValue];
    
    
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

- (IBAction)cambiarslider:(id)sender {
    [self.view endEditing:YES];
     _currenttext.text = [NSString stringWithFormat:@"%.f",_slider.value];
    _resultadotext.text =[divi currencyConverter:[_valorpesos.text floatValue] andOther:((UISlider *) sender).value];
}
- (IBAction)salirbttn:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    config=[segue destinationViewController];
    config.delegate=self;

}

-(void)changeSliders:(float)min andMax:(float)max{
    _slider.minimumValue=min;
    _slider.maximumValue=max;
    
    _mintext.text = [NSString stringWithFormat:@"%.f",_slider.minimumValue];
    
    _maxtext.text = [NSString stringWithFormat:@"%.f",_slider.maximumValue];
    
}
@end
