//
//  NSArray+Helper.m
//  iOSHelper
//
//  Created by pljhonglu on 14-7-28.
//  Copyright (c) 2014年 pljhonglu. All rights reserved.
//

#import "NSArray+Helper.h"

@implementation NSArray (Helper)
- (id)firstObject {
    if (self.count)
        return self[0];
    return nil;
}

- (id)randomObject {
	if (self.count) {
	    return self[arc4random_uniform(self.count)];
	}
    return nil;
}

- (id)objectOrNilAtIndex:(NSUInteger)index {
    return index < self.count ? self[index] : nil;
}

@end


@implementation NSMutableArray (Helper)

- (void)addObjectOrNil:(id)anObject{
    if (anObject) {
        [self addObject:anObject];
    }
}


- (void)removeFirstObject {
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

- (void)reverse {
    int count = self.count;
    int mid = floor(count / 2.0);
    for (int i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

- (void)shuffle {
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1)
                  withObjectAtIndex:arc4random_uniform(i)];
    }
}

@end
