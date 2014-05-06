//
//  JDVGameOfLifeViewController.m
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVGameOfLifeViewController.h"

@interface JDVGameOfLifeViewController ()

@end

@implementation JDVGameOfLifeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _boardVC = [[JDVBoardViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.boardVC.view.frame = CGRectMake(20, 60, 728, 728);
    self.boardVC.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.boardVC.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)toggleRun:(id)sender {
}

- (IBAction)clear:(id)sender {
}

@end
