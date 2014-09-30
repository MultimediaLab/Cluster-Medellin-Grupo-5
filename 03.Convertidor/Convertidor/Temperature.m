#import "Temperature.h"

@implementation Temperature

-(NSString *)convertCelsiusToFarenheit:(float)value{
    farenheit = 9*value/5+32;
    return [NSString stringWithFormat:@" %.02f", farenheit];
}
-(NSString *)convertFarenheitToCelsius:(float)value{
    celsius = (value-32)*5/9;
    return [NSString stringWithFormat:@" %.02f", celsius];
}
//Celsius to Kelvin
-(NSString*)convertCelsiusToKelvin:(float)value{
    kelvin = value+273;
    return [NSString stringWithFormat:@"%.02f", kelvin];
}
-(NSString*)convertKelvinToCelsius:(float)value{
    celsius = value-273;
    return [NSString stringWithFormat:@"%.02f", celsius];
}
//Kelvin to Farenheit
-(NSString*)convertKelvinToFarenheit:(float)value{
    farenheit =(value - 273.15)* 1.8000 + 32.00;
    return [NSString stringWithFormat:@"%.02f", farenheit];
}
-(NSString*)convertFarenheitToKelvin:(float)value{
    kelvin =(value - 32.00)/1.8000 + 273.15;
    return [NSString stringWithFormat:@"%.02f", kelvin];
}


@end
