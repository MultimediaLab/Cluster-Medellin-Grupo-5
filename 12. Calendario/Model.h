#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class CalendarViewController;

@interface Model : NSObject <UIPageViewControllerDataSource>


//Metodo que retorne el viewController de cada mes
-(CalendarViewController*) viewControllerAtIndex:(NSInteger)index storyboard:(UIStoryboard*)storyboard;

//Metodo que retorne el indice del viewcontroller actual
-(NSUInteger) indexOfViewController:(CalendarViewController*)viewController;


@end
