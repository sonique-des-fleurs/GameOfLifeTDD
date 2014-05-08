//
//  JDVCell.h
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

extern NSString *const JDVCellRow;
extern NSString *const JDVCellColumn;

@interface JDVCell : UIButton

@property (assign, nonatomic) NSDictionary *boardLocation;

- (id)initWithBoardLocation:(NSDictionary *)location;
- (void)setNextState;
- (void)reset;

@end
