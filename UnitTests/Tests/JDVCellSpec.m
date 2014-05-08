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
    
    xdescribe(@"when it sets the next state", ^{
        context(@"living cell", ^{
            context(@"no living neighbors", ^{
                it(@"will be dead", ^{
                    
                });
            });
            
            context(@"1 living neighbor", ^{
                it(@"will be dead", ^{
                    
                });
            });
            
            context(@"2 living neighbors", ^{
                it(@"will be alive", ^{
                    
                });
            });
            
            context(@"3 living neighbors", ^{
                it(@"will be alive", ^{
                    
                });
            });
            
            context(@"4 living neighbors", ^{
                it(@"will be dead", ^{
                    
                });
            });
        });
        
        context(@"dead cell", ^{
            context(@"no living neighbors", ^{
                it(@"will be dead", ^{
                    
                });
            });
            
            context(@"2 living neighbors", ^{
                it(@"will be dead", ^{
                    
                });
            });
            
            context(@"3 living neighbors", ^{
                it(@"will be alive", ^{
                    
                });
            });
            
            context(@"4 living neighbors", ^{
                it(@"will be dead", ^{
                    
                });
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
});

SpecEnd
