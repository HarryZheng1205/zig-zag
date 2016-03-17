//
//  SCUIImage+Addition.h
//  spaceCloud-plugin
//
//  Created by mophie on 12/29/14.
//  Copyright (c) 2014 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SCUIImageAddition)
-(UIImage *)rotateImage;
-(UIImage *)scaleImageWidth:(int)toWidth toHeight:(int)toHeight;
-(UIImage *) imageWithTintColor:(UIColor *)tintColor;
-(UIImage *)rotateImageWithOrientation:(UIImageOrientation)_orient;
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
-(UIImage *)collectionCover;
@end
