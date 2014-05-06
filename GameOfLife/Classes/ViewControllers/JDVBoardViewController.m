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
    self.cellWidth = (self.boardWidth - ((self.numberOfCellsPerRow + 1) * self.lineWidth)) / self.numberOfCellsPerRow;
    
    for (JDVCell *cell in self.cells) {
        CGFloat cellOriginX = (cell.column * self.lineWidth) + ((cell.column - 1) * self.cellWidth);
        CGFloat cellOriginY = (cell.row * self.lineWidth) + ((cell.row - 1) * self.cellWidth);
        cell.frame = CGRectMake(cellOriginX, cellOriginY, self.cellWidth, self.cellWidth);
        cell.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:cell];
    }
}

#pragma mark - private methods

- (void)initializeCells
{
    NSMutableArray *cells = [NSMutableArray array];
    NSInteger numberOfCells = (self.numberOfCellsPerRow * self.numberOfCellsPerRow);
    for (int i = 0; i < numberOfCells; i++) {
        JDVCell *cell = [[JDVCell alloc] init];
        [cells addObject:cell];
    };
    _cells = cells;
}

@end
