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
    
    
    /* Type Label */
    
    _typeLabel = [[[UILabel alloc] init] autorelease];
    
    _typeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _typeLabel.textColor = [UIColor whiteColor];
    
    _typeLabel.font = [UIFont customFontWithSize:28];
    
    [self addSubview:_typeLabel];
    
    
    /* Constraints */
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_typeLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_typeLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
}


- (void)setupShapeType:(shapeType)type
{
    switch (type) {
            
        case shapeTypeSquare:
            _typeLabel.text = @"Square";
            break;
            
        case shapeTypeCircle:
            _typeLabel.text = @"Circle";
            break;
            
        case shapeTypeTriangel:
            _typeLabel.text = @"Triangel";
            break;
            
        default:
            break;
    }
}

@end
