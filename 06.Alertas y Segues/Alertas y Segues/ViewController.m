//
//  ViewController.m
//  Alertas y Segues
//
//  Created by Profesor on 23/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"
#import "AlertasViewController.h"

@interface ViewController ()
{
    AlertasViewController * secondView;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //secondView = [segue destinationViewController];
    secondView = [[segue.destinationViewController viewControllers] objectAtIndex:0];
    
    secondView.nameValue = _nameUser.text;
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if ([_passUser.text isEqualToString:@"1234"]) {
        return YES;
    }
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
