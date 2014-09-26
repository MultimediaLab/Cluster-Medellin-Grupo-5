//
//  FileDownload.h
//  DescargaProtocolosYDelegados
//
//  Created by Profesor on 25/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileDownloadDelegate.h"

@interface FileDownload : NSObject <NSURLConnectionDataDelegate>

@property id <FileDownloadDelegate> delegate;

-(void) downloadInit:(NSString*)url withName:(NSString*)name;
-(NSString*) deleteFile:(NSString*)file;




@end
