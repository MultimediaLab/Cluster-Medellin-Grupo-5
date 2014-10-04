//
//  Clients.h
//  SQLite
//
//  Created by Profesor on 4/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Clients : NSObject
{
    sqlite3 * clientesdb;
}
@property NSString * clId;
@property NSString * clName;
@property NSString * clNIT;
@property NSString * clAdress;
@property NSString * clPhone;

@property NSString * status;

-(void)createDatabaseInDocuments;
-(void)searchPathOfDatabase;

//Adicionar
-(void)insertClientInDatabase;

@end
