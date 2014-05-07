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
    describe(@"when the app finishes launching", ^{
        __block JDVAppDelegate *_appDelegate;
        
        beforeEach(^{
            _appDelegate = [[JDVAppDelegate alloc] init];
        });
        
        it(@"assigns an instance of UIWindow to the window property", ^{
            [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            expect(_appDelegate.window).to.beInstanceOf([UIWindow class]);
        });
        
        it(@"sets the frame of the window to the bounds of the main screen", ^{
            id mockWindow = [OCMockObject niceMockForClass:[UIWindow class]];
            [[mockWindow expect] setFrame:[[UIScreen mainScreen] bounds]];
            
            id mockAppDelegate = [OCMockObject partialMockForObject:_appDelegate];
            [[[mockAppDelegate stub] andReturn:mockWindow] window];
            
            [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            [mockWindow verify];
        });
        
        it(@"sets the rootViewController property of the window ", ^{
            id mockRootVC = [OCMockObject mockForClass:[UIViewController class]];
            
            id mockWindow = [OCMockObject niceMockForClass:[UIWindow class]];
            [[mockWindow expect] setRootViewController:mockRootVC];
            
            id mockAppDelegate = [OCMockObject partialMockForObject:_appDelegate];
            [[[mockAppDelegate stub] andReturn:mockWindow] window];
            [[[mockAppDelegate stub] andReturn:mockRootVC] appRootVC];
            
            [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            [mockWindow verify];
        });
        
        it(@"sets the window to be the key window for the app", ^{
            id mockWindow = [OCMockObject niceMockForClass:[UIWindow class]];
            [[mockWindow expect] makeKeyWindow];
            
            id mockAppDelegate = [OCMockObject partialMockForObject:_appDelegate];
            [[[mockAppDelegate stub] andReturn:mockWindow] window];
            
            [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            [mockWindow verify];
        });
        
        it(@"sets the window to be visible", ^{
            id mockWindow = [OCMockObject niceMockForClass:[UIWindow class]];
            [[mockWindow expect] setHidden:FALSE];
            
            id mockAppDelegate = [OCMockObject partialMockForObject:_appDelegate];
            [[[mockAppDelegate stub] andReturn:mockWindow] window];
            
            [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            [mockWindow verify];
        });
        
        it(@"it reports that it has successfully launched", ^{
            BOOL didLaunch = [_appDelegate application:nil didFinishLaunchingWithOptions:nil];
            expect(didLaunch).to.beTruthy();
        });
    });
    
    it(@"creates a rootVC for the app", ^{
        JDVAppDelegate *appDelegate = [[JDVAppDelegate alloc] init];
        expect([appDelegate appRootVC]).to.beKindOf([UIViewController class]);
    });
});

SpecEnd
