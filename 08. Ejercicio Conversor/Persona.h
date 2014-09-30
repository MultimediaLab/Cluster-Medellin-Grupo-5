//
//  Persona.h
//  Ejercicio Conversor
//
//  Created by Profesor on 28/08/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Persona : NSObject

@property NSString * userName;
@property NSString * password;

-(BOOL)validateUserLogin;

@end
