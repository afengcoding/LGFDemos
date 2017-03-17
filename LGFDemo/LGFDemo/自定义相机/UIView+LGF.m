//
//  UIView+LGF.m
//  LGFDemo
//
//  Created by qddios2 on 16/7/29.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "UIView+LGF.h"

@implementation UIView (LGF)
- (void)getGradientBackgroundColorWithColor:(UIColor *)gradientColor isUpToDownChange:(BOOL)upToDownChange
{
    
    CAGradientLayer *gradientLayer;
    gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = self.bounds;
    gradientLayer.borderWidth = 0;
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[[UIColor clearColor] CGColor],
                            (id)[gradientColor CGColor], nil];
    if (!upToDownChange) {
        gradientLayer.startPoint = CGPointMake(0.5, 0.5);
        gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    }else{
        gradientLayer.startPoint = CGPointMake(0.5, 1.0);
        gradientLayer.endPoint = CGPointMake(0.5, 0.0);
    }
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
}
@end
