#import <Foundation/Foundation.h>
@protocol FileDownloadDelegate <NSObject>

@required

//Metodo finaliza la descarga del archivo con la ruta y nombre
-(void)downloadFinishLoading:(NSString*)filepath andName:(NSString*)name;
//Metodo finaliza la descarga y tengo el nombre del archivo en memoria.
-(void)downloadDidFinishLoading:(NSString*)name;
//Metodo comienza la descarga
-(void)downloadChangeLoading:(NSURLConnection*)connection didReceiveData:(NSData*)data andProgress:(float)progress;
//Metodo Inicia la descarga
-(void)downloadInitLoading:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response;

@optional
//Metodo finaliza la descarga con error
-(void)downloadFinishLoading:(NSURLConnection*)connection didFailWithError:(NSError*)error andName:(NSString*)name;

@end
