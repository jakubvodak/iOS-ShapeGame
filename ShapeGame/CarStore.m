//
//  CarStore.m
//  ShapeGame
//
//  Created by Jakub Vodak on 4/25/15.
//  Copyright (c) 2015 h2ocompany. All rights reserved.
//

#import "CarStore.h"

@implementation CarStore {
    NSMutableArray *_inventory;
}

- (NSMutableArray *)inventory {
    return _inventory;
}

- (void)setInventory:(NSMutableArray *)newInventory {
    
    if (_inventory == newInventory) {
        
        return;
    }
    
    NSMutableArray *oldValue = _inventory;
    _inventory = [newInventory copy];
    [oldValue release];
}

@end
