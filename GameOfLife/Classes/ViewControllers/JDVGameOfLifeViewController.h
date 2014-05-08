//
//  JDVGameOfLifeViewController.h
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import "JDVBoardViewController.h"

extern NSTimeInterval const JDVGameOfLifeTimerInterval;

@interface JDVGameOfLifeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *runButton;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@property (strong, nonatomic) JDVBoardViewController *boardVC;
@property (strong, nonatomic) NSTimer *gameTimer;
@property (assign, nonatomic) BOOL gameIsRunning;

- (IBAction)toggleRun:(id)sender;
- (IBAction)clear:(id)sender;
- (void)startGame;
- (void)stopGame;

@end
