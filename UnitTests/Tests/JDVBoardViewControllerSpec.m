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
        it(@"assigns a JDVBoard to its board property", ^{
            expect(_boardVC.board).to.beInstanceOf([JDVBoard class]);
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
