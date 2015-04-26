//
//  InfoView.m
//  ShapeGame
//
//  Created by Jakub Vodak on 4/26/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import "InfoView.h"

@implementation InfoView

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
    self.backgroundColor = [UIColor customPurple];
}

@end
