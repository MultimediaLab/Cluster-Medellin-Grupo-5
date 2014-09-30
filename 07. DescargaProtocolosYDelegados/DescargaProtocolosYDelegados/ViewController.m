//
//  ViewController.m
//  DescargaProtocolosYDelegados
//
//  Created by Profesor on 25/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//MEtodos del Protocolo FileDownloadDelegate
-(void)downloadFinishLoading:(NSString *)filepath andName:(NSString *)name{
    NSLog(@"Descarga en Archivo Exitosa");
    NSData * datosImagen = [NSData dataWithContentsOfFile:filepath];
    _imageFile.image = [UIImage imageWithData:datosImagen];
    
}
-(void)downloadDidFinishLoading:(NSString *)name{
    NSLog(@"Descarga en Memoria Exitosa");
}
-(void)downloadChangeLoading:(NSURLConnection *)connection didReceiveData:(NSData *)data andProgress:(float)progress{
    _progressFile.progress = progress;
}
-(void)downloadInitLoading:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"Inicia Descarga");
}
-(void)downloadFinishLoading:(NSURLConnection *)connection didFailWithError:(NSError *)error andName:(NSString *)name{
    NSLog(@"%@", error);
}
- (IBAction)downloadImage:(id)sender {
    FileDownload * file = [[FileDownload alloc] init];
    [file downloadInit:@"http://upload.wikimedia.org/wikipedia/commons/f/f5/Metro_de_Medell%C3%ADn,_Colombia.jpg" withName:@"foto.jpg"];
    file.delegate= self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
