//
//  JDVGameOfLifeViewController.m
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVGameOfLifeViewController.h"
#import "JDVCell.h"

@interface JDVGameOfLifeViewController ()

@end

@implementation JDVGameOfLifeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _board = [[JDVBoard alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    for (UIView *cell in self.board.cells) {
        cell.frame = CGRectZero;
        [self.boardView addSubview:cell];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleRun:(id)sender {
}

- (IBAction)clear:(id)sender {
}

@end
