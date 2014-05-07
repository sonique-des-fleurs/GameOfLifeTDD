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
        _gameIsRunning = FALSE;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.boardVC.view.frame = CGRectMake(20, 60, self.boardVC.boardWidth, self.boardVC.boardWidth);
    [self.view addSubview:self.boardVC.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)toggleRun:(id)sender
{
    if (self.gameIsRunning) {
        [self stopGame];
    } else {
        [self startGame];
    }
}

- (void)startGame
{
    self.gameIsRunning = TRUE;
    [self.runButton setTitle:@"STOP" forState:UIControlStateNormal];
    self.clearButton.enabled = FALSE;
    self.gameTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerDidFire:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.gameTimer forMode:NSDefaultRunLoopMode];
}

- (void)stopGame
{
    self.gameIsRunning = FALSE;
    [self.runButton setTitle:@"START" forState:UIControlStateNormal];
    self.clearButton.enabled = TRUE;
    [self.gameTimer invalidate];
}

- (IBAction)clear:(id)sender
{
    [self.boardVC resetCells];
}

- (void)timerDidFire:(NSTimer *)timer
{
    [self.boardVC update];
}

@end
