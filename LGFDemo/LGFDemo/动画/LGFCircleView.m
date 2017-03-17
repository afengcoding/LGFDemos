//
//  LGFCircleView.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/28.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFCircleView.h"

@interface LGFCircleView ()

@property (nonatomic, strong) CAShapeLayer *outCircleLayer;

@end

@implementation LGFCircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
   self.outCircleLayer = [CAShapeLayer layer];
    CGRect rectt = CGRectMake(2, 2,self.frame.size.width - 4, self.frame.size.width - 4);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rectt];
    self.outCircleLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.outCircleLayer.borderWidth = 3;
    self.outCircleLayer.fillColor = [UIColor clearColor].CGColor;
    self.outCircleLayer.lineCap  =kCALineCapRound;
    self.outCircleLayer.path = path.CGPath;
    [self.layer addSublayer:self.outCircleLayer];
    
}

@end
