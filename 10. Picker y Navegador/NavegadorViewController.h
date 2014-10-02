//
//  NavegadorViewController.h
//  Picker y Navegador
//
//  Created by Profesor on 30/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavegadorViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *animacion;
@property (strong, nonatomic) IBOutlet UIWebView *navegador;
- (IBAction)htmlButton:(id)sender;
- (IBAction)jsButton:(id)sender;
- (IBAction)webButton:(id)sender;
- (IBAction)pdfButton:(id)sender;

@end
