//
//  TimerView.m
//  ShapeGame
//
//  Created by Jakub Vodak on 4/26/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import "TimerView.h"

@interface TimerView()

@property (nonatomic, retain) UILabel *timeLabel;

@property (nonatomic, retain) UILabel *scoreLabel;

@end

@implementation TimerView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
    
        [self applyAppearance];
    }
    
    return self;
}


- (void)dealloc
{
    [super dealloc];
}


- (void)applyAppearance
{
    self.backgroundColor = [UIColor customBrown];
    
    
    /* Time Label */
    
    _timeLabel = [[[UILabel alloc] init] autorelease];
    
    _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _timeLabel.textColor = [UIColor whiteColor];
    
    _timeLabel.font = [UIFont customFontWithSize:28];
    
    [self addSubview:_timeLabel];
    
    
    /* Score Label */
    
    _scoreLabel = [[[UILabel alloc] init] autorelease];
    
    _scoreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _scoreLabel.textColor = [UIColor whiteColor];
    
    _scoreLabel.font = [UIFont customFontWithSize:14];
    
    [self addSubview:_scoreLabel];
    
    
    /* Surrender button */
    
    _surrenderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _surrenderButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_surrenderButton setTitle:@"Surrender" forState:UIControlStateNormal];
    
    [_surrenderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [_surrenderButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    [_surrenderButton.titleLabel setFont:[UIFont customFontWithSize:14]];
    
    [self addSubview:_surrenderButton];
    
    
    /* Constraints */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_timeLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_timeLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_scoreLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_scoreLabel]" options:0 metrics:Nil views:NSDictionaryOfVariableBindings(_scoreLabel)]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_surrenderButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_surrenderButton]-|" options:0 metrics:Nil views:NSDictionaryOfVariableBindings(_surrenderButton)]];
}


- (void)setScore:(NSInteger)score
{
    _scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)score];
}


- (void)setRemainingTime: (NSInteger)seconds
{
    _timeLabel.text = [NSString stringWithFormat:@"%ld", (long)seconds];
}

@end
