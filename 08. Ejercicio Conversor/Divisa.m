//
//  Divisa.m
//  Ejercicio Conversor
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "Divisa.h"

@implementation Divisa

-(NSString *) currencyConverter:(float)pesos andOther:(float)other{
    
    return [NSString stringWithFormat:@"$ %.02f",pesos/other];
}

-(BOOL)validateConfig{
    if (min>max || min == max) {
        return NO;
    }else{
        return YES;
    }
}

-(void)setMin : (float)value{
    min = value;
}

-(float)getMin{
    return min;
}

-(void)setMax : (float)value{
    max = value;
}

-(float)getMax{
    return max;
}
@end
