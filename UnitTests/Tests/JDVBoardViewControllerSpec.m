//
//  JDVBoardViewControllerSpec.m
//  GameOfLife
//
//  Created by sonique on 5/5/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVBoardViewController.h"
#import "JDVCell.h"

SpecBegin(JDVBoardViewController)
describe(@"JDVBoardViewController", ^{
    describe(@"when it is created with 1 cell per side", ^{
        __block JDVBoardViewController *_boardVC;
        __block NSMutableArray *_allCellLocations;

        beforeEach(^{
            _boardVC = [[JDVBoardViewController alloc] initWithCellsPerSide:1];
        });
        
        it(@"sets the value of the cellsPerSide property", ^{
            expect(_boardVC.cellsPerSide).to.equal(1);
        });
        
        it(@"assigns a collection containing 1 cell to the cells property", ^{
            expect(_boardVC.cells).to.haveCountOf(1);
        });
        
        it(@"creates a cell at row 1, column 1", ^{
            _allCellLocations = [NSMutableArray array];
            for (JDVCell *cell in _boardVC.cells) {
                [_allCellLocations addObject:cell.boardLocation];
            }
            expect(_allCellLocations).to.contain((@{JDVCellRow: @1, JDVCellColumn: @1}));
        });
    });
    
    describe(@"when it is created with 2 cells per side", ^{
        __block JDVBoardViewController *_boardVC;
        __block NSMutableArray *_allCellLocations;

        beforeEach(^{
            _boardVC = [[JDVBoardViewController alloc] initWithCellsPerSide:2];
            
            _allCellLocations = [NSMutableArray array];
            for (JDVCell *cell in _boardVC.cells) {
                [_allCellLocations addObject:cell.boardLocation];
            }
        });
        
        it(@"sets the value of the cellsPerSide property", ^{
            expect(_boardVC.cellsPerSide).to.equal(2);
        });
        
        it(@"assigns a collection containing 4 cells to the cells property", ^{
            expect(_boardVC.cells).to.haveCountOf(4);
        });
        
        it(@"creates a cell at row 1, column 1", ^{
            expect(_allCellLocations).to.contain((@{JDVCellRow: @1, JDVCellColumn: @1}));
        });
        
        it(@"creates a cell at row 1, column 2", ^{
            expect(_allCellLocations).to.contain((@{JDVCellRow: @1, JDVCellColumn: @2}));
        });
        
        it(@"creates a cell at row 2, column 1", ^{
            expect(_allCellLocations).to.contain((@{JDVCellRow: @2, JDVCellColumn: @1}));
        });
        
        it(@"creates a cell at row 2, column 2", ^{
            expect(_allCellLocations).to.contain((@{JDVCellRow: @2, JDVCellColumn: @2}));
        });
    });
    
    describe(@"when it is created", ^{
        __block JDVBoardViewController *_boardVC;

        beforeEach(^{
            _boardVC = [[JDVBoardViewController alloc] init];
        });
        
        it(@"sets value of the boardColor property", ^{
            expect(_boardVC.boardColor).notTo.beNil();
        });
        
        it(@"sets the value of the boardSize property", ^{
            expect(_boardVC.boardSize).notTo.equal(0);
        });
        
        it(@"sets the value of the lineSize property", ^{
            expect(_boardVC.lineSize).notTo.equal(0);
        });
        
        it(@"sets the value of the cellsPerSide property", ^{
            expect(_boardVC.cellsPerSide).notTo.equal(0);
        });
        
        it(@"sets the value of its cells property", ^{
            expect(_boardVC.cells).notTo.beNil();
        });
    });
    
    describe(@"when it is created with a dictionary of board properties", ^{
        __block JDVBoardViewController *_boardVC;
        
        beforeEach(^{
            NSDictionary *boardProperties = @{JDVBoardColorKey: [UIColor blueColor],
                                              JDVBoardSizeKey: @11.0,
                                              JDVBoardLineSizeKey: @3.0,
                                              JDVBoardCellsPerSideKey: @2};
            _boardVC = [[JDVBoardViewController alloc] initWithBoardProperties:boardProperties];
        });
        
        it(@"assigns a value to the boardColor property", ^{
            expect(_boardVC.boardColor).to.equal([UIColor blueColor]);
        });
        
        it(@"assigns a value to the boardSize property", ^{
            expect(_boardVC.boardSize).to.equal(11.0);
        });
        
        it(@"assigns a value to the lineSize property", ^{
            expect(_boardVC.lineSize).to.equal(3.0);
        });
        
        it(@"assigns a value to the cellsPerSide property", ^{
            expect(_boardVC.cellsPerSide).to.equal(2);
        });
    });
    
    describe(@"when its view property is accessed", ^{
        __block JDVBoardViewController *_boardVC;

        beforeEach(^{
            _boardVC = [[JDVBoardViewController alloc] init];
        });
        
        it(@"assigns the board color to the background color of the view", ^{
            _boardVC.boardColor = [UIColor orangeColor];
            
            [_boardVC view];
            expect(_boardVC.view.backgroundColor).to.equal([UIColor orangeColor]);
        });
        
        context(@"board with size 10.0", ^{
            beforeEach(^{
                _boardVC.boardSize = 10;
                _boardVC.cellsPerSide = 2;
            });
            
            context(@"board with lineSize 1.0", ^{
                beforeEach(^{
                    _boardVC.lineSize = 1;
                });
                
                it(@"calculates and sets the value of the cellSize property", ^{
                    [_boardVC view];
                    expect(_boardVC.cellSize).to.equal(3.5);
                });
                
                it(@"sets the frame for the top-left cell", ^{
                    id mockCell = [OCMockObject partialMockForObject:[[JDVCell alloc] init]];
                    [[[mockCell stub] andReturn:@{JDVCellRow:@1, JDVCellColumn:@1}] boardLocation];
                    [[mockCell expect] setFrame:CGRectMake(1, 1, 3.5, 3.5)];
                    _boardVC.cells = @[mockCell];
                    
                    [_boardVC view];
                    [mockCell verify];
                });
                
                it(@"sets the frame for the top-right cell", ^{
                    id mockCell = [OCMockObject partialMockForObject:[[JDVCell alloc] init]];
                    [[[mockCell stub] andReturn:@{JDVCellRow:@1, JDVCellColumn:@2}] boardLocation];
                    [[mockCell expect] setFrame:CGRectMake(5.5, 1, 3.5, 3.5)];
                    _boardVC.cells = @[mockCell];
                    
                    [_boardVC view];
                    [mockCell verify];
                });
                
                it(@"sets the frame for the bottom-left cell", ^{
                    id mockCell = [OCMockObject partialMockForObject:[[JDVCell alloc] init]];
                    [[[mockCell stub] andReturn:@{JDVCellRow:@2, JDVCellColumn:@1}] boardLocation];
                    [[mockCell expect] setFrame:CGRectMake(1, 5.5, 3.5, 3.5)];
                    _boardVC.cells = @[mockCell];
                    
                    [_boardVC view];
                    [mockCell verify];
                });
            });
            
            context(@"board with lineSize 2.0", ^{
                beforeEach(^{
                    _boardVC.lineSize = 2;
                });
                
                it(@"calculates and sets the value of the cellSize property", ^{
                    [_boardVC view];
                    expect(_boardVC.cellSize).to.equal(2);
                });
                
                it(@"sets the frame for the top-left cell", ^{
                    id mockCell = [OCMockObject partialMockForObject:[[JDVCell alloc] init]];
                    [[[mockCell stub] andReturn:@{JDVCellRow:@1, JDVCellColumn:@1}] boardLocation];
                    [[mockCell expect] setFrame:CGRectMake(2, 2, 2, 2)];
                    _boardVC.cells = @[mockCell];
                    
                    [_boardVC view];
                    [mockCell verify];
                });
                
                it(@"sets the frame for the top-right cell", ^{
                    id mockCell = [OCMockObject partialMockForObject:[[JDVCell alloc] init]];
                    [[[mockCell stub] andReturn:@{JDVCellRow:@1, JDVCellColumn:@2}] boardLocation];
                    [[mockCell expect] setFrame:CGRectMake(6, 2, 2, 2)];
                    _boardVC.cells = @[mockCell];
                    
                    [_boardVC view];
                    [mockCell verify];
                });
                
                it(@"sets the frame for the bottom-left cell", ^{
                    id mockCell = [OCMockObject partialMockForObject:[[JDVCell alloc] init]];
                    [[[mockCell stub] andReturn:@{JDVCellRow:@2, JDVCellColumn:@1}] boardLocation];
                    [[mockCell expect] setFrame:CGRectMake(2, 6, 2, 2)];
                    _boardVC.cells = @[mockCell];
                    
                    [_boardVC view];
                    [mockCell verify];
                });
            });
        });
        
        it(@"adds the cells to the view", ^{
            JDVCell *cell = [[JDVCell alloc] init];
            _boardVC.cells = @[cell];
            
            [_boardVC view];
            expect(_boardVC.view.subviews).to.contain(cell);
        });
    });
    
    describe(@"when it resets", ^{
        it(@"resets each of the cells", ^{
            JDVBoardViewController *boardVC = [[JDVBoardViewController alloc] init];
            id mockCell = [OCMockObject mockForClass:[JDVCell class]];
            [[mockCell expect] reset];
            boardVC.cells = @[mockCell];
            
            [boardVC reset];
            [mockCell verify];
        });
    });
    
    describe(@"when it updates", ^{
        __block JDVBoardViewController *_boardVC;
        
        beforeEach(^{
            _boardVC = [[JDVBoardViewController alloc] init];
        });
        
        context(@"before advancing each cell to the next state", ^{
            __block JDVCell *_cell1_1 = [[JDVCell alloc] init];
            __block JDVCell *_cell1_2 = [[JDVCell alloc] init];
            __block JDVCell *_cell1_3 = [[JDVCell alloc] init];
            __block JDVCell *_cell1_4 = [[JDVCell alloc] init];
            __block JDVCell *_cell2_1 = [[JDVCell alloc] init];
            __block JDVCell *_cell2_2 = [[JDVCell alloc] init];
            __block JDVCell *_cell2_3 = [[JDVCell alloc] init];
            __block JDVCell *_cell2_4 = [[JDVCell alloc] init];
            __block JDVCell *_cell3_1 = [[JDVCell alloc] init];
            __block JDVCell *_cell3_2 = [[JDVCell alloc] init];
            __block JDVCell *_cell3_3 = [[JDVCell alloc] init];
            __block JDVCell *_cell3_4 = [[JDVCell alloc] init];
            __block JDVCell *_cell4_1 = [[JDVCell alloc] init];
            __block JDVCell *_cell4_2 = [[JDVCell alloc] init];
            __block JDVCell *_cell4_3 = [[JDVCell alloc] init];
            __block JDVCell *_cell4_4 = [[JDVCell alloc] init];
            NSArray *cells = @[_cell1_1, _cell1_2, _cell1_3, _cell1_4,
                               _cell2_1, _cell2_2, _cell2_3, _cell2_4,
                               _cell3_1, _cell3_2, _cell3_3, _cell3_4,
                               _cell4_1, _cell4_2, _cell4_3, _cell4_4];
            
            beforeEach(^{
                _boardVC.cells = cells;
                for (JDVCell *cell in cells) {
                    int row = ([cells indexOfObject:cell] / 4) + 1;
                    int column = ([cells indexOfObject:cell] % 4) + 1;
                    cell.boardLocation = @{JDVCellRow:@(row), JDVCellColumn:@(column)};
                }
            });
            
            it(@"sends an interior cell the 8 surrounding neighbors in order to set the next state", ^{
                id mockInteriorCell = [OCMockObject partialMockForObject:_cell3_3];
                NSSet *neighbors = [NSSet setWithObjects:_cell2_2, _cell2_3, _cell2_4, _cell3_2, _cell3_4, _cell4_2, _cell4_3, _cell4_4, nil];
                [[mockInteriorCell expect] setNextStateWithNeighbors:neighbors];
                
                [_boardVC update:nil];
                [mockInteriorCell verify];
            });
            
            it(@"sends a cell on an edge the 5 surrounding neighbors in order to set the next state", ^{
                id mockEdgeCell = [OCMockObject partialMockForObject:_cell3_1];
                NSSet *neighbors = [NSSet setWithObjects:_cell2_1, _cell2_2, _cell3_2, _cell4_1, _cell4_2, nil];
                [[mockEdgeCell expect] setNextStateWithNeighbors:neighbors];
                
                [_boardVC update:nil];
                [mockEdgeCell verify];
            });
            
            it(@"sends a cell in a corner the 3 surrounding neighbors in order to set the next state", ^{
                id mockCornerCell = [OCMockObject partialMockForObject:_cell1_4];
                NSSet *neighbors = [NSSet setWithObjects:_cell1_3, _cell2_3, _cell2_4, nil];
                [[mockCornerCell expect] setNextStateWithNeighbors:neighbors];
                
                [_boardVC update:nil];
                [mockCornerCell verify];
            });
        });
        
        context(@"after each cell has determined the next state", ^{
            it(@"advances each cell to the next state", ^{
                id mockCell = [OCMockObject niceMockForClass:[JDVCell class]];
                [[mockCell expect] advanceToNextState];
                _boardVC.cells = @[mockCell];
                
                [_boardVC update:nil];
                [mockCell verify];
            });
        });
    });
    
    describe(@"when the game starts", ^{
        it(@"tells each of the cells", ^{
            JDVBoardViewController *boardVC = [[JDVBoardViewController alloc] init];
            id mockCell = [OCMockObject mockForClass:[JDVCell class]];
            [[mockCell expect] gameDidStart];
            boardVC.cells = @[mockCell];
            
            [boardVC gameDidStart];
            [mockCell verify];
        });
    });
    
    describe(@"when the game stops", ^{
        it(@"tells each of the cells", ^{
            JDVBoardViewController *boardVC = [[JDVBoardViewController alloc] init];
            id mockCell = [OCMockObject mockForClass:[JDVCell class]];
            [[mockCell expect] gameDidStop];
            boardVC.cells = @[mockCell];
            
            [boardVC gameDidStop];
            [mockCell verify];
        });
    });
});

SpecEnd
