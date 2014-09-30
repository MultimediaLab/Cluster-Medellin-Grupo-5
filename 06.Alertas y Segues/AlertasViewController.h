#import <UIKit/UIKit.h>

@interface AlertasViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>

@property NSString * nameValue;


@property (strong, nonatomic) IBOutlet UILabel *nameLabel;


- (IBAction)exitView:(id)sender;

- (IBAction)alertSimple:(id)sender;
- (IBAction)alertOptions:(id)sender;
- (IBAction)actionSheet:(id)sender;


@end
