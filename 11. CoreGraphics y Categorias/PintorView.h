//
//  PintorView.h
//  CoreGraphics y Categorias
//
//  Created by Profesor on 2/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface PintorView : UIView

@property CGPoint firstTouch;
@property CGPoint lastTouch;

@property (nonatomic) CGRect currentRect;
@property CGRect redrawRect;

@property UIColor * currentColor;
@property BOOL useRandomColor;

@property ShapeType shapeType;
@property UIImage * drawImage;

@end
