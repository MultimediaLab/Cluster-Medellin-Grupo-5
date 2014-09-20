#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    conversor = [[Temperature alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertDataToF:(id)sender {
    _convertResult.text = [conversor convertCelsiusToFarenheit:[_dataToConvert.text floatValue]];
    [self.view endEditing:YES];
}

- (IBAction)convertDatatoC:(id)sender {
    _convertResult.text = [conversor convertFarenheitToCelsius:[_dataToConvert.text floatValue]];
    [self.view endEditing:YES];
}
@end
