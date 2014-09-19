//
//  ViewController.h
//  ValidarEdad
//
//  Created by Profesor on 18/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController
{
    Person * user;
}

@property (strong, nonatomic) IBOutlet UITextField *userText;

@property (strong, nonatomic) IBOutlet UITextField *ageText;

@property (strong, nonatomic) IBOutlet UILabel *result;

- (IBAction)validateAge:(id)sender;

@end

