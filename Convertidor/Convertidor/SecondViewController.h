#import <UIKit/UIKit.h>
#import "Temperature.h"

@interface SecondViewController : UIViewController
{
    Temperature * conversor;

}
@property (strong, nonatomic) IBOutlet UITextField *dataToConvert;

- (IBAction)convertDataToF:(id)sender;
- (IBAction)convertDatatoC:(id)sender;




@property (strong, nonatomic) IBOutlet UILabel *convertResult;

@end

