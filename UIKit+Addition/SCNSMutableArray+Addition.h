//
//  SCNSMutableArray+Addition.h
//  spaceCloud-plugin
//
//  Created by mophie on 12/31/14.
//  Copyright (c) 2014 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray(SCNSMutableArray_Addition)
- (void) moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex withBlock:(void (^)(id, NSUInteger))block;
@end
