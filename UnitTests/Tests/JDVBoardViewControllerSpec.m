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
    describe(@"when it is created with 1 cell per row", ^{
        __block JDVBoardViewController *_boardVC;
        __block NSMutableArray *_allCellLocations;

        beforeEach(^{
            _boardVC = [[JDVBoardViewController alloc] initWithCellsPerRow:1];
        });
        
        it(@"sets the value of the numberOfCellsPerRow property", ^{
            expect(_boardVC.numberOfCellsPerRow).to.equal(1);
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
    
    describe(@"when it is created with 2 cells per row", ^{
        __block JDVBoardViewController *_boardVC;
        __block NSMutableArray *_allCellLocations;

        beforeEach(^{
            _boardVC = [[JDVBoardViewController alloc] initWithCellsPerRow:2];
            
            _allCellLocations = [NSMutableArray array];
            for (JDVCell *cell in _boardVC.cells) {
                [_allCellLocations addObject:cell.boardLocation];
            }
        });
        
        it(@"sets the value of the numberOfCellsPerRow property", ^{
            expect(_boardVC.numberOfCellsPerRow).to.equal(2);
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
        
        it(@"sets the value of its cells property", ^{
            expect(_boardVC.cells).notTo.beNil();
        });
        
        it(@"sets the value of the lineWidth property", ^{
            expect(_boardVC.lineWidth).notTo.equal(0);
        });
        
        it(@"sets the value of the numberOfCellsPerRow property", ^{
            expect(_boardVC.numberOfCellsPerRow).notTo.equal(0);
        });
        
        it(@"sets the value of the boardWidth property", ^{
            expect(_boardVC.boardWidth).notTo.equal(0);
        });
        
        it(@"sets the value of the board color property", ^{
            expect(_boardVC.boardColor).notTo.beNil();
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
        
        context(@"board with width 10.0", ^{
            beforeEach(^{
                _boardVC.boardWidth = 10;
                _boardVC.numberOfCellsPerRow = 2;
            });
            
            context(@"board with lineWidth 1.0", ^{
                beforeEach(^{
                    _boardVC.lineWidth = 1;
                });
                
                it(@"calculates and sets the value of the cellWidth property", ^{
                    [_boardVC view];
                    expect(_boardVC.cellWidth).to.equal(3.5);
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
            
            context(@"board with lineWidth 2.0", ^{
                beforeEach(^{
                    _boardVC.lineWidth = 2;
                });
                
                it(@"calculates and sets the value of the cellWidth property", ^{
                    [_boardVC view];
                    expect(_boardVC.cellWidth).to.equal(2);
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
    
    describe(@"when it resets the cells", ^{
        
    });
    
    describe(@"when it updates", ^{
        it(@"sets the next state for each cell", ^{
            JDVBoardViewController *boardVC = [[JDVBoardViewController alloc] init];
            id mockCell = [OCMockObject mockForClass:[JDVCell class]];
            [[mockCell expect] setNextState];
            boardVC.cells = @[mockCell];
            
            [boardVC update];
            [mockCell verify];
        });
    });
});

SpecEnd
