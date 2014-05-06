//
//  JDVBoardViewControllerSpec.m
//  GameOfLife
//
//  Created by sonique on 5/5/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVBoardViewController.h"
#import "JDVBoard.h"
#import "JDVCell.h"

SpecBegin(JDVBoardViewController)
describe(@"JDVBoardViewController", ^{
    __block JDVBoardViewController *_boardVC;
    
    beforeEach(^{
        _boardVC = [[JDVBoardViewController alloc] init];
    });
    
    describe(@"when it is created", ^{
        it(@"assigns a JDVBoard to the board property", ^{
            expect(_boardVC.board).to.beInstanceOf([JDVBoard class]);
        });
        
        it(@"sets the value of the lineWidth property", ^{
            expect(_boardVC.lineWidth).notTo.equal(0);
        });
        
        it(@"sets the value of the cellsPerSide property", ^{
            expect(_boardVC.cellsPerSide).notTo.equal(0);
        });
        
        it(@"sets the value of the sideLength property", ^{
            expect(_boardVC.sideLength).notTo.equal(0);
        });
    });
    
    describe(@"when its view property is accessed", ^{
        it(@"sets the frame for each of the board's cells", ^{
            id mockCell = [OCMockObject partialMockForObject:[[JDVCell alloc] init]];
            [[[mockCell expect] ignoringNonObjectArgs] setFrame:CGRectZero];
            
            id mockBoard = [OCMockObject mockForClass:[JDVBoard class]];
            [[[mockBoard stub] andReturn:@[mockCell]] cells];
            _boardVC.board = mockBoard;
            
            [_boardVC view];
            [mockCell verify];
        });
        
        it(@"sets the frame for the top-left cell of the board", ^{
            _boardVC.sideLength = 7;
            _boardVC.lineWidth = 1;
            _boardVC.cellsPerSide = 2;
            
            id mockCell = [OCMockObject partialMockForObject:[[JDVCell alloc] init]];
            [[[mockCell stub] andReturnValue:@1] row];
            [[[mockCell stub] andReturnValue:@1] column];
            [[mockCell expect] setFrame:CGRectMake(1, 1, 2, 2)];
            
            id mockBoard = [OCMockObject mockForClass:[JDVBoard class]];
            [[[mockBoard stub] andReturn:@[mockCell]] cells];
            _boardVC.board = mockBoard;
            
            [_boardVC view];
            [mockCell verify];
        });
        
        xit(@"sets the frame for the top-right cell", ^{
            
        });
        
        xit(@"sets the frame for the bottom-left cell", ^{
            
        });
        
        it(@"adds the board's cells to the view", ^{
            JDVCell *cell = [[JDVCell alloc] init];
            id mockBoard = [OCMockObject mockForClass:[JDVBoard class]];
            [[[mockBoard stub] andReturn:@[cell]] cells];
            _boardVC.board = mockBoard;
            
            [_boardVC view];
            expect(_boardVC.view.subviews).to.contain(cell);
        });

    });
});

SpecEnd
