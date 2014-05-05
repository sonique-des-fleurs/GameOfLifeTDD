//
//  JDVBoard.h
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

@interface JDVBoard : NSObject

@property (strong, nonatomic) NSArray *cells;

- (id)initWithCells:(NSArray *)cells;

@end
