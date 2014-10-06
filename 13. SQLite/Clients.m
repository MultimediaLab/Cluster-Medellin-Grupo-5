//
//  Clients.m
//  SQLite
//
//  Created by Profesor on 4/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "Clients.h"

@interface Clients ()
@property NSString * databasePath;
@end

@implementation Clients
-(void)searchPathOfDatabase{
    NSString * rutaDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    _databasePath = [[NSString alloc] initWithString:[rutaDoc stringByAppendingPathComponent:@"clients.db"]];
    NSLog(@"%@", _databasePath);
}

-(void)createDatabaseInDocuments{
    [self searchPathOfDatabase];
    NSFileManager * fm = [[NSFileManager alloc] init];
    if ([fm fileExistsAtPath:_databasePath]==NO) {
        NSLog(@"El archivo no existe");
        const char * dbpath = [_databasePath UTF8String];
        if (sqlite3_open(dbpath, &clientesdb)==SQLITE_OK) {
            NSLog(@"La base de datos se creo exitosamente");
            char * error;
            const char * sql_stmt = "CREATE TABLE IF NOT EXISTS Clients (ID INTEGER PRIMARY KEY AUTOINCREMENT, CL_NAME TEXT, CL_NIT TEXT, CL_ADRESS TEXT, CL_PHONE TEXT)";
            if (sqlite3_exec(clientesdb, sql_stmt, NULL, NULL, &error)==SQLITE_OK) {
                NSLog(@"Tabla Creada Exitosamente");
            }else{
                NSLog(@"Error en crear tabla: %s", error);
            }
            sqlite3_close(clientesdb);
        }
        else{
            NSLog(@"La base de datos no se pudo crear");
        }
    }else{
        NSLog(@"El archivo ya existe");
    }
}
-(void)insertClientInDatabase{
    [self searchPathOfDatabase];
    sqlite3_stmt * query;
    const char * db = [_databasePath UTF8String];
    if (sqlite3_open(db, &clientesdb)==SQLITE_OK) {
        NSString * insert = [NSString stringWithFormat:@"INSERT INTO Clients (CL_NAME, CL_NIT, CL_ADRESS, CL_PHONE) VALUES (\"%@\",\"%@\",\"%@\",\"%@\")", _clName, _clNIT, _clAdress, _clPhone];
        const char * insertsql = [insert UTF8String];
        
        sqlite3_prepare_v2(clientesdb, insertsql, -1, &query, NULL);
        if (sqlite3_step(query)== SQLITE_DONE) {
            _status = @"Registro Almacenado";
        }
        else{
            _status = @"Error al almacenar registro";
        }
        sqlite3_finalize(query);
        sqlite3_close(clientesdb);
    }else{
        NSLog(@"No se pudo abrir la base de datos");
    }
}

@end
