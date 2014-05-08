//
//  JDVCellSpec.m
//  GameOfLife
//
//  Created by sonique on 5/6/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVCell.h"

SpecBegin(JDVCell)

describe(@"JDVCell", ^{
    __block JDVCell *_cell;
    
    describe(@"when it is created in the second row", ^{
        it(@"assigns 2 to the row key of the location property", ^{
            _cell = [[JDVCell alloc] initWithBoardLocation:@{JDVCellRow:@2, JDVCellColumn:@1}];
            expect(_cell.boardLocation[JDVCellRow]).to.equal(@2);
        });
    });
    
    describe(@"when it is created in the second column", ^{
        it(@"assigns 2 to the column key of the location property", ^{
            _cell = [[JDVCell alloc] initWithBoardLocation:@{JDVCellRow:@1, JDVCellColumn:@2}];
            expect(_cell.boardLocation[JDVCellColumn]).to.equal(@2);
        });
    });
    
    describe(@"when it is created", ^{
        beforeEach(^{
            _cell = [[JDVCell alloc] init];
        });
        
        it(@"sets the value of the location property", ^{
            expect(_cell.boardLocation).notTo.beNil();
        });
        
        it(@"assigns DEAD to the currentState property", ^{
            expect(_cell.currentState).to.equal(JDVCellStateDead);
        });
        
        it(@"sets the background color", ^{
            expect(_cell.backgroundColor).notTo.beNil();
        });
        
        it(@"sets an action to handle tap events", ^{
            expect([_cell actionsForTarget:_cell forControlEvent:UIControlEventTouchUpInside]).notTo.beNil();
        });
    });
    
    describe(@"when it sets the next state", ^{
        __block NSSet *_neigbors;
        __block id _mockCell1;
        __block id _mockCell2;
        __block id _mockCell3;
        __block id _mockCell4;
        __block id _mockCell5;
        
        beforeEach(^{
            _cell = [[JDVCell alloc] init];
            _mockCell1 = [OCMockObject mockForClass:[JDVCell class]];
            _mockCell2 = [OCMockObject mockForClass:[JDVCell class]];
            _mockCell3 = [OCMockObject mockForClass:[JDVCell class]];
            _mockCell4 = [OCMockObject mockForClass:[JDVCell class]];
            _mockCell5 = [OCMockObject mockForClass:[JDVCell class]];
            _neigbors = [NSSet setWithObjects:_mockCell1, _mockCell2, _mockCell3, _mockCell4, _mockCell5, nil];
        });
        
        context(@"living cell", ^{
            beforeEach(^{
                _cell.currentState = JDVCellStateAlive;
            });

            it(@"will be dead when none of its neighbors are alive", ^{
                [[[_mockCell1 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell2 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell3 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell4 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell5 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                
                [_cell setNextStateWithNeighbors:_neigbors];
                expect(_cell.nextState).to.equal(JDVCellStateDead);
            });
            
            it(@"will be dead when it has 1 living neighbor", ^{
                [[[_mockCell1 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell2 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell3 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell4 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell5 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                
                [_cell setNextStateWithNeighbors:_neigbors];
                expect(_cell.nextState).to.equal(JDVCellStateDead);
            });
            
            it(@"will be alive when it has 2 living neighbors", ^{
                [[[_mockCell1 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell2 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell3 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell4 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell5 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                
                [_cell setNextStateWithNeighbors:_neigbors];
                expect(_cell.nextState).to.equal(JDVCellStateAlive);
            });
            
            it(@"will be alive when it has 3 living neighbors", ^{
                [[[_mockCell1 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell2 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell3 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell4 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell5 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                
                [_cell setNextStateWithNeighbors:_neigbors];
                expect(_cell.nextState).to.equal(JDVCellStateAlive);
            });
            
            it(@"will be dead when it has 4 living neighbors", ^{
                [[[_mockCell1 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell2 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell3 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell4 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell5 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                
                [_cell setNextStateWithNeighbors:_neigbors];
                expect(_cell.nextState).to.equal(JDVCellStateDead);
            });
        });
        
        context(@"dead cell", ^{
            beforeEach(^{
                _cell.currentState = JDVCellStateDead;
            });
            
            it(@"will be dead when none of its neighbors are alive", ^{
                [[[_mockCell1 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell2 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell3 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell4 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell5 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                
                [_cell setNextStateWithNeighbors:_neigbors];
                expect(_cell.nextState).to.equal(JDVCellStateDead);
            });
            
            it(@"will be dead when it has 2 living neighbors", ^{
                [[[_mockCell1 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell2 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell3 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell4 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell5 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                
                [_cell setNextStateWithNeighbors:_neigbors];
                expect(_cell.nextState).to.equal(JDVCellStateDead);
            });
            
            it(@"will be alive when it has 3 living neighbors", ^{
                [[[_mockCell1 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell2 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell3 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell4 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                [[[_mockCell5 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                
                [_cell setNextStateWithNeighbors:_neigbors];
                expect(_cell.nextState).to.equal(JDVCellStateAlive);
            });
            
            it(@"will be dead when it has 4 living neighbors", ^{
                [[[_mockCell1 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell2 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell3 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell4 stub] andReturnValue:@(JDVCellStateAlive)] currentState];
                [[[_mockCell5 stub] andReturnValue:@(JDVCellStateDead)] currentState];
                
                [_cell setNextStateWithNeighbors:_neigbors];
                expect(_cell.nextState).to.equal(JDVCellStateDead);
            });
        });
    });

    describe(@"when it resets", ^{
        context(@"a living cell", ^{
            it(@"sets the current state to DEAD", ^{
                _cell.currentState = JDVCellStateAlive;
                [_cell reset];
                expect(_cell.currentState).to.equal(JDVCellStateDead);
            });
        });
        
        context(@"a dead cell", ^{
            it(@"sets the current state to DEAD", ^{
                _cell.currentState = JDVCellStateDead;
                [_cell reset];
                expect(_cell.currentState).to.equal(JDVCellStateDead);
            });
        });
    });
    
    describe(@"when it toggles the state", ^{
        context(@"a living cell", ^{
            it(@"sets the current state to DEAD", ^{
                _cell.currentState = JDVCellStateAlive;
                [_cell toggleState:nil];
                expect(_cell.currentState).to.equal(JDVCellStateDead);
            });
        });
        
        context(@"a dead cell", ^{
            it(@"sets the current state to ALIVE", ^{
                _cell.currentState = JDVCellStateDead;
                [_cell toggleState:nil];
                expect(_cell.currentState).to.equal(JDVCellStateAlive);
            });
        });
    });
    
    describe(@"when the game starts", ^{
        it(@"disables user interaction", ^{
            [_cell gameDidStart];
            expect(_cell.userInteractionEnabled).to.beFalsy();
        });
    });
    
    describe(@"when the game stops", ^{
        it(@"enables user interaction", ^{
            [_cell gameDidStop];
            expect(_cell.userInteractionEnabled).to.beTruthy();
        });
    });
    
    context(@"game is not yet started", ^{
        describe(@"when the game starts", ^{
            it(@"disables user interaction", ^{
                [_cell gameDidStart];
                expect(_cell.userInteractionEnabled).to.beFalsy();
            });
        });
        
        context(@"the game has been started", ^{
            beforeEach(^{
                [_cell gameDidStart];
            });
            
            describe(@"when the game stops", ^{
                it(@"enables user interaction", ^{
                    [_cell gameDidStop];
                    expect(_cell.userInteractionEnabled).to.beTruthy();
                });
            });
            
            context(@"the game has been stopped", ^{
                beforeEach(^{
                    [_cell gameDidStop];
                });
                
                describe(@"when the game restarts", ^{
                    it(@"disables user interaction", ^{
                        [_cell gameDidStart];
                        expect(_cell.userInteractionEnabled).to.beFalsy();
                    });
                });
            });
        });
    });
    
    describe(@"when it advances to the next state", ^{
        context(@"the cell is changing from alive to dead", ^{
            it(@"sets the current state to dead", ^{
                _cell = [[JDVCell alloc] init];
                _cell.currentState = JDVCellStateAlive;
                _cell.nextState = JDVCellStateDead;
                
                [_cell advanceToNextState];
                expect(_cell.currentState).to.equal(JDVCellStateDead);
            });
        });
        
        context(@"the cell is changing from dead to alive", ^{
            it(@"sets the current state to alive", ^{
                _cell = [[JDVCell alloc] init];
                _cell.currentState = JDVCellStateDead;
                _cell.nextState = JDVCellStateAlive;
                
                [_cell advanceToNextState];
                expect(_cell.currentState).to.equal(JDVCellStateAlive);
            });
        });
        
        context(@"the cell is staying alive", ^{
            it(@"sets the current state to alive", ^{
                _cell = [[JDVCell alloc] init];
                _cell.currentState = JDVCellStateAlive;
                _cell.nextState = JDVCellStateAlive;
                
                [_cell advanceToNextState];
                expect(_cell.currentState).to.equal(JDVCellStateAlive);
            });
        });
        
        context(@"the cell is staying dead", ^{
            it(@"sets the current state to dead", ^{
                _cell = [[JDVCell alloc] init];
                _cell.currentState = JDVCellStateDead;
                _cell.nextState = JDVCellStateDead;
                
                [_cell advanceToNextState];
                expect(_cell.currentState).to.equal(JDVCellStateDead);
            });
        });
    });
});

SpecEnd
