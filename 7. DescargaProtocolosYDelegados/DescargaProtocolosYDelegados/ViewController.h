//
//  ViewController.h
//  DescargaProtocolosYDelegados
//
//  Created by Profesor on 25/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileDownload.h"

@interface ViewController : UIViewController <FileDownloadDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userURL;

- (IBAction)downloadImage:(id)sender;
@property (strong, nonatomic) IBOutlet UIProgressView *progressFile;
@property (strong, nonatomic) IBOutlet UIImageView *imageFile;

@end

