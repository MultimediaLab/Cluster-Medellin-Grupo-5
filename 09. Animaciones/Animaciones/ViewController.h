
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

- (IBAction)animarSimple:(id)sender;
- (IBAction)animarDoble:(id)sender;
- (IBAction)animarOpciones:(id)sender;
- (IBAction)stopAnimatios:(id)sender;

@end

