//
//  UIView+Addition.h
//  spaceCloud-plugin
//
//  Created by mophie on 12/30/14.
//  Copyright (c) 2014 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCDotBoundView : UIView
@property(nonatomic,strong) UIColor * color;
@property(nonatomic,assign)float offset;
@end

@interface UIView (UIViewAddition)
-(void)showDotBound;
-(void)hiddenDotBound;
-(void)showDotBoundWithColor:(UIColor *)color offset:(float)_offset;
@end
