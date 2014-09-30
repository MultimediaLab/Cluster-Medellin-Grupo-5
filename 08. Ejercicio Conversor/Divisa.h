//
//  Divisa.h
//  Ejercicio Conversor
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Divisa : NSObject{
    float min;
    float max;
}

-(NSString *) currencyConverter:(float)pesos andOther:(float)other;

-(BOOL)validateConfig;

-(void)setMin : (float)value;

-(float)getMin;

-(void)setMax : (float)value;

-(float)getMax;

@end
