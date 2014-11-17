//
//  ViewController.m
//  CBHockeyAppCrashReportUI-iOS
//
//  Created by Christian Beer on 17.11.14.
//  Copyright (c) 2014 Christian Beer. All rights reserved.
//

#import "ViewController.h"

#import "BITCrashDetails.h"
#import "BITCrashDetailsPrivate.h"

#import "CBHockeyAppCrashReportTableViewController.h"


@interface ViewController ()

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
                                                                      appStartTime:[NSDate new]
                                                                         crashTime:[NSDate new]
                                                                         osVersion:@"8.1.1"
                                                                           osBuild:@"8A1234"
                                                                          appBuild:@"1.2.3"];
    CBHockeyAppCrashReportTableViewController *ctrl = [[CBHockeyAppCrashReportTableViewController alloc] initWithCrashDetails:details
                                                                                                                      appName:@"Dummy App"];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:ctrl];
    [self presentViewController:navCtrl animated:YES
                     completion:NULL];
}

@end
