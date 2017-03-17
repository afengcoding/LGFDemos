
//
//  LGFCircleLoaderView.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/30.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFCircleLoaderView.h"

@interface LGFCircleLoaderView ()
@property (nonatomic, strong) CAShapeLayer *circlePathShaper;
@property (nonatomic, strong) UIBezierPath *path;
@end

static CGFloat const circleRadius = 20.0;
@implementation LGFCircleLoaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self confingure];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)confingure
{
    self.backgroundColor = [UIColor whiteColor];
    [self.layer addSublayer:self.circlePathShaper];
    
}

- (void)confingureProgress:(CGFloat)progress
{
    self.circlePathShaper.strokeEnd = progress;
}

- (void)reveal
{
    self.backgroundColor = [UIColor clearColor];
    [self.circlePathShaper removeAnimationForKey:@"strokeEnd"];
    [self.circlePathShaper removeFromSuperlayer];
    self.superview.layer.mask = self.circlePathShaper;
}

- (CAShapeLayer *)circlePathShaper
{
    if (_circlePathShaper == nil) {
        _circlePathShaper = [CAShapeLayer layer];
        _circlePathShaper.lineWidth = 2;
        _circlePathShaper.fillColor = [UIColor clearColor].CGColor;
        _circlePathShaper.strokeColor = [UIColor redColor].CGColor;
        _circlePathShaper.frame = self.bounds;
        _circlePathShaper.strokeEnd = 0;
        _circlePathShaper.path = self.path.CGPath;
    }
    return _circlePathShaper;
}

- (UIBezierPath *)path
{
    if (_path == nil) {
        CGPoint arcPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        _path = [UIBezierPath bezierPathWithArcCenter:arcPoint radius:circleRadius startAngle:0 endAngle:M_PI * 2 clockwise:NO];
    }
    return _path;
}


@end
