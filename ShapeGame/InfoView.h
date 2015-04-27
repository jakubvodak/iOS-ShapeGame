//
//  InfoView.h
//  ShapeGame
//
//  Created by Jakub Vodak on 4/26/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShapeEntity.h"

@interface InfoView : UIView

@property (nonatomic, strong) UILabel *typeLabel;

- (void)setupShapeType: (shapeType)type;

@end
