//
//  STDotCircleLayer.m
//  Scooter
//
//  Created by mophie on 11/10/15.
//  Copyright © 2015 mophie. All rights reserved.
//

#import "STDotCircleLayer.h"

@implementation STDotCircleLayer
-(id)init
{
    self = [super init];
    if (self) {
         self.shapeLayer.lineDashPhase = 2;
         self.shapeLayer.lineDashPattern = [NSArray arrayWithObjects:@2,@8, nil];
    }
    
    return self;
}
@end
