//
//  ShapeView.h
//  ShapeGame
//
//  Created by Jakub Vodak on 4/25/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShapeEntity.h"

@interface ShapeView : UIView

@property (nonatomic, assign) ShapeEntity *shapeDescription;

- (void)setRandomRectForView:(UIView *)view;

@end
