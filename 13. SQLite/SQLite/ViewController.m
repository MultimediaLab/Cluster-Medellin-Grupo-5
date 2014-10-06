//
//  ViewController.m
//  SQLite
//
//  Created by Profesor on 4/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"
#import "Clients.h"

@interface ViewController ()
@property Clients * client;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _client = [[Clients alloc] init];
    [_client createDatabaseInDocuments];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
