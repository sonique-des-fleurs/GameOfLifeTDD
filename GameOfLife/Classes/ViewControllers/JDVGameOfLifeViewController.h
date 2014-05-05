//
//  JDVGameOfLifeViewController.h
//  GameOfLife
//
//  Created by sonique on 5/4/14.
//  Copyright (c) 2014 JDV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDVGameOfLifeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;

- (IBAction)toggleRun:(id)sender;
- (IBAction)clear:(id)sender;

@end
