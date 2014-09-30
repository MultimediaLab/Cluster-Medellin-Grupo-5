//
//  ConfigViewController.h
//  Ejercicio Conversor
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ConfigViewControllerDelegate <NSObject>


@required
-(void)changeSliders:(float)min andMax:(float)max;

@end

@interface ConfigViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *maxText;
@property (strong, nonatomic) IBOutlet UITextField *minText;

- (IBAction)saveButton:(id)sender;

@property id <ConfigViewControllerDelegate> delegate;

@end
