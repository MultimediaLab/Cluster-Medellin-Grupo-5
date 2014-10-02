//
//  PintorView.m
//  CoreGraphics y Categorias
//
//  Created by Profesor on 2/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "PintorView.h"

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










@end
