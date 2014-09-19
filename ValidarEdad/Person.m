//
//  Person.m
//  ValidarEdad
//
//  Created by Profesor on 18/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "Person.h"

@implementation Person
-(int)readAge{
    return age;
}
-(void)setAge:(int)value{
    age = value;
}

-(NSString *)readName{
    return name;
}
-(void)setName:(NSString *)value{
    name = value;
}
-(BOOL)isThisPersonAdult{
    if (age>=18) {
        return YES;
    }
    return NO;
}
@end
