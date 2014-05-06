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
@property (strong, nonatomic) UIColor *boardColor;
@property (assign, nonatomic) CGFloat boardWidth;
@property (assign, nonatomic) CGFloat lineWidth;
@property (assign, nonatomic) NSInteger numberOfCellsPerRow;
@property (assign, nonatomic) CGFloat cellWidth;

@end
