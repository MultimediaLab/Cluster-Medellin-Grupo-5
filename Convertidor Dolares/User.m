//
//  User.m
//  Convertidor Dolares
//
//  Created by Profesor on 27/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "User.h"

@implementation User

-(BOOL)validateUser{
    if([_userName isEqualToString:@"admin"] &&[_userPass isEqualToString:@"123"]){
        return YES;
        
    }
    return NO;
}
@end
