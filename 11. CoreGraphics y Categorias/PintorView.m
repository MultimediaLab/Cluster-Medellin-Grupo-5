//
//  PintorView.m
//  CoreGraphics y Categorias
//
//  Created by Profesor on 2/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "PintorView.h"
#import "UIColor+Random.h"

@implementation PintorView

-(CGRect)currentRect{
    return CGRectMake(_firstTouch.x, _firstTouch.y, _lastTouch.x - _firstTouch.x, _lastTouch.y - _firstTouch.y);
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _firstTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    NSLog(@"First x:%f - y:%f", _firstTouch.x, _firstTouch.y );
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    NSLog(@"Last x:%f - y:%f", _lastTouch.x, _lastTouch.y );
    [self setNeedsDisplayInRect:_redrawRect];
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
    NSLog(@"Last x:%f - y:%f", _lastTouch.x, _lastTouch.y );
    [self setNeedsDisplayInRect:_redrawRect];
}


-(void)drawRect:(CGRect)rect{
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetStrokeColorWithColor(context, _currentColor.CGColor);
    CGContextSetFillColorWithColor(context, _currentColor.CGColor);
    
    switch (_shapeType) {
        case kLineShape:
            CGContextMoveToPoint(context, _firstTouch.x, _firstTouch.y);
            CGContextAddLineToPoint(context, _lastTouch.x, _lastTouch.y);
            CGContextStrokePath(context);
            break;
        case kEllipseShape:
            
            CGContextAddEllipseInRect(context, self.currentRect);
            
            //CGContextDrawPath(context, kCGPathStroke);
            CGContextDrawPath(context, kCGPathFillStroke);
            
            break;
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        case kImageShape:
        {
            CGFloat horizontalOffset = _drawImage.size.width/2;
            CGFloat verticalOffset = _drawImage.size.height/2;
            CGPoint drawPoint = CGPointMake(_lastTouch.x-horizontalOffset, _lastTouch.y - verticalOffset);
            [_drawImage drawAtPoint:drawPoint];
        }
        break;
    }
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _drawImage = [UIImage imageNamed:@"icono.png"];
        _currentColor = [UIColor redColor];
        
    }
    return self;
}






@end
