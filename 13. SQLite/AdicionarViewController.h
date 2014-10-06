
#import <UIKit/UIKit.h>
#import "Clients.h"

@interface AdicionarViewController : UIViewController
@property Clients * clientNew;

@property (strong, nonatomic) IBOutlet UITextField *nameTxt;
@property (strong, nonatomic) IBOutlet UITextField *nitTxt;
@property (strong, nonatomic) IBOutlet UITextField *adressTxt;

@property (strong, nonatomic) IBOutlet UITextField *phoneTxt;
@property (strong, nonatomic) IBOutlet UILabel *resultTxt;
- (IBAction)saveClient:(id)sender;

@end
