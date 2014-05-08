//
//  JDVCell.h
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

extern NSString *const JDVCellRow;
extern NSString *const JDVCellColumn;

typedef enum {
    JDVCellStateDead,
    JDVCellStateAlive
} JDVCellState;

@interface JDVCell : UIButton

@property (strong, nonatomic) NSDictionary *boardLocation;
@property (assign, nonatomic) JDVCellState currentState;
@property (assign, nonatomic) JDVCellState nextState;

- (id)initWithBoardLocation:(NSDictionary *)location;
- (void)setNextStateWithNeighbors:(NSSet *)neighbors;
- (void)reset;
- (void)toggleState:(id)sender;
- (void)gameDidStart;
- (void)gameDidStop;
- (void)advanceToNextState;

@end
