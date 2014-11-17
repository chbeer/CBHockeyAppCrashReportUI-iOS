//
//  CBHockeyAppCrashReportTableViewController.h
//  CBHockeyAppCrashReportUI-iOS
//
//  Created by Christian Beer on 17.11.14.
//  Copyright (c) 2014 Christian Beer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BITCrashDetails;


@interface CBHockeyAppCrashReportTableViewController : UITableViewController

@property (nonatomic, strong, readonly) NSString        *appName;
@property (nonatomic, strong, readonly) BITCrashDetails *crashDetails;

- (instancetype) initWithCrashDetails:(BITCrashDetails*)crashDetails appName:(NSString*)appName;

@end
