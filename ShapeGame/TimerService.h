//
//  TimerService.h
//  ShapeGame
//
//  Created by Jakub Vodak on 4/26/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerService : NSObject

@property (nonatomic) NSInteger remainingSecondsCount;

+ (TimerService *)sharedInstance;

- (void)startNewTimer;

- (void)stopTimer;

@end
