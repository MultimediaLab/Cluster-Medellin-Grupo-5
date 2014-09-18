//
//  ViewController.m
//  Tipos de datos
//
//  Created by Profesor on 18/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // String
    
    NSString * saludo = @"Hola iOS";
    
    int numero = 20;
    
    NSString * hola = [NSString stringWithFormat:@"Mi edad es %i y texto: %@", numero, saludo];
    
    NSLog(@"%@", hola);
    
    // Strings Mutables
    
    NSMutableString * texto = [NSMutableString stringWithFormat:@"Mi nombre es: "];
    [texto appendString:@"Giovanny Suarez"];
    
    NSLog(@"%@", texto);
    
    //Arrays
    NSArray * dias = @[@"lunes", @"martes", @"miercoles", @"jueves"];
    //NSArray * ciudades = [[NSArray alloc] initWithObjects:@"medellin", @"bogota", @"cali", nil ];
    NSString * variable = [dias objectAtIndex:2];
    NSLog(@"%@", variable);
    
    
    // Arrays Mutables
    NSMutableArray * diasCompletos = [[NSMutableArray alloc] initWithArray:dias];
    [diasCompletos addObject:@"viernes"];
    [diasCompletos removeObjectAtIndex:0];
    //[diasCompletos removeAllObjects];
    
    NSLog(@"%@", diasCompletos);
    
    //Diccionarios
    NSDictionary * usuario = @{@"nombre": @"pepito", @"edad": @"20", @"ciudad": @"medellin"};
    NSDictionary * usuario2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"jose", @"nombre", @"40", @"edad", @"bogota", @"ciudad", nil];

    NSString * nombreUsuario = [usuario objectForKey:@"nombre"];
    
    //Diccionarios Mutables
    
    NSMutableDictionary * usuario3 = [[NSMutableDictionary alloc] initWithDictionary:usuario2];
    [usuario3 setObject:@"miguel" forKey:@"nombre"];
    [usuario3 setObject:@"187846587" forKey:@"cedula"];
    [usuario3 removeObjectForKey:@"ciudad"];
   // NSLog(@"usuario1 : %@ y usuario2 : %@ y usuario3: %@" , nombreUsuario, [usuario2 objectForKey:@"nombre"], [usuario3 objectForKey:@"cedula"]);
    
    NSLog(@"usuario1 : %@ y usuario2 : %@ y usuario3: %@" , nombreUsuario, [usuario2 objectForKey:@"nombre"], usuario3);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
