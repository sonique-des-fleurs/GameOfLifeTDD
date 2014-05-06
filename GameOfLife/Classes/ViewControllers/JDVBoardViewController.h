//
//  JDVBoardViewController.h
//  GameOfLife
//
//  Created by sonique on 5/5/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

@interface JDVBoardViewController : UIViewController

@property (strong, nonatomic) NSArray *cells;
@property (strong, nonatomic) UIColor *boardColor;
@property (assign, nonatomic) CGFloat boardWidth;
@property (assign, nonatomic) CGFloat lineWidth;
@property (assign, nonatomic) NSInteger numberOfCellsPerRow;
@property (assign, nonatomic) CGFloat cellWidth;

- (id)initWithCellsPerRow:(NSInteger)numberOfCellsPerRow;

@end
