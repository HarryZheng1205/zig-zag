//
//  STCircleLayer.m
//  Scooter
//
//  Created by mophie on 11/10/15.
//  Copyright © 2015 mophie. All rights reserved.
//

#import "STCircleLayer.h"

@implementation STCircleLayer
@synthesize shapeLayer;
-(id)init
{
    self = [super init];
    if (self) {
        
        shapeLayer = [CAShapeLayer layer];
        shapeLayer.fillColor   = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
        shapeLayer.strokeStart   = 0.0f;
        shapeLayer.strokeEnd     = 0.1f;
        shapeLayer.lineWidth     = 5.f;
        shapeLayer.lineCap       = kCALineCapButt;
        
        [self.layer addSublayer:shapeLayer];
    }
    
    return self;
}


- (void)setRadius:(CGFloat)radius
{
    [self setRadius:radius clockWise:YES];
}


- (void)setRadius:(CGFloat)radius clockWise:(BOOL)isClockWise
{
    _radius = radius;
    CGPoint tempPos = self.center;
    CGFloat diameter = self.radius * 2;
    self.bounds = CGRectMake(0, 0, diameter, diameter);
    shapeLayer.cornerRadius = self.radius;
    self.center = tempPos;
    
    shapeLayer.bounds = self.bounds;
    shapeLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                        radius:radius
                                                    startAngle:0
                                                      endAngle:M_PI * 2
                                                     clockwise:isClockWise];

    
    shapeLayer.path  = path.CGPath;
    shapeLayer.strokeStart   = 0.f;
    shapeLayer.strokeEnd     = 1.0f;
    [shapeLayer needsDisplay];
}


-(void)setColor:(UIColor *)color
{
    shapeLayer.strokeColor = color.CGColor;
}

-(void)setProgress:(float)progress
{
    _progress = progress;
    shapeLayer.strokeStart   = 0.f;
    shapeLayer.strokeEnd     = progress;
}
@end
