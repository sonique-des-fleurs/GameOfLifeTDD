//
//  JDVBoardViewController.h
//  GameOfLife
//
//  Created by sonique on 5/5/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVBoard.h"

@interface JDVBoardViewController : UIViewController

@property (strong, nonatomic) JDVBoard *board;
@property (assign, nonatomic) CGFloat boardWidth;
@property (assign, nonatomic) CGFloat lineWidth;
@property (assign, nonatomic) CGFloat cellWidth;
@property (assign, nonatomic) NSInteger numberOfCellsPerRow;

@end
