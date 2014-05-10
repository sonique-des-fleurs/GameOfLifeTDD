//
//  JDVBoardViewController.h
//  GameOfLife
//
//  Created by sonique on 5/5/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

extern NSString *const JDVBoardColorKey;
extern NSString *const JDVBoardSizeKey;
extern NSString *const JDVBoardLineSizeKey;
extern NSString *const JDVBoardCellsPerSideKey;

@interface JDVBoardViewController : UIViewController

@property (strong, nonatomic) NSArray *cells;
@property (strong, nonatomic) UIColor *boardColor;
@property (assign, nonatomic) CGFloat boardSize;
@property (assign, nonatomic) CGFloat lineSize;
@property (assign, nonatomic) NSInteger cellsPerSide;
@property (assign, nonatomic) CGFloat cellSize;

- (id)initWithBoardProperties:(NSDictionary *)boardProperties;
- (void)reset;
- (void)update:(NSTimer *)timer;
- (void)gameDidStart;
- (void)gameDidStop;

@end
