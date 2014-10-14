//
//  ViewController.m
//  JSON
//
//  Created by Profesor on 11/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

#define kJSONURL [NSURL URLWithString:@"http://api.kivaws.org/v1/loans/search.json?status=fundraising"]
#define kQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _animacion.hidden = NO;
    [_animacion startAnimating];
    
    dispatch_async(kQueue, ^{
        NSData * data = [NSData dataWithContentsOfURL:kJSONURL];
        [self performSelectorOnMainThread:@selector(imprimirDatos:) withObject:data waitUntilDone:YES];
    });
}
-(void)imprimirDatos:(NSData *)response{
    _animacion.hidden =YES;
    [_animacion stopAnimating];
    
    NSError * error;
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&error];
    NSArray * bloque = [json objectForKey:@"loans"];
    NSDictionary * registro = [bloque objectAtIndex:0];
    
    _idTxt.text = [NSString stringWithFormat:@"%@",[registro objectForKey:@"id"]];
    _nameTxt.text = [registro objectForKey:@"name"];
    _actividadTxt.text = [registro objectForKey:@"activity"];
    _fechaTxt.text = [registro objectForKey:@"posted_date"];
    
    //[[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendNotification:(id)sender {
    UILocalNotification * notificacion = [[UILocalNotification alloc] init];
    notificacion.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    notificacion.alertBody=@"Por favor abre la aplicacion";
    notificacion.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber]+1;
    [[UIApplication sharedApplication] scheduleLocalNotification:notificacion];
    
    //IOS 8 App delegate-> didFinish
    
    /*if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }*/
}
@end
