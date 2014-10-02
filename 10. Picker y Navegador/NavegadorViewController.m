//
//  NavegadorViewController.m
//  Picker y Navegador
//
//  Created by Profesor on 30/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "NavegadorViewController.h"

@interface NavegadorViewController ()

@end

@implementation NavegadorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _navegador.delegate = self;
    _animacion.hidden=YES;
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

- (IBAction)htmlButton:(id)sender {
    NSString * html = @"<h1>Esto es HTML </h1><p style='color:red;'>Contenido en html</p>";
    [_navegador loadHTMLString:html baseURL:nil];
}

- (IBAction)jsButton:(id)sender {
    NSString * js = @"alert('Hola desde JS');";
    [_navegador stringByEvaluatingJavaScriptFromString:js];
}

- (IBAction)webButton:(id)sender {
    NSURL * url = [[NSURL alloc] initWithString:@"http://eltiempo.com"];
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    _navegador.scalesPageToFit = NO;
    [_navegador loadRequest:request];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    _animacion.hidden=NO;
    [_animacion startAnimating];

}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_animacion stopAnimating];
    _animacion.hidden=YES;
}

- (IBAction)pdfButton:(id)sender {
    
    NSString * ruta = [[NSBundle mainBundle] pathForResource:@"350-2013" ofType:@"pdf"];
    NSData * datos = [[NSData alloc] initWithContentsOfFile:ruta];
    _navegador.scalesPageToFit = YES;
    
    [_navegador loadData:datos MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
}
@end
