//
//  IntroViewController.m
//  ShapeGame
//
//  Created by Jakub Vodak on 4/25/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import "IntroViewController.h"
#import "GameViewController.h"

@implementation IntroViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self applyAppearance];
}


#pragma mark - View Setup

- (void)applyAppearance
{
    self.view.backgroundColor = [UIColor customBrown];
    
    
    /* New Game Button */
    
    UIButton *newGameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    newGameButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [newGameButton setTitle:@"New Game" forState:UIControlStateNormal];
    
    [newGameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [newGameButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    [newGameButton addTarget:self action:@selector(startNewGame) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:newGameButton];
    
    
    /* Constraints */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newGameButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:newGameButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}


#pragma mark - User Action

- (void)startNewGame
{
    GameViewController *viewController = [[[GameViewController alloc] init] autorelease];
    
    viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:viewController animated:YES completion:nil];
}

@end
