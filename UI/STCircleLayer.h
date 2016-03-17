//
//  STCircleLayer.h
//  Scooter
//
//  Created by mophie on 11/10/15.
//  Copyright © 2015 mophie. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface STCircleLayer : UIView//CAShapeLayer
{
    CADisplayLink * displayLink;
    CGFloat tempScale;
    
}
@property(nonatomic,strong) UIColor * color;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, strong) CAShapeLayer * shapeLayer;
@property(assign,nonatomic) float progress;

- (void)setRadius:(CGFloat)radius clockWise:(BOOL)isClockWise;
@end
