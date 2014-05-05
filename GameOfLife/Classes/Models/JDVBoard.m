//
//  JDVBoard.m
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVBoard.h"

@implementation JDVBoard

- (id)initWithCells:(NSArray *)cells
{
    self = [super init];
    if (self) {
        _cells = cells;
    }
    return self;
}

- (id)init
{
    return [self initWithCells:[self initialCells]];
}

#pragma mark - private methods

- (NSArray *)initialCells
{
    return @[];
}

@end
