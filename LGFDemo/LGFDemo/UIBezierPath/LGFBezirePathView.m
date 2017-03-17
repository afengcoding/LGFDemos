//
//  LGFBezirePathView.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/23.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFBezirePathView.h"

@implementation LGFBezirePathView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //根据一个rect画一个矩形
    CGRect temp = CGRectMake(5, 5, 30, 30);
    UIBezierPath *rectangular = [UIBezierPath bezierPathWithRect:temp];
    [[UIColor redColor] set];
    [rectangular fill];
    [[UIColor blueColor] set];
    [rectangular stroke];
    
    //根据一个rectangle 画一个椭圆曲线 rect 为正方形时 画的是一个圆
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(40, 5, 50, 30)];
    [[UIColor lightGrayColor] set];
    [oval fill];
    [[UIColor yellowColor] set];
    [oval stroke];
    //根据一个rect画一个圆角矩形曲线 当rect为正方形时且radius等于边长一半时 画的是圆
    UIBezierPath *roundRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(95, 400, 40, 30) cornerRadius:5];
    [[UIColor yellowColor] set];
    [roundRect fill];
    [[UIColor redColor] set];
    [roundRect stroke];
    
    //根据一个rect针对四角中某个或多个角设置圆角
    UIBezierPath *roundRect2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(140, 5, 40, 30) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 50)];
    [[UIColor blueColor] set];
    [roundRect2 fill];
    [[UIColor blackColor] set];
    [roundRect2 stroke];
    
    //以某个中心点画弧线
    
    UIBezierPath *arcpath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(210, 20) radius:20 startAngle:-M_PI endAngle:M_2_PI clockwise:YES];
    [[UIColor redColor] set];
    [arcpath stroke];
}

@end
