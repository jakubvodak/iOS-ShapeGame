//
//  ShapeView.m
//  ShapeGame
//
//  Created by Jakub Vodak on 4/25/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView

- (instancetype)initWithFrame:(CGRect)frame {
   
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _shapeDescription = [ShapeEntity new];
        
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
    self.backgroundColor = [UIColor clearColor];
}


- (void)drawRect:(CGRect)rect
{
    /* Draw a circle */
    // Get the contextRef
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // Set the circle fill color to GREEN
    CGContextSetRGBFillColor(contextRef, 0.0, 255.0, 0.0, 1.0);
    
    // Fill the circle with the fill color
    CGContextFillEllipseInRect(contextRef, rect);
}


+ (CGRect)randomRectForView:(UIView *)view
{
    CGFloat width = fmodf(rand(), 30) + 30;
    
    CGFloat height = fmodf(rand(), 30) + 30;
    
    CGFloat x = fmod(rand(), view.frame.size.width - width);
    
    CGFloat y = fmod(rand(), view.frame.size.height - height);
    
    return CGRectMake(x, y, width, height);
}


@end
