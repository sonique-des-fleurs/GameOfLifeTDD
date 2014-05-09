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
        self.currentState = JDVCellStateDead;
        [self addTarget:self action:@selector(toggleState:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (id)init
{
    return [self initWithBoardLocation:@{JDVCellRow: @0, JDVCellColumn:@0}];
}

- (void)setNextStateWithNeighbors:(NSSet *)neighbors
{
    NSInteger numberOfLivingNeighbors = [self numberOfLivingCells:neighbors];
    [self setNextStateGivenNumberOfLivingNeighbors:numberOfLivingNeighbors];
}

- (void)reset
{
    self.currentState = JDVCellStateDead;
}

- (void)toggleState:(id)sender
{
    if (self.currentState == JDVCellStateAlive) {
        self.currentState = JDVCellStateDead;
    } else {
        self.currentState = JDVCellStateAlive;
    }
}

- (void)gameDidStart
{
    self.userInteractionEnabled = FALSE;
}

- (void)gameDidStop
{
    self.userInteractionEnabled = TRUE;
}

- (void)advanceToNextState
{
    self.currentState = self.nextState;
}

- (void)setCurrentState:(JDVCellState)currentState
{
    _currentState = currentState;
    if (currentState == JDVCellStateAlive) {
        self.backgroundColor = [UIColor blackColor];
    } else {
        self.backgroundColor = [UIColor lightGrayColor];
    }
}

#pragma mark - private methods

- (NSInteger)numberOfLivingCells:(NSSet *)cells
{
    NSInteger numberOfLivingCells = 0;
    
    for (JDVCell *cell in cells) {
        if (cell.currentState == JDVCellStateAlive) {
            numberOfLivingCells++;
        }
    }
    
    return numberOfLivingCells;
}

- (void)setNextStateGivenNumberOfLivingNeighbors:(NSInteger)numberOfLivingNeighbors
{
    if (self.currentState == JDVCellStateAlive) {
        if (numberOfLivingNeighbors == 2 || numberOfLivingNeighbors == 3) {
            self.nextState = JDVCellStateAlive;
        } else {
            self.nextState = JDVCellStateDead;
        }
    } else {
        if (numberOfLivingNeighbors == 3) {
            self.nextState = JDVCellStateAlive;
        } else {
            self.nextState = JDVCellStateDead;
        }
    }
}

@end
