//
//  UIView+Addition.m
//  spaceCloud-plugin
//
//  Created by mophie on 12/30/14.
//  Copyright (c) 2014 Harry. All rights reserved.
//

#import "SCUIView+Addition.h"

@implementation UIView (UIViewAddition)

-(void)showDotBound
{
    BOOL hasDotBound = false;
    NSArray * subviews = self.subviews;
    for (int i = 0; i<subviews.count; i++) {
        UIView * obj = [subviews objectAtIndex:i];
        if ([obj isKindOfClass:[SCDotBoundView class]]) {
            hasDotBound  =YES;
            obj.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            [obj setNeedsDisplay];
            break;
        }
    }
    
    if (!hasDotBound)
    {
        SCDotBoundView *dotView = [[SCDotBoundView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        dotView.backgroundColor = [UIColor clearColor];
        [self addSubview:dotView];
    }
    
}


-(void)showDotBoundWithColor:(UIColor *)color offset:(float)_offset
{
    BOOL hasDotBound = false;
    NSArray * subviews = self.subviews;
    for (int i = 0; i<subviews.count; i++) {
        UIView * obj = [subviews objectAtIndex:i];
        if ([obj isKindOfClass:[SCDotBoundView class]]) {
            hasDotBound  =YES;
            obj.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            ((SCDotBoundView*)obj).offset = _offset;
            ((SCDotBoundView*)obj).color = color;
            [obj setNeedsDisplay];
            break;
        }
    }
    
    if (!hasDotBound)
    {
        SCDotBoundView *dotView = [[SCDotBoundView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        dotView.userInteractionEnabled = NO;
        dotView.offset = _offset;
        dotView.color = color;
        dotView.backgroundColor = [UIColor clearColor];
        [self addSubview:dotView];
    }
    
}


-(void)hiddenDotBound
{
    NSArray * subviews = self.subviews;
    for (int i = 0; i<subviews.count; i++) {
        UIView * obj = [subviews objectAtIndex:i];
        if ([obj isKindOfClass:[SCDotBoundView class]]) {
            [obj removeFromSuperview];
            obj = nil;
        }
    }
}


@end


@implementation SCDotBoundView
static CGFloat dashPattern[2] = {3.0f,3.0f};

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.offset = 10;
        self.color = [UIColor colorWithRed:53.f/255.f green:152.f/255.f blue:255.f/255.f alpha:1];
    }
    
    return self;
}



 - (void)drawRect:(CGRect)rect {
     
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGFloat r, g, b, a;
     [self.color getRed:&r green:&g blue:&b alpha:&a];
     
     CGContextSetRGBStrokeColor(context, r, g, b, a);
     CGContextSetLineWidth(context, 0.5);
     CGContextSetLineDash(context, 10, dashPattern, 2);
     
     CGContextMoveToPoint(context, self.offset,2);
     CGContextAddLineToPoint(context, self.frame.size.width-self.offset,2);
     CGContextAddLineToPoint(context, self.frame.size.width-self.offset,self.frame.size.height-2);
     CGContextAddLineToPoint(context, self.offset,self.frame.size.height-2);
     CGContextAddLineToPoint(context, self.offset,2);
     CGContextStrokePath(context);
 }

@end
