//
//  SCNSMutableArray+Addition.m
//  spaceCloud-plugin
//
//  Created by mophie on 12/31/14.
//  Copyright (c) 2014 Harry. All rights reserved.
//

#import "SCNSMutableArray+Addition.h"

@implementation NSMutableArray(SCNSMutableArray_Addition)

- (void) moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex withBlock:(void (^)(id, NSUInteger))block
{
    if (fromIndex == toIndex) return;
    if (fromIndex >= self.count) return;
    if (toIndex >= self.count) toIndex = self.count - 1;
    id movingObject = [self objectAtIndex:fromIndex];
    id replacementObject;
    
    if (fromIndex < toIndex){
        for (NSUInteger i = fromIndex; i <= toIndex; i++){
            replacementObject = (i == toIndex) ? movingObject : [self objectAtIndex:i + 1];
            [self replaceObjectAtIndex:i withObject:replacementObject];
            if (block) block(replacementObject, i);
        }
    } else {
        id cObject;
        id prevObject;
        for (NSUInteger i = toIndex; i <= fromIndex; i++){
            cObject = [self objectAtIndex:i];
            replacementObject = (i == toIndex) ? movingObject : prevObject;
            [self replaceObjectAtIndex:i withObject:replacementObject];
            prevObject = cObject;
            if (block) block(replacementObject, i);
        }
    }
}

@end
