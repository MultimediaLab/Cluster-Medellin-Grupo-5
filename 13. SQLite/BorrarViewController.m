//
//  BorrarViewController.m
//  SQLite
//
//  Created by Profesor on 7/10/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "BorrarViewController.h"

@interface BorrarViewController ()

@end

@implementation BorrarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _deleteClient = [[Clients alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deleteClient:(id)sender {
    _deleteClient.clName = _txtSearch.text;
    [_deleteClient deleteClientInDatabase];
    _result.text = _deleteClient.status;
}
@end
