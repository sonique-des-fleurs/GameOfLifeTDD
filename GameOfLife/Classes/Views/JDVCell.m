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
        [self setDead];
        [self addTarget:self action:@selector(toggleState:) forControlEvents:UIControlEventTouchUpInside];
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

- (void)reset
{
    self.currentState = JDVCellStateDead;
}

- (void)toggleState:(id)sender
{
    if (self.currentState == JDVCellStateAlive) {
        [self setDead];
    } else {
        [self setAlive];
    }
}

#pragma mark - private methods

- (void)setDead
{
    self.currentState = JDVCellStateDead;
    self.backgroundColor = [UIColor lightGrayColor];
}

- (void)setAlive
{
    self.currentState = JDVCellStateAlive;
    self.backgroundColor = [UIColor blackColor];
}

@end
