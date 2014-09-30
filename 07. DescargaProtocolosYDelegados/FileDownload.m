//
//  FileDownload.m
//  DescargaProtocolosYDelegados
//
//  Created by Profesor on 25/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "FileDownload.h"

@interface FileDownload()
{
    float progress;
}
@property long long expectedLength;
@property NSMutableData * fileData;
@property NSString * fileName;

@end


@implementation FileDownload

//Metodos del Protocolo NSURLConnectionDataDelegate
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _expectedLength = [response expectedContentLength];
    progress = 0;
    [self.delegate downloadInitLoading:connection didReceiveResponse:response];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    progress += [data length];
    [_fileData appendData:data];
    [self.delegate downloadChangeLoading:connection didReceiveData:data andProgress:(progress/(float)_expectedLength)];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [self.delegate downloadDidFinishLoading:_fileName];
    
    //Metodo que me guarde el archivo
    [self saveFile:_fileData withName:_fileName];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [self.delegate downloadFinishLoading:connection didFailWithError:error andName:_fileName];
}


//Metodo Propio que Incia Descarga
-(void)saveFile:(NSData*)imageData withName:(NSString*)name{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * ruta = [paths objectAtIndex:0];

    NSLog(@"%@", ruta);
    
    NSString * carpetaFotos = [ruta stringByAppendingPathComponent:@"/file"];
    
    BOOL isDir = NO;
    NSFileManager * fileManager = [[NSFileManager alloc] init];
    if (![fileManager fileExistsAtPath:carpetaFotos isDirectory:&isDir] && isDir==NO) {
        [fileManager createDirectoryAtPath:carpetaFotos withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString * archivo = [carpetaFotos stringByAppendingPathComponent:name];
    NSError * error = nil;
    
    [imageData writeToFile:archivo options:NSDataWritingAtomic error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        [_delegate downloadFinishLoading:nil didFailWithError:error andName:name];
    }
    
    [_delegate downloadFinishLoading:archivo andName:_fileName];
}

-(void)downloadInit:(NSString *)url withName:(NSString *)name{
    _fileName = name;
    _fileData = [[NSMutableData alloc] init];
    
    NSURL * urlData = [NSURL URLWithString:url];
    NSURLRequest * request = [NSURLRequest requestWithURL:urlData];
    
    NSURLConnection * conexion = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [conexion start];
}
-(NSString *)deleteFile:(NSString *)file{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * ruta = [paths objectAtIndex:0];
    NSString * carpetaFotos = [ruta stringByAppendingPathComponent:@"/file"];
    
    NSString * rutaBorrar = [carpetaFotos stringByAppendingString:file];
    
    NSFileManager * borrar = [[NSFileManager alloc] init];
    
    NSError * error = nil;
    
    [borrar removeItemAtPath:rutaBorrar error:&error];
    
    if (error) {
        NSLog(@"%@", error);
    }
    
    return [NSString stringWithFormat:@"Borrado Exitoso!!"];
}
@end




