//
//  JDVAppDelegate.m
//  GameOfLife
//
//  Created by sonique on 5/4/14
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVAppDelegate.h"
#import "JDVGameOfLifeViewController.h"

@implementation JDVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] init];
    self.window.frame = [[UIScreen mainScreen] bounds];
    self.window.rootViewController = [self appRootVC];
    [self.window makeKeyWindow];
    self.window.hidden = FALSE;
    return YES;
}

- (UIViewController *)appRootVC
{
    return [[JDVGameOfLifeViewController alloc] init];
}

@end
