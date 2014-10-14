//
//  ViewController.h
//  JSON
//
//  Created by Profesor on 11/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *idTxt;
@property (strong, nonatomic) IBOutlet UILabel *nameTxt;
@property (strong, nonatomic) IBOutlet UILabel *actividadTxt;
@property (strong, nonatomic) IBOutlet UILabel *fechaTxt;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *animacion;
- (IBAction)sendNotification:(id)sender;

@end

