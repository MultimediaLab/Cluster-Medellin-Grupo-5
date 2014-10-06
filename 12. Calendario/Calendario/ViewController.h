//
//  ViewController.h
//  Calendario
//
//  Created by Profesor on 4/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "CalendarViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDelegate>

@property Model * modelo;
@property UIPageViewController * page;

@end

