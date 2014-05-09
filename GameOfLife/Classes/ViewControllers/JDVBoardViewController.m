//
//  JDVBoardViewController.m
//  GameOfLife
//
//  Created by sonique on 5/5/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVBoardViewController.h"
#import "JDVCell.h"

CGFloat const kJDVBoardSize = 728;
CGFloat const kJDVLineSize = 2;
NSInteger const kJDVCellsPerSide = 24;

@interface JDVBoardViewController ()

@end

@implementation JDVBoardViewController

- (id)initWithCellsPerSide:(NSInteger)numberOfCellsPerSide
{
    self = [super init];
    if (self) {
        _numberOfCellsPerSide = numberOfCellsPerSide;
        _boardColor = [UIColor greenColor];
        _boardSize = kJDVBoardSize;
        _lineSize = kJDVLineSize;
        [self initializeCells];
    }
    return self;
}

- (id)init
{
    return [self initWithCellsPerSide:kJDVCellsPerSide];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = self.boardColor;
    self.cellSize = [self calculatedCellWidth];
    
    for (JDVCell *cell in self.cells) {
        [self setFrameForCell:cell];
        [self.view addSubview:cell];
    }
}

- (void)update:(NSTimer *)timer
{
    [self setNextStateForCells];
    [self advanceCellsToNextState];
}

- (void)reset
{
    for (JDVCell *cell in self.cells) {
        [cell reset];
    }
}

- (void)gameDidStart
{
    for (JDVCell *cell in self.cells) {
        [cell gameDidStart];
    }
}

- (void)gameDidStop
{
    for (JDVCell *cell in self.cells) {
        [cell gameDidStop];
    }
}

#pragma mark - private methods

- (void)initializeCells
{
    NSMutableArray *cells = [NSMutableArray array];
    for (int row = 0; row < self.numberOfCellsPerSide; row++) {
        for (int column = 0; column < self.numberOfCellsPerSide; column++) {
            JDVCell *cell = [[JDVCell alloc] initWithBoardLocation:@{JDVCellRow:@(row + 1), JDVCellColumn:@(column + 1)}];
            [cells addObject:cell];
        };
    };
    _cells = cells;
}

- (CGFloat)calculatedCellWidth
{
    return (self.boardSize - ((self.numberOfCellsPerSide + 1) * self.lineSize)) / self.numberOfCellsPerSide;
}

- (void)setFrameForCell:(JDVCell *)cell
{
    NSInteger cellColumn = [cell.boardLocation[JDVCellColumn] integerValue];
    NSInteger cellRow = [cell.boardLocation[JDVCellRow] integerValue];
    CGFloat cellOriginX = (cellColumn * self.lineSize) + ((cellColumn - 1) * self.cellSize);
    CGFloat cellOriginY = (cellRow * self.lineSize) + ((cellRow - 1) * self.cellSize);
    cell.frame = CGRectMake(cellOriginX, cellOriginY, self.cellSize, self.cellSize);
}

- (NSSet *)neighborsForCell:(JDVCell *)cell
{
    NSMutableSet *neighbors = [NSMutableSet setWithArray:self.cells];
    for (JDVCell *possibleNeighborCell in self.cells) {
        NSDictionary *testCellLocation = possibleNeighborCell.boardLocation;
        if ((abs([cell.boardLocation[JDVCellRow] intValue] - [testCellLocation[JDVCellRow] intValue]) <= 1) &&
            (abs([cell.boardLocation[JDVCellColumn] intValue] - [testCellLocation[JDVCellColumn] intValue]) <= 1) &&
            (possibleNeighborCell != cell)) {
            continue;
        } else {
            [neighbors removeObject:possibleNeighborCell];
        }
    };
    return neighbors;
}

- (void)setNextStateForCells
{
    for (JDVCell *cell in self.cells) {
        NSSet *neighbors = [self neighborsForCell:cell];
        [cell setNextStateWithNeighbors:neighbors];
    }
}

- (void)advanceCellsToNextState
{
    for (JDVCell *cell in self.cells) {
        [cell advanceToNextState];
    }
}

@end
