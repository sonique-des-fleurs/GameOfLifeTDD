//
//  JDVGameOfLifeViewControllerSpec.m
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVGameOfLifeViewController.h"

SpecBegin(JDVGameOfLifeViewController)

describe(@"JDVGameOfLifeViewController", ^{
    context(@"when its view property is accessed", ^{
        it(@"assigns a UIButton to its startButton property", ^{
            JDVGameOfLifeViewController *gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
            [gameOfLifeVC view];
            expect(gameOfLifeVC.startButton).to.beInstanceOf([UIButton class]);
        });
        
        it(@"sets the action for the START button", ^{
            JDVGameOfLifeViewController *gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
            [gameOfLifeVC view];
            NSString *startButtonAction = [[gameOfLifeVC.startButton actionsForTarget:gameOfLifeVC forControlEvent:UIControlEventTouchUpInside] firstObject];
            expect(startButtonAction).to.equal(@"toggleRun:");
        });
        
        it(@"assigns a UIButton to its clearButton property", ^{
            JDVGameOfLifeViewController *gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
            [gameOfLifeVC view];
            expect(gameOfLifeVC.clearButton).to.beInstanceOf([UIButton class]);
        });
        
        it(@"sets the action for the CLEAR button", ^{
            JDVGameOfLifeViewController *gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
            [gameOfLifeVC view];
            NSString *clearButtonAction = [[gameOfLifeVC.clearButton actionsForTarget:gameOfLifeVC forControlEvent:UIControlEventTouchUpInside] firstObject];
            expect(clearButtonAction).to.equal(@"clear:");
        });
    });
});

SpecEnd
