//
//  JDVCell.m
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVCell.h"

NSString *const JDVCellRow = @"row";
NSString *const JDVCellColumn = @"column";

@implementation JDVCell

- (id)initWithBoardLocation:(NSDictionary *)location
{
    self = [super init];
    if (self) {
        _boardLocation = location;
    }
    return self;
}

- (id)init
{
    return [self initWithBoardLocation:@{JDVCellRow: @0, JDVCellColumn:@0}];
}

- (void)setNextState
{
    //
}

@end
