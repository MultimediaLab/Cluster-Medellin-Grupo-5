//
//  ViewController.h
//  Convertidor Dolares
//
//  Created by Profesor on 27/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ViewController : UIViewController {
    
    User * user;
}

@property (strong, nonatomic) IBOutlet UITextField *userNameText;
@property (strong, nonatomic) IBOutlet UITextField *userPassText;

@end

