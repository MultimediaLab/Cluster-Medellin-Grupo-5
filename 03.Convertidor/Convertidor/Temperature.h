#import <Foundation/Foundation.h>

@interface Temperature : NSObject
{
    float celsius;
    float farenheit;
    float kelvin;
}

//Metodos de C vs F
-(NSString*)convertCelsiusToFarenheit:(float)value;
-(NSString*)convertFarenheitToCelsius:(float)value;


//Metodos de C vs K
-(NSString*)convertCelsiusToKelvin:(float)value;
-(NSString*)convertKelvinToCelsius:(float)value;

//Metodos de K vs F
-(NSString*)convertKelvinToFarenheit:(float)value;
-(NSString*)convertFarenheitToKelvin:(float)value;


@end
