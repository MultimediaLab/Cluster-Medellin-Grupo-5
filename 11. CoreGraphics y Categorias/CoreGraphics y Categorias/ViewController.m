//
//  ViewController.m
//  CoreGraphics y Categorias
//
//  Created by Profesor on 2/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeShape:(id)sender {
    UISegmentedControl * control = sender;
    
    [(PintorView*)self.view setShapeType:(int)[control selectedSegmentIndex]];
}
@end
