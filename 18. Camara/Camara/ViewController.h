
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)tomarFoto:(id)sender;
- (IBAction)seleccionarFoto:(id)sender;


@end

