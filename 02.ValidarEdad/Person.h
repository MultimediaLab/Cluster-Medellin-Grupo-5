//
//  Person.h
//  ValidarEdad
//
//  Created by Profesor on 18/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString * name;
    int age;
    NSString * city;
}

//Metodos Leer y Modificar name (GET y SET)
-(NSString*)readName;
-(void)setName:(NSString*)value;

//Metodos Leer y Modificar age (GET y SET)
-(int)readAge;
-(void)setAge:(int)value;

-(BOOL) isThisPersonAdult;

@end
