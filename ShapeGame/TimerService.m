//
//  TimerService.m
//  ShapeGame
//
//  Created by Jakub Vodak on 4/26/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import "TimerService.h"

@interface TimerService()

@property (nonatomic, retain) NSTimer *timer;

@end

@implementation TimerService

+ (TimerService *)sharedInstance {
    
    static TimerService* sharedInstance;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [TimerService new];
    });
    
    return sharedInstance;
}


- (void)startNewTimer
{
    _remainingSecondsCount = 60;
    
    _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerInterval:) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}


- (void)stopTimer
{
    [_timer invalidate];
    
    _timer = nil;
}


- (IBAction)timerInterval:(id)sender
{
    _remainingSecondsCount--;
    
    if (_remainingSecondsCount == 0) {
        
        [self stopTimer];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationTimerDidEnd object:nil userInfo: nil];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationTimerDidChange object:nil userInfo: nil];
}


@end
