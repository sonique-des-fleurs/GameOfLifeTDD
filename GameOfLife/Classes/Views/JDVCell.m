//
//  JDVCell.m
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVCell.h"

@implementation JDVCell

- (id)initWithRow:(NSInteger)row column:(NSInteger)column
{
    self = [super init];
    if (self) {
        _row = row;
        _column = column;
    }
    return self;
}

- (id)init
{
    return [self initWithRow:1 column:1];
}

@end
