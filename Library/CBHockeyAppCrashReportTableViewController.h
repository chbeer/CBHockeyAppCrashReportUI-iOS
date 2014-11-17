//
//  CBHockeyAppCrashReportTableViewController.h
//  CBHockeyAppCrashReportUI-iOS
//
//  Created by Christian Beer on 17.11.14.
//  Copyright (c) 2014 Christian Beer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BITCrashDetails;

/*! View controller that provides (nearly) the same dialog as the HockeySDK-Mac BITCrashReportUI window.
 * To replace the default UIAlert you need to do this after setting up HockeySDK:
 *
 *     __weak __typeof(self) wself = self;
 *     [[BITHockeyManager sharedHockeyManager].crashManager setAlertViewHandler:^{
 *         AppDelegate *sself = wself;
 *         if (!sself) return;
 *
 *         BITCrashDetails *details = [[BITHockeyManager sharedHockeyManager].crashManager lastSessionCrashDetails];
 *
 *         UIViewController *viewCtrl = [sself.window rootViewController];
 *         NSString *appName = [[NSBundle mainBundle] infoDictionary][(NSString*)kCFBundleNameKey];
 *
 *         [CBHockeyAppCrashReportTableViewController presentCrashReportDialogWithCrashDetails:details
 *                                                                                     appName:appName
 *                                                                            onViewController:viewCtrl
 *                                                                                    animated:YES
 *                                                                                  completion:NULL];
 *     }];
 */
@interface CBHockeyAppCrashReportTableViewController : UITableViewController

@property (nonatomic, strong, readonly) NSString        *appName;
@property (nonatomic, strong, readonly) BITCrashDetails *crashDetails;

/*! Initialize with details about the crash and the app's name 
 *
 * @param crashDetails Details about the crash as given by hockey.
 * @param appName Name of the app to show in the dialog.
 * @return initialized instance.
 */
- (instancetype) initWithCrashDetails:(BITCrashDetails*)crashDetails appName:(NSString*)appName;

/*! Convenience method to present the dialog modally on the given view controller. Wraps the view 
 * controller in a UINavigationController.
 *
 * @param crashDetails Details about the crash as given by hockey.
 * @param appName Name of the app to show in the dialog.
 * @param viewController Calls presentViewController:animated:completion on that view controller.
 * @param animated If YES the view controller is presented with an animation.
 * @param completion Called when the presentation animation is completed.
 * @return initialized instance.
 */
+ (instancetype) presentCrashReportDialogWithCrashDetails:(BITCrashDetails*)crashDetails appName:(NSString*)appName
                                         onViewController:(UIViewController*)viewController animated:(BOOL)animated
                                               completion:(void (^)(void))completion;

@end
