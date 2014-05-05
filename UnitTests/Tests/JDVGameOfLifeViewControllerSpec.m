//
//  JDVGameOfLifeViewControllerSpec.m
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVGameOfLifeViewController.h"
#import "JDVBoard.h"
#import "JDVCell.h"

SpecBegin(JDVGameOfLifeViewController)

describe(@"JDVGameOfLifeViewController", ^{
    __block JDVGameOfLifeViewController *_gameOfLifeVC;
    
    beforeEach(^{
        _gameOfLifeVC = [[JDVGameOfLifeViewController alloc] init];
    });
    
    describe(@"when it is created", ^{
        it(@"assigns a JDVBoard to its board property", ^{
            expect(_gameOfLifeVC.board).to.beInstanceOf([JDVBoard class]);
        });
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
    
    describe(@"when its view has been loaded into memory", ^{
        it(@"sets the frame for each of the board's cells", ^{
            id mockCell = [OCMockObject mockForClass:[JDVCell class]];
            [[[mockCell expect] ignoringNonObjectArgs] setFrame:CGRectZero];
            
            id mockBoard = [OCMockObject mockForClass:[JDVBoard class]];
            [[[mockBoard stub] andReturn:@[mockCell]] cells];
            _gameOfLifeVC.board = mockBoard;
            
            [_gameOfLifeVC viewDidLoad];
            [mockCell verify];
        });
        
        it(@"adds the board's cells to the board view", ^{
            id mockCell = [OCMockObject niceMockForClass:[JDVCell class]];
            id mockBoard = [OCMockObject mockForClass:[JDVBoard class]];
            [[[mockBoard stub] andReturn:@[mockCell]] cells];
            
            id mockBoardView = [OCMockObject mockForClass:[UIView class]];
            [[mockBoardView expect] addSubview:mockCell];
            
            _gameOfLifeVC.board = mockBoard;
            _gameOfLifeVC.boardView = mockBoardView;
            
            [_gameOfLifeVC viewDidLoad];
            [mockBoardView verify];
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
