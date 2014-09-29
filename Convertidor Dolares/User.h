//
//  User.h
//  Convertidor Dolares
//
//  Created by Profesor on 27/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString * userName;
@property NSString * userPass;

-(BOOL)validateUser;

@end
