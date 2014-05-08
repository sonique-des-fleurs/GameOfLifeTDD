//
//  JDVBoardViewController.m
//  GameOfLife
//
//  Created by sonique on 5/5/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVBoardViewController.h"
#import "JDVCell.h"

@interface JDVBoardViewController ()

@end

@implementation JDVBoardViewController

- (id)initWithCellsPerRow:(NSInteger)numberOfCellsPerRow
{
    self = [super init];
    if (self) {
        _numberOfCellsPerRow = numberOfCellsPerRow;
        _boardColor = [UIColor greenColor];
        _boardWidth = 728;
        _lineWidth = 2;
        [self initializeCells];
    }
    return self;
}

- (id)init
{
    return [self initWithCellsPerRow:24];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = self.boardColor;
    self.cellWidth = [self calculatedCellWidth];
    
    for (JDVCell *cell in self.cells) {
        [self setFrameForCell:cell];
        [self.view addSubview:cell];
    }
}

- (void)update
{
    for (JDVCell *cell in self.cells) {
        NSSet *neighbors = [self neighborsForCell:cell];
        [cell setNextStateWithNeighbors:neighbors];
    }
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
    for (int row = 0; row < self.numberOfCellsPerRow; row++) {
        for (int column = 0; column < self.numberOfCellsPerRow; column++) {
            JDVCell *cell = [[JDVCell alloc] initWithBoardLocation:@{JDVCellRow:[NSNumber numberWithInt:(row + 1)], JDVCellColumn:[NSNumber numberWithInt:(column + 1)]}];
            [cells addObject:cell];
        };
    };
    _cells = cells;
}

- (CGFloat)calculatedCellWidth
{
    return (self.boardWidth - ((self.numberOfCellsPerRow + 1) * self.lineWidth)) / self.numberOfCellsPerRow;
}

- (void)setFrameForCell:(JDVCell *)cell
{
    NSInteger cellColumn = [cell.boardLocation[JDVCellColumn] integerValue];
    NSInteger cellRow = [cell.boardLocation[JDVCellRow] integerValue];
    CGFloat cellOriginX = (cellColumn * self.lineWidth) + ((cellColumn - 1) * self.cellWidth);
    CGFloat cellOriginY = (cellRow * self.lineWidth) + ((cellRow - 1) * self.cellWidth);
    cell.frame = CGRectMake(cellOriginX, cellOriginY, self.cellWidth, self.cellWidth);
}

- (NSSet *)neighborsForCell:(JDVCell *)cell
{
    NSMutableSet *neighbors = [NSMutableSet setWithArray:self.cells];
    for (JDVCell *testCell in self.cells) {
        NSDictionary *testCellLocation = testCell.boardLocation;
        if ((abs([cell.boardLocation[JDVCellRow] intValue] - [testCellLocation[JDVCellRow] intValue]) <= 1) &&
            (abs([cell.boardLocation[JDVCellColumn] intValue] - [testCellLocation[JDVCellColumn] intValue]) <= 1) &&
            (testCell != cell)) {
            continue;
        } else {
            [neighbors removeObject:testCell];
        }
    };
    return neighbors;
}

@end
