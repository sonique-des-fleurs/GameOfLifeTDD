//
//  JDVAppDelegateSpec.m
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVAppDelegate.h"
#import "JDVGameOfLifeViewController.h"

SpecBegin(JDVAppDelegate)

describe(@"JDVAppDelegate", ^{
    context(@"when app finishes launching", ^{
        __block JDVAppDelegate *_appDelegate;
        
        beforeEach(^{
            _appDelegate = [[JDVAppDelegate alloc] init];
        });
        
        it(@"assigns an instance of UIWindow to its window property", ^{
            [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            expect(_appDelegate.window).to.beInstanceOf([UIWindow class]);
        });
        
        it(@"sets the frame of its window property equal to the bounds of the main screen", ^{
            [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            expect(_appDelegate.window.frame).to.equal([[UIScreen mainScreen] bounds]);
        });
        
        it(@"assigns an instance of JDVGameOfLifeViewController to the rootViewController property of its window", ^{
            [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            expect(_appDelegate.window.rootViewController).to.beInstanceOf([JDVGameOfLifeViewController class]);
        });
        
        it(@"sets its window to be the key window for the app", ^{
            [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            expect(_appDelegate.window.keyWindow).to.beTruthy();
        });
        
        it(@"sets its window to be the top window in the app", ^{
            [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            UIWindow *topWindow = [[[UIApplication sharedApplication] windows] lastObject];
            expect(_appDelegate.window).to.equal(topWindow);
        });
    });
});

SpecEnd
