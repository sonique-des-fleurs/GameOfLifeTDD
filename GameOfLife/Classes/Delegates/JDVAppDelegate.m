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
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[JDVGameOfLifeViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
