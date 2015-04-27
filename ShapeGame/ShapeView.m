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
        
        _shapeDescription.type = fmodf(rand(), 3);
        
        [self applyAppearance];
    }
    
    return self;
}


- (void)dealloc
{
    [_shapeDescription release];
    
    [super dealloc];
}


- (void)applyAppearance
{
    self.backgroundColor = [UIColor clearColor];
}


- (void)drawRect:(CGRect)rect
{
    if (_shapeDescription.type == shapeTypeCircle) {
        
        /* Draw a circle */
        
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        
        CGContextSetRGBFillColor(contextRef, 189/255, 117.0/255, 118.0/255, 1.0);
        
        CGContextFillEllipseInRect(contextRef, rect);
    }
    else if (_shapeDescription.type == shapeTypeSquare) {
        
        /* Draw a square */
        
        CGContextRef contextRef = UIGraphicsGetCurrentContext();
        
        CGContextSetRGBFillColor(contextRef, 242.0/255, 129.0/255, 121.0/255, 1.0);
        
        CGContextFillRect(contextRef, rect);
    }
    else if (_shapeDescription.type == shapeTypeTriangel) {
        
        /* Draw a triangel */
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        CGContextBeginPath(ctx);
       
        CGContextMoveToPoint   (ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));  // top left
        
        CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMidY(rect));  // mid right
        
        CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));  // bottom left
        
        CGContextClosePath(ctx);
        
        CGContextSetRGBFillColor(ctx, 125.0/255, 96.0/255, 114.0/255, 1);
        
        CGContextFillPath(ctx);
    }
}


- (void)setRandomRectForView:(UIView *)view
{
    CGFloat width = fmodf(rand(), 30) + 30;

    CGFloat height;
    
    if (_shapeDescription.type == shapeTypeCircle || _shapeDescription.type == shapeTypeSquare) {
        
        height = width;
    }
    else {
        
        height = fmodf(rand(), 30) + 30;
    }
    
    CGFloat x = fmod(rand(), view.frame.size.width - width);
    
    CGFloat y = fmod(rand(), view.frame.size.height - height);
    
    self.frame = CGRectMake(x, y, width, height);
}


@end
