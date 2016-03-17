//
//  SCVideoUnity.m
//  spaceCloud-plugin
//
//  Created by mophie on 1/15/15.
//  Copyright (c) 2015 Harry. All rights reserved.
//

#import "SCVideoUnity.h"
#import <AVFoundation/AVFoundation.h>
#import "SCUIImage+Addition.h"

@implementation SCVideoUnity
+ (UIImage  *)createThumbImage:(NSURL *)path
{
    AVURLAsset *asset2 = [AVURLAsset assetWithURL:path];
    CMTime duration = asset2.duration;
    float time = CMTimeGetSeconds(duration);
    
    CMTime startTime =  CMTimeMake(time/3, 1);
    CMTime endTime =  CMTimeMake(time/3, 1);
    
    AVAssetImageGenerator *assetImage = [[AVAssetImageGenerator alloc] initWithAsset:asset2];
    assetImage.apertureMode = AVAssetImageGeneratorApertureModeProductionAperture;
    CGImageRef imageRef = [assetImage copyCGImageAtTime:startTime actualTime:&endTime error:nil];
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:1.8 orientation:UIImageOrientationUp];
    return image;
}


+ (UIImage*)thumbnailOfImage:(UIImage*)image
{
    UIImage *img = nil;
    CGSize itemSize = CGSizeMake(340, 340);
    
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [image drawInRect:imageRect];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}


+(UIImage *)addBackgroundToImage:(UIImage *)image
{
    if (!image)
        return nil;
    
    CGImageRef imageRef = [image CGImage];
    UIImage *thumb = nil;
    
    float _width = 340;
    float _height = 340;
    UIColor *color = [UIColor colorWithRed:222.f/255.f green:229.f/255.f blue:229.f/255.f alpha:1];
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                _width,
                                                _height,
                                                CGImageGetBitsPerComponent(imageRef),
                                                CGImageGetBitsPerPixel(imageRef)*_width,
                                                CGColorSpaceCreateDeviceRGB(),
                                                kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big
                                                );
    
    CGContextDrawImage( bitmap, CGRectMake(0, 0, _width, _height), imageRef );
    CGContextDrawImage( bitmap, CGRectMake(0, 0, _width, _height), [[UIImage imageNamed:@"GOVieoPrePlayBg.png"] imageWithTintColor:color].CGImage);
    
    CGImageRef ref = CGBitmapContextCreateImage( bitmap );
    thumb = [UIImage imageWithCGImage:ref];
    
    CGContextRelease( bitmap );
    CGImageRelease( ref );
    return thumb;
}



@end
