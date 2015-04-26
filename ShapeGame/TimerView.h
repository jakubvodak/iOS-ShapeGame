//
//  TimerView.h
//  ShapeGame
//
//  Created by Jakub Vodak on 4/26/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerView : UIView

@property (nonatomic, retain) UIButton *surrenderButton;

- (void)setScore: (NSInteger)score;

- (void)setRemainingTime: (NSInteger)seconds;

@end
