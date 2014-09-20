//
//  FourthViewController.h
//  Convertidor
//
//  Created by Profesor on 20/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Temperature.h"

@interface FourthViewController : UIViewController
{
    Temperature * conversor;
    
}
@property (strong, nonatomic) IBOutlet UITextField *dataToConvert;

- (IBAction)convertDataToF:(id)sender;
- (IBAction)convertDatatoK:(id)sender;




@property (strong, nonatomic) IBOutlet UILabel *convertResult;
@end
