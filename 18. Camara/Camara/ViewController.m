//
//  ViewController.m
//  Camara
//
//  Created by Profesor on 11/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView * error = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El dispositivo no tiene camara disponible" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [error show];
    }
}
- (IBAction)tomarFoto:(id)sender {
    UIImagePickerController * pickerImage = [[UIImagePickerController alloc] init];
    pickerImage.delegate = self;
    pickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [pickerImage setCameraDevice:UIImagePickerControllerCameraDeviceRear];
    [self presentViewController:pickerImage animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage * imagenCapturada = info[UIImagePickerControllerOriginalImage];
    _imageView.image = imagenCapturada;
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(imagenCapturada, nil, nil, nil);
    }
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)seleccionarFoto:(id)sender {
    UIImagePickerController * seleccionarFoto = [[UIImagePickerController alloc] init];
    seleccionarFoto.delegate = self;
    seleccionarFoto.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:seleccionarFoto animated:YES completion:nil];
}


@end
