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
        _cellsPerSide = 24;
        _sideLength = 728;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (JDVCell *cell in self.board.cells) {
        cell.frame = CGRectMake(1, 1, 2, 2);
        [self.view addSubview:cell];
    }
}

@end
