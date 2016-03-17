//
//  SCVideoUnity.h
//  spaceCloud-plugin
//
//  Created by mophie on 1/15/15.
//  Copyright (c) 2015 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCVideoUnity : NSObject
+ (UIImage  *)createThumbImage:(NSURL *)path;
+ (UIImage*)thumbnailOfImage:(UIImage*)image;
+(UIImage *)addBackgroundToImage:(UIImage *)image;
@end
