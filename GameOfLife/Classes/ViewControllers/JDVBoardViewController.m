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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _board = [[JDVBoard alloc] init];
        _lineWidth = 2;
        _numberOfCellsPerRow = 24;
        _boardWidth = 728;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cellWidth = (self.boardWidth - ((self.numberOfCellsPerRow + 1) * self.lineWidth)) / self.numberOfCellsPerRow;
    NSLog(@"cellWidth = %f", self.cellWidth);
   
    for (JDVCell *cell in self.board.cells) {
        CGFloat cellOriginX = (cell.column * self.lineWidth) + ((cell.column - 1) * self.cellWidth);
        CGFloat cellOriginY = (cell.row * self.lineWidth) + ((cell.row - 1) * self.cellWidth);
        cell.frame = CGRectMake(cellOriginX, cellOriginY, self.cellWidth, self.cellWidth);
        [self.view addSubview:cell];
    }
}

@end
