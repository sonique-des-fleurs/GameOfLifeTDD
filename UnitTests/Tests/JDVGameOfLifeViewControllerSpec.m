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
    describe(@"when it is created", ^{
        __block JDVGameOfLifeViewController *_gameOfLifeVC;
        
        beforeEach(^{
            _gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
        });
        
        it(@"assigns a JDVBoardViewController to the boardVC property", ^{
            expect(_gameOfLifeVC.boardVC).to.beInstanceOf([JDVBoardViewController class]);
        });
        
        it(@"the game is not running", ^{
            expect(_gameOfLifeVC.gameIsRunning).to.beFalsy();
        });
    });
    
    describe(@"when its view property is accessed", ^{
        __block JDVGameOfLifeViewController *_gameOfLifeVC;
        
        beforeEach(^{
            _gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
        });
        
        it(@"assigns a UIButton to the startButton property", ^{
            [_gameOfLifeVC view];
            expect(_gameOfLifeVC.runButton).to.beInstanceOf([UIButton class]);
        });
        
        it(@"sets the action for the START button", ^{
            [_gameOfLifeVC view];
            NSArray *startButtonActions = [_gameOfLifeVC.runButton actionsForTarget:_gameOfLifeVC
                                                                    forControlEvent:UIControlEventTouchUpInside];
            NSString *startButtonAction = startButtonActions[0];
            expect(startButtonAction).to.equal(@"toggleRun:");
        });
        
        it(@"assigns a UIButton to the clearButton property", ^{
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
        
        it(@"sets the frame for the boardVC's view", ^{
            id mockBoardView = [OCMockObject partialMockForObject:[[UIView alloc] init]];
            [[[mockBoardView expect] ignoringNonObjectArgs] setFrame:CGRectZero];
            id mockBoardVC = [OCMockObject niceMockForClass:[JDVBoardViewController class]];
            [[[mockBoardVC stub] andReturn:mockBoardView] view];
            _gameOfLifeVC.boardVC = mockBoardVC;
            
            [_gameOfLifeVC view];
            [mockBoardView verify];
        });
        
        it(@"adds the boardVC's view to the view hierarchy", ^{
            UIView *boardView = [[UIView alloc] init];
            id mockBoardVC = [OCMockObject niceMockForClass:[JDVBoardViewController class]];
            [[[mockBoardVC stub] andReturn:boardView] view];
            _gameOfLifeVC.boardVC = mockBoardVC;
            
            [_gameOfLifeVC view];
            expect(_gameOfLifeVC.view.subviews).to.contain(boardView);
        });
    });
    
    context(@"the game is stopped", ^{
        __block JDVGameOfLifeViewController *_gameOfLifeVC;
        
        beforeEach(^{
            _gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
            [_gameOfLifeVC view];
            [_gameOfLifeVC stopGame];
        });
        
        describe(@"when the user taps the run button", ^{
            it(@"starts the game", ^{
                id mockGameOfLifeVC = [OCMockObject partialMockForObject:_gameOfLifeVC];
                [[mockGameOfLifeVC expect] startGame];
                [_gameOfLifeVC toggleRun:nil];
                [mockGameOfLifeVC verify];
            });
        });
        
        describe(@"when the game starts", ^{
            it(@"assigns TRUE to the gameIsRunning property", ^{
                [_gameOfLifeVC startGame];
                expect(_gameOfLifeVC.gameIsRunning).to.beTruthy();
            });
            
            it(@"sets the button to read STOP", ^{
                [_gameOfLifeVC startGame];
                expect([_gameOfLifeVC.runButton titleForState:UIControlStateNormal]).to.equal(@"STOP");
            });

            it(@"it assigns a timer to the gameTimer property", ^{
                [_gameOfLifeVC startGame];
                expect(_gameOfLifeVC.gameTimer).notTo.beNil();
            });
            
            it(@"adds the timer to the current run loop", ^{
                id mockRunLoop = [OCMockObject partialMockForObject:[NSRunLoop currentRunLoop]];
                [[mockRunLoop expect] addTimer:[OCMArg any] forMode:NSDefaultRunLoopMode];
                [_gameOfLifeVC startGame];
                [mockRunLoop verify];
            });
            
            it(@"disables the CLEAR button", ^{
                [_gameOfLifeVC startGame];
                expect(_gameOfLifeVC.clearButton.enabled).to.beFalsy();
            });
        });
        
        describe(@"when the user taps the CLEAR button", ^{
            it(@"tells the board view controller to reset the cells", ^{
                id mockBoardVC = [OCMockObject mockForClass:[JDVBoardViewController class]];
                [[mockBoardVC expect] reset];
                _gameOfLifeVC.boardVC = mockBoardVC;
                
                [_gameOfLifeVC clear:nil];
                [mockBoardVC verify];
            });
        });
    });
    
    context(@"the game is started", ^{
        __block JDVGameOfLifeViewController *_gameOfLifeVC;
        
        beforeEach(^{
            _gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
            [_gameOfLifeVC view];
            [_gameOfLifeVC startGame];
        });
        
        describe(@"when the user taps the run button", ^{
            it(@"stops the game", ^{
                id mockGameOfLifeVC = [OCMockObject partialMockForObject:_gameOfLifeVC];
                [[mockGameOfLifeVC expect] stopGame];
                [_gameOfLifeVC toggleRun:nil];
                [mockGameOfLifeVC verify];
            });
        });
        
        describe(@"when the game stops", ^{
            it(@"assigns FALSE to the gameIsRunning property", ^{
                [_gameOfLifeVC stopGame];
                expect(_gameOfLifeVC.gameIsRunning).to.beFalsy();
            });
            
            it(@"sets the button to read START", ^{
                NSLog(@"beforeToggle: %@", _gameOfLifeVC.runButton.titleLabel.text);
                NSLog(@"gameTimer: %@", _gameOfLifeVC.gameTimer);
                [_gameOfLifeVC stopGame];
                NSLog(@"afterToggle: %@", _gameOfLifeVC.runButton.titleLabel.text);
                expect([_gameOfLifeVC.runButton titleForState:UIControlStateNormal]).to.equal(@"START");
            });
            
            it(@"invalidates the game timer", ^{
                [_gameOfLifeVC stopGame];
                expect(_gameOfLifeVC.gameTimer.isValid).to.beFalsy();
            });
            
            it(@"enables the CLEAR button", ^{
                [_gameOfLifeVC stopGame];
                expect(_gameOfLifeVC.clearButton.enabled).to.beTruthy();
            });
        });
    });
    
    describe(@"when the game timer fires", ^{
        it(@"tells the board view controller to update", ^{
            JDVGameOfLifeViewController *gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
            id mockBoardVC = [OCMockObject mockForClass:[JDVBoardViewController class]];
            [[mockBoardVC expect] update];
            gameOfLifeVC.boardVC = mockBoardVC;
            
            [gameOfLifeVC timerDidFire:nil];
            [mockBoardVC verify];
        });
    });
});

SpecEnd
