//
//  ThirdViewController.h
//  Convertidor
//
//  Created by Profesor on 20/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Temperature.h"

@interface ThirdViewController : UIViewController
{
    Temperature * conversor;
    
}
@property (strong, nonatomic) IBOutlet UITextField *dataToConvert;

- (IBAction)convertDataToK:(id)sender;
- (IBAction)convertDatatoC:(id)sender;




@property (strong, nonatomic) IBOutlet UILabel *convertResult;

@end
