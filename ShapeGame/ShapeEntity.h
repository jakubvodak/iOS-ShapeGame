//
//  ShapeEntity.h
//  ShapeGame
//
//  Created by Jakub Vodak on 4/25/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    shapeTypeSquare,
    shapeTypeCircle,
    shapeTypeTriangel
} shapeType;

@interface ShapeEntity : NSObject

@property (nonatomic, assign) shapeType type;

@end
