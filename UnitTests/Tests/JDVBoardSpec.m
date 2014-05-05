//
//  JDVBoardSpec.m
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVBoard.h"
#import "JDVCell.h"

SpecBegin(JDVBoard)

describe(@"JDVBoard", ^{
    describe(@"when it is created without a collection of cells", ^{
        it(@"sets the value of its cells property", ^{
            JDVBoard *newBoard = [[JDVBoard alloc] init];
            expect(newBoard.cells).notTo.beNil();
        });
    });
    
    describe(@"when it is created with a collection of cells", ^{
        it(@"sets the value of its cells property to be equal to that collection", ^{
            id mockCell = [OCMockObject niceMockForClass:[JDVCell class]];
            NSArray *initialCells = @[mockCell];
            JDVBoard *newBoard = [[JDVBoard alloc] initWithCells:initialCells];
            expect(newBoard.cells).to.equal(initialCells);
        });
    });
});

SpecEnd
