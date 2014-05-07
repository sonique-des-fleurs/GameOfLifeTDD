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
    });
});

SpecEnd
