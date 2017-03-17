//
//  LGFCreateBarcodeManager.m
//  LGFDemo
//
//  Created by qddios2 on 16/6/1.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFCreateBarcodeManager.h"
#import <CoreImage/CoreImage.h>

@interface LGFCreateBarcodeManager ()

@end
@implementation LGFCreateBarcodeManager


- (UIImage *)createBarcodeImageWithData:(NSString *)data
{
    //实例化二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setDefaults];
    
    NSData *encodeData = [data dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:encodeData forKey:@"inputMessage"];
    CIImage *outImage = [filter outputImage];
    return [self createUIImageFromCIIImage:outImage size:240];
    
}


- (UIImage *)createUIImageFromCIIImage:(CIImage *)image size:(CGFloat)size
{
    CGRect extent  = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    size_t width = CGRectGetWidth(extent) *scale;
    size_t height = CGRectGetHeight(extent) *scale;
    CGColorSpaceRef cs  = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    CGImageRef scaleImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRetain(bitmapImage);
    return [UIImage imageWithCGImage:scaleImage];
}



@end
