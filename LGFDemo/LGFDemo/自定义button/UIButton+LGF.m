//
//  UIButton+LGF.m
//  LGFDemo
//
//  Created by qddios2 on 16/6/17.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "UIButton+LGF.h"

@implementation UIButton (LGF)
- (void)cnn_setLeftTitle:(NSString *)title forState:(UIControlState)state
{
    [self setTitle:title forState:UIControlStateNormal];
    [self sizeToFit];
    if (self.imageView.image) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.frame.size.width, 0, self.imageView.frame.size.width)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.frame.size.width, 0, -self.titleLabel.frame.size.width)];
    }
}

- (void)cnn_setTopTitle:(NSString *)title forState:(UIControlState)state
{
    [self setTitle:title forState:UIControlStateNormal];
    [self sizeToFit];
    if (self.imageView.image) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(-self.titleLabel.frame.size.height , 0, self.titleLabel.frame.size.height, -self.titleLabel.frame.size.width)];
    }
}

- (void)cnn_setBottomTitle:(NSString *)title forState:(UIControlState)state
{
    [self setTitle:title forState:UIControlStateNormal];
    [self sizeToFit];
    if (self.imageView.image) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.frame.size.width, 0, self.imageView.frame.size.width)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.frame.size.width, 0, -self.titleLabel.frame.size.width)];
    }
}
@end
