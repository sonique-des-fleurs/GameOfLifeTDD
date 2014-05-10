//
//  JDVBoardViewController.m
//  GameOfLife
//
//  Created by sonique on 5/5/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVBoardViewController.h"
#import "JDVCell.h"

NSString *const JDVBoardColorKey = @"boardColor";
NSString *const JDVBoardSizeKey = @"boardSize";
NSString *const JDVBoardLineSizeKey = @"lineSize";
NSString *const JDVBoardCellsPerSideKey = @"cellsPerSide";

@implementation JDVBoardViewController

- (id)initWithBoardProperties:(NSDictionary *)boardProperties
{
    self = [super init];
    if (self) {
        _boardColor = boardProperties[JDVBoardColorKey];
        _boardSize = [boardProperties[JDVBoardSizeKey] floatValue];
        _lineSize = [boardProperties[JDVBoardLineSizeKey] floatValue];
        _cellsPerSide = [boardProperties[JDVBoardCellsPerSideKey] integerValue];
        [self initializeCells];
        [self setNeighborsForCells];
    }
    return self;
}

- (id)init
{
    return [self initWithBoardProperties:[self defaultBoardProperties]];
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

- (NSDictionary *)defaultBoardProperties
{
    return @{JDVBoardColorKey: [UIColor blueColor],
             JDVBoardSizeKey: @11.0,
             JDVBoardLineSizeKey: @3.0,
             JDVBoardCellsPerSideKey: @2};
}

- (void)initializeCells
{
    NSMutableArray *cells = [NSMutableArray array];
    for (int row = 0; row < self.cellsPerSide; row++) {
        for (int column = 0; column < self.cellsPerSide; column++) {
            JDVCell *cell = [[JDVCell alloc] initWithBoardLocation:@{JDVCellRow:@(row + 1), JDVCellColumn:@(column + 1)}];
            [cells addObject:cell];
        };
    };
    _cells = cells;
}

- (void)setNeighborsForCells
{
    for (JDVCell *cell in self.cells) {
        cell.neighbors = [self neighborsForCell:cell];
    }
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

- (CGFloat)calculatedCellWidth
{
    return (self.boardSize - ((self.cellsPerSide + 1) * self.lineSize)) / self.cellsPerSide;
}

- (void)setFrameForCell:(JDVCell *)cell
{
    NSInteger cellColumn = [cell.boardLocation[JDVCellColumn] integerValue];
    NSInteger cellRow = [cell.boardLocation[JDVCellRow] integerValue];
    CGFloat cellOriginX = (cellColumn * self.lineSize) + ((cellColumn - 1) * self.cellSize);
    CGFloat cellOriginY = (cellRow * self.lineSize) + ((cellRow - 1) * self.cellSize);
    cell.frame = CGRectMake(cellOriginX, cellOriginY, self.cellSize, self.cellSize);
}

- (void)setNextStateForCells
{
    for (JDVCell *cell in self.cells) {
        [cell setNextState];
    }
}

- (void)advanceCellsToNextState
{
    for (JDVCell *cell in self.cells) {
        [cell advanceToNextState];
    }
}

@end
