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

@interface JDVCell : UIControl

@property (strong, nonatomic) NSDictionary *boardLocation;
@property (assign, nonatomic) JDVCellState currentState;
@property (assign, nonatomic) JDVCellState nextState;
@property (strong, nonatomic) NSSet *neighbors;

- (id)initWithBoardLocation:(NSDictionary *)location;
- (void)reset;
- (void)toggleState:(id)sender;
- (void)gameDidStart;
- (void)gameDidStop;
- (void)setNextState;
- (void)advanceToNextState;

@end
