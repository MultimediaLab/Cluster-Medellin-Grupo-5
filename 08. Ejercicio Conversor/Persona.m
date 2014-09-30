//
//  Persona.m
//  Ejercicio Conversor
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "Persona.h"

@implementation Persona

-(BOOL)validateUserLogin{
    if([_userName isEqual:@"pepe"] && [_password isEqual:@"123"]){
        return YES;
    }
    return NO;
}

@end
