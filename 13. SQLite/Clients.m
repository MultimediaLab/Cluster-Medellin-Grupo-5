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
-(void)searchClientInDatabase{
    [self searchPathOfDatabase];
    const char * db = [_databasePath UTF8String];
    sqlite3_stmt * query;
    if (sqlite3_open(db, &clientesdb)==SQLITE_OK) {
        NSString * select = [NSString stringWithFormat:@"SELECT * FROM Clients WHERE CL_NAME = \"%@\"", _clName];
        const char * select_sql = [select UTF8String];
        if (sqlite3_prepare_v2(clientesdb, select_sql, -1, &query, NULL)==SQLITE_OK) {
            if (sqlite3_step(query)==SQLITE_ROW) {
                _status= @"Registro encontrado";
                _clId = [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 0)];
                _clName = [NSString stringWithFormat:@"%s",sqlite3_column_text(query, 1)];
                _clNIT = [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 2)];
                _clAdress =[NSString stringWithFormat:@"%s", sqlite3_column_text(query, 3)];
                _clPhone = [NSString stringWithFormat:@"%s", sqlite3_column_text(query, 4)];
            }
            else{
                _clPhone=_clAdress=_clNIT=_clName=_clId=@"---------------";
                _status = @"Registro no econtrado";
            }
        }else{
            _status = @"Error en el query";
        }
        sqlite3_finalize(query);
        sqlite3_close(clientesdb);
    }
}

- (void)updateClientInDatabase{
    [self searchPathOfDatabase];
    sqlite3_stmt * statement;
    const char * db = [_databasePath UTF8String];
    if (sqlite3_open(db,&clientesdb)==SQLITE_OK){
        
        NSString * update = [[NSString alloc] initWithFormat:@"UPDATE Clients SET CL_NAME = \"%@\" , CL_NIT = \"%@\", CL_ADRESS = \"%@\", CL_PHONE = \"%@\" WHERE ID = %@",_clName,_clNIT,_clAdress, _clPhone, _clId];
        const char * update_sql = [update UTF8String];
        
        sqlite3_prepare_v2(clientesdb,update_sql,-1,&statement,NULL);
        if (sqlite3_step(statement)==SQLITE_DONE) {
            _status = @"Registro Actualizado con Exito!!";
        } else {
            _status = @"Error al actualizar registro";
        }
    }
    
}
- (void)deleteClientInDatabase{
    [self searchPathOfDatabase];
    sqlite3_stmt * statement;
    const char * db = [_databasePath UTF8String];
    if (sqlite3_open(db,&clientesdb)==SQLITE_OK){
        NSString * delete = [[NSString alloc] initWithFormat:@"DELETE FROM Clients WHERE CL_NAME = \"%@\"",_clName];
        const char * delete_sql = [delete UTF8String];
        sqlite3_prepare_v2(clientesdb,delete_sql,-1,&statement,NULL);
        if (sqlite3_step(statement)==SQLITE_DONE) {
            _status = @"Registro Eliminado con Exito!!";
        } else {
            _status = @"Error al eliminar registro";
        }
    }
}

@end
