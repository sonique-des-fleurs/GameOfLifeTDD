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
        [self setDead];
    } else {
        [self setAlive];
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

- (NSInteger)numberOfLivingCells:(NSSet *)cells
{
    NSInteger numberOfLivingCells = 0;
    
    for (JDVCell *cell in cells) {
        NSLog(@"cellstate = %d", cell.currentState);
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
