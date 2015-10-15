//
//  ViewController.m
//  CBHockeyAppCrashReportUI-iOS
//
//  Created by Christian Beer on 17.11.14.
//  Copyright (c) 2014 Christian Beer. All rights reserved.
//

#import "ViewController.h"

#import <HockeySDK/BITCrashDetails.h>

#import "CBHockeyAppCrashReportTableViewController.h"


@interface BITCrashDetails () 
- (instancetype)initWithIncidentIdentifier:(NSString *)incidentIdentifier
                               reporterKey:(NSString *)reporterKey
                                    signal:(NSString *)signal
                             exceptionName:(NSString *)exceptionName
                           exceptionReason:(NSString *)exceptionReason
                              appStartTime:(NSDate *)appStartTime
                                 crashTime:(NSDate *)crashTime
                                 osVersion:(NSString *)osVersion
                                   osBuild:(NSString *)osBuild
                                appVersion:(NSString *)appVersion
                                  appBuild:(NSString *)appBuild
                      appProcessIdentifier:(NSUInteger)appProcessIdentifier;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)showCrashReportDialog:(id)sender
{
    BITCrashDetails *details = [[BITCrashDetails alloc] initWithIncidentIdentifier:@"incident"
                                                                       reporterKey:@"reporter"
                                                                            signal:@"SIGHUP"
                                                                     exceptionName:@"NSNotFoundException"
                                                                   exceptionReason:@"Crashed because we couldn't find a better reason for a crash"
                                                                      appStartTime:[NSDate new] crashTime:[NSDate new]
                                                                         osVersion:@"8.1.1" osBuild:@"8A1234" appVersion:@"1.2.3" appBuild:@"123"
                                                              appProcessIdentifier:0x123];
    
    NSString *appName = [[NSBundle mainBundle] infoDictionary][(NSString*)kCFBundleNameKey];
    [CBHockeyAppCrashReportTableViewController presentCrashReportDialogWithCrashDetails:details
                                                                                appName:appName
                                                                       onViewController:self
                                                                               animated:YES
                                                                             completion:NULL];
}

- (IBAction) crash:(id)sender
{
    // crash on purpose
    kill( getpid(), SIGABRT );
}

@end
