//
//  LGFRecordingCircleView.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/29.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFRecordingCircleView.h"

@interface LGFRecordingCircleView ()
@property (nonatomic, strong) UIBezierPath *path;
@end

@implementation LGFRecordingCircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CAShapeLayer *backgroudLayer = [CAShapeLayer layer];
        backgroudLayer.path = self.path.CGPath;
        backgroudLayer.strokeColor = [UIColor blueColor].CGColor;
        backgroudLayer.fillColor = [UIColor clearColor].CGColor;
        backgroudLayer.lineWidth = 2;
//        [self.layer addSublayer:backgroudLayer];
        
//        CAShapeLayer *progressLayer = [CAShapeLayer layer];
//        progressLayer.path = self.path.CGPath;
//        progressLayer.strokeColor = [self randomColor].CGColor;
//        progressLayer.fillColor = [UIColor clearColor].CGColor;
//        progressLayer.lineWidth = 2;
//        progressLayer.strokeEnd = 0.f;
//        [self.layer addSublayer:progressLayer];
//
        CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
        gradientLayer1.frame = CGRectMake(0, 0, self.bounds.size.width , self.bounds.size.height);
        CGColorRef red = [UIColor redColor].CGColor;
        CGColorRef purple = [UIColor purpleColor].CGColor;
        CGColorRef yellow = [UIColor yellowColor].CGColor;
        CGColorRef orange = [UIColor orangeColor].CGColor;
        [gradientLayer1 setColors:@[(__bridge id)red, (__bridge id)purple, (__bridge id)yellow, (__bridge id)orange]];
        [gradientLayer1 setLocations:@[@0.3, @0.6, @0.8, @1.0]];
        [gradientLayer1 setStartPoint:CGPointMake(0, 0.5)];
        [gradientLayer1 setEndPoint:CGPointMake(1, 0.5)];
        
//        CAGradientLayer *gradientLayer2 =  [CAGradientLayer layer];
//        gradientLayer2.frame = self.bounds;
//        CGColorRef blue = [UIColor brownColor].CGColor;
//        CGColorRef purple1 = [UIColor purpleColor].CGColor;
//        CGColorRef r1 = [UIColor yellowColor].CGColor;
//        CGColorRef o1 = [UIColor orangeColor].CGColor;
//        [gradientLayer2 setColors:@[(__bridge id)blue, (__bridge id)purple1, (__bridge id)r1, (__bridge id)o1]];
//        [gradientLayer2 setLocations:@[@0.3, @0.6, @0.8, @1.0]];
//        [gradientLayer2 setStartPoint:CGPointMake(0.5, 0)];
//        [gradientLayer2 setEndPoint:CGPointMake(0.5, 1)];
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
        [gradientLayer addSublayer:gradientLayer1];
//        [gradientLayer1 addSublayer:gradientLayer2];
        gradientLayer.mask = backgroudLayer;
        [self.layer addSublayer:gradientLayer];
        
    }
    return self;
}






#pragma mark - getter
- (UIBezierPath *)path
{
    if (_path == nil) {
        CGPoint arcPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        CGFloat radius = 50;
        _path = [UIBezierPath bezierPathWithArcCenter:arcPoint radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:NO];
    }
    return _path;
}

- (UIColor *)randomColor
{
    CGFloat red = arc4random() % 256 / 255.0;
    CGFloat green = arc4random() % 256 / 255.0;
    CGFloat blue = arc4random() % 256 / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}


@end
