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
    describe(@"when its view property is accessed", ^{
        __block JDVGameOfLifeViewController *_gameOfLifeVC;
        
        beforeEach(^{
            _gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
        });
        
        it(@"assigns a UIButton to its startButton property", ^{
            [_gameOfLifeVC view];
            expect(_gameOfLifeVC.startButton).to.beInstanceOf([UIButton class]);
        });
        
        it(@"sets the action for the START button", ^{
            [_gameOfLifeVC view];
            NSString *startButtonAction = [_gameOfLifeVC.startButton actionsForTarget:_gameOfLifeVC forControlEvent:UIControlEventTouchUpInside][0];
            expect(startButtonAction).to.equal(@"toggleRun:");
        });
        
        it(@"assigns a UIButton to its clearButton property", ^{
            [_gameOfLifeVC view];
            expect(_gameOfLifeVC.clearButton).to.beInstanceOf([UIButton class]);
        });
        
        it(@"sets the action for the CLEAR button", ^{
            [_gameOfLifeVC view];
            NSString *clearButtonAction = [_gameOfLifeVC.clearButton actionsForTarget:_gameOfLifeVC forControlEvent:UIControlEventTouchUpInside][0];
            expect(clearButtonAction).to.equal(@"clear:");
        });
    });
    
    xcontext(@"the game is not running", ^{
        describe(@"when the user taps the START button", ^{
            it(@"changes the button to read 'PAUSE'", ^{
                
            });
         
            it(@"starts the game timer", ^{
                
            });
            
            it(@"disables the CLEAR button", ^{
                
            });
        });
        
        describe(@"when the user taps the CLEAR button", ^{
            it(@"sets all of the cells on the board to dead", ^{
                
            });
        });
    });
    
    xcontext(@"the game is running", ^{
        describe(@"when the user taps the START (PAUSE) button", ^{
            it(@"changes the START button to read 'START'", ^{
                
            });
            
            it(@"stops the game timer", ^{
        
            });
            
            it(@"enables the CLEAR button", ^{
                
            });
        });
    });
});

SpecEnd
