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
    __block JDVGameOfLifeViewController *_gameOfLifeVC;
    
    beforeEach(^{
        _gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
    });
    
    describe(@"when it is created", ^{
        it(@"assigns a JDVBoardViewController to the boardVC property", ^{
            expect(_gameOfLifeVC.boardVC).to.beInstanceOf([JDVBoardViewController class]);
        });
    });
    
    describe(@"when its view property is accessed", ^{
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
            id mockBoardVC = [OCMockObject mockForClass:[JDVBoardViewController class]];
            [[[mockBoardVC stub] andReturn:mockBoardView] view];
            _gameOfLifeVC.boardVC = mockBoardVC;
            
            [_gameOfLifeVC view];
            [mockBoardView verify];
        });
        
        it(@"adds the boardVC's view to the view hierarchy", ^{
            UIView *boardView = [[UIView alloc] init];
            id mockBoardVC = [OCMockObject mockForClass:[JDVBoardViewController class]];
            [[[mockBoardVC stub] andReturn:boardView] view];
            _gameOfLifeVC.boardVC = mockBoardVC;
            
            [_gameOfLifeVC view];
            expect(_gameOfLifeVC.view.subviews).to.contain(boardView);
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
        describe(@"when the user taps the PAUSE button", ^{
            it(@"changes the button to read 'START'", ^{
                
            });
            
            it(@"stops the game timer", ^{
        
            });
            
            it(@"enables the CLEAR button", ^{
                
            });
        });
    });
});

SpecEnd
