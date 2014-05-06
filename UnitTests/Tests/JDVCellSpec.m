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
        it(@"assigns 2 to the row property", ^{
            _cell = [[JDVCell alloc] initWithRow:2 column:1];
            expect(_cell.row).to.equal(2);
        });
    });
    
    describe(@"when it is created in the second column", ^{
        it(@"assigns 2 to the column property", ^{
            _cell = [[JDVCell alloc] initWithRow:1 column:2];
            expect(_cell.column).to.equal(2);
        });
    });
    
    describe(@"when it is created", ^{
        beforeEach(^{
            _cell = [[JDVCell alloc] init];
        });
        
        it(@"sets the value of the row property", ^{
            expect(_cell.row).notTo.equal(0);
        });
        
        it(@"sets the value of the column property", ^{
            expect(_cell.column).notTo.equal(0);
        });
    });
});

SpecEnd
