//
//  JDVGameOfLifeViewControllerSpec.m
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVGameOfLifeViewController.h"
#import "JDVBoard.h"

SpecBegin(JDVGameOfLifeViewController)

describe(@"JDVGameOfLifeViewController", ^{
    __block JDVGameOfLifeViewController *_gameOfLifeVC;
    
    beforeEach(^{
        _gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
    });
    
    describe(@"when its view property is accessed", ^{
        it(@"assigns a UIButton to its startButton property", ^{
            [_gameOfLifeVC view];
            expect(_gameOfLifeVC.startButton).to.beInstanceOf([UIButton class]);
        });
        
        it(@"sets the action for the START button", ^{
            [_gameOfLifeVC view];
            NSArray *startButtonActions = [_gameOfLifeVC.startButton actionsForTarget:_gameOfLifeVC
                                                                      forControlEvent:UIControlEventTouchUpInside];
            NSString *startButtonAction = startButtonActions[0];
            expect(startButtonAction).to.equal(@"toggleRun:");
        });
        
        it(@"assigns a UIButton to its clearButton property", ^{
            [_gameOfLifeVC view];
            expect(_gameOfLifeVC.clearButton).to.beInstanceOf([UIButton class]);
        });
        
        it(@"sets the action for the CLEAR button", ^{
            [_gameOfLifeVC view];
            NSArray *clearButtonActions = [_gameOfLifeVC.clearButton actionsForTarget:_gameOfLifeVC
                                                                      forControlEvent:UIControlEventTouchUpInside];
            NSString *clearButtonAction = clearButtonActions[0];
            expect(clearButtonAction).to.equal(@"clear:");
        });
        
        it(@"assigns a UIView to its boardView property", ^{
            [_gameOfLifeVC view];
            expect(_gameOfLifeVC.boardView).to.beInstanceOf([UIView class]);
        });
    });
    
    describe(@"when its view has loaded into memory", ^{
        it(@"assigns a JDVBoard to its board property", ^{
            [_gameOfLifeVC viewDidLoad];
            expect(_gameOfLifeVC.board).to.beInstanceOf([JDVBoard class]);
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
