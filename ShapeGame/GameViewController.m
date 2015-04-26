//
//  GameViewController.m
//  ShapeGame
//
//  Created by Jakub Vodak on 4/25/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import "GameViewController.h"
#import "ShapeView.h"
#import "TimerView.h"
#import "FieldView.h"
#import "InfoView.h"
#import "TimerService.h"

@interface GameViewController() <UIAlertViewDelegate>

@property (nonatomic, retain) TimerView *topView;

@property (nonatomic, retain) FieldView *middleView;

@property (nonatomic, retain) InfoView *bottomView;

@property (nonatomic, retain) NSMutableArray *shapesArray;


@property (nonatomic) NSInteger shapeIndex;

@property (nonatomic) NSInteger score;

@end

@implementation GameViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self applyAppearance];
    
    
    _score = 0;
    
    _shapeIndex = 0;
    
    [self addShapes:10];
    
    
    /* Register for notifications */
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(timerUpdate)
                                                 name: notificationTimerDidChange
                                               object: nil];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(gameEnded)
                                                 name: notificationTimerDidEnd
                                               object: nil];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[TimerService sharedInstance] startNewTimer];
}


- (void)dealloc
{
    [super dealloc];
    
}


#pragma mark - View Setup

- (void)applyAppearance
{
    
    /* Timer View */
    
    _topView = [[[TimerView alloc] init] autorelease];
    
    _topView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_topView.surrenderButton addTarget:self action:@selector(gameEnded) forControlEvents:UIControlEventTouchUpInside];
    
    [_topView setScore:_score];
    
    [_topView setRemainingTime:60];
    
    [self.view addSubview:_topView];
    
    
    /* Game Play View */
    
    _middleView = [[[FieldView alloc] init] autorelease];
    
    _middleView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:_middleView];
    
    
    /* Info View */
    
    _bottomView = [[[InfoView alloc] init] autorelease];
    
    _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:_bottomView];
    
     
    /* Constraints */
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_topView]|" options:0 metrics:Nil views:NSDictionaryOfVariableBindings(_topView)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_middleView]|" options:0 metrics:Nil views:NSDictionaryOfVariableBindings(_middleView)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_bottomView]|" options:0 metrics:Nil views:NSDictionaryOfVariableBindings(_bottomView)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_topView(80)][_middleView][_bottomView(_topView)]|" options:0 metrics:Nil views:NSDictionaryOfVariableBindings(_topView, _middleView, _bottomView)]];
    
}


#pragma mark - User Action

- (IBAction)shapeTouched:(id)sender
{
    UITapGestureRecognizer *tapRecognizer = (UITapGestureRecognizer *)sender;
    
    [tapRecognizer.view removeFromSuperview];
    
    _score++;
    
    [_topView setScore:_score];
}


- (void)closeGameView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Game prograss

- (void)timerUpdate
{
    [_topView setRemainingTime:[[TimerService sharedInstance] remainingSecondsCount]];
    
    [self addShapes:2];
}


- (void)gameEnded
{
    [[TimerService sharedInstance] stopTimer];
    
    
    NSString *message = [NSString stringWithFormat:@"Score: %ld", (long)_score];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    
    alert.tag = 1;
    
    [alert show];
}


- (void)addShapes: (NSInteger)shapeCount
{
    [_middleView layoutIfNeeded];
    
    for (NSInteger i = _shapeIndex; i < (_shapeIndex + shapeCount); i++) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shapeTouched:)];
        
        ShapeView *shape1 = [[[ShapeView alloc] initWithFrame:[ShapeView randomRectForView:_middleView]] autorelease];
        
        [shape1 addGestureRecognizer:tap];
        
        shape1.tag = i;
        
        [_middleView addSubview:shape1];
    }
    
    _shapeIndex += shapeCount;
}


#pragma mark - Alert View

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self closeGameView];
}

@end
