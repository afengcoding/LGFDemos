//
//  LGFBasicAnimationViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/28.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFBasicAnimationViewController.h"
@interface LGFBasicAnimationViewController ()

@end

@implementation LGFBasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self baseTranslationAnimation];
    [self baseRotationAnimation];
    [self baseScaleAnimation];
    [self baseSpringAnimation];
    [self basePathAnimation];
}

#pragma mark - 平移动画
- (void)baseTranslationAnimation
{
    UIView *springView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 50, 50)];
    [self.view addSubview:springView];
    
    springView.layer.borderColor = [UIColor greenColor].CGColor;
    springView.layer.borderWidth = 2;
    springView.backgroundColor = [UIColor redColor];
    CABasicAnimation    *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    animation.duration = 2;
    CGFloat width = self.view.frame.size.width;
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(width - 50, 0)];
    animation.cumulative = YES;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses   = YES;
    animation.fillMode = kCAFillModeForwards;
    [springView.layer addAnimation:animation forKey:@"transform.translation"];
}

//旋转动画
- (void)baseRotationAnimation
{
    UIView *animationView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
    [self.view addSubview:animationView];
    animationView.layer.borderWidth = 2;
    animationView.layer.borderColor = [UIColor redColor].CGColor;
    animationView.backgroundColor = [UIColor lightGrayColor];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration = 2;
    CATransform3D tranform3D = CATransform3DMakeRotation(M_PI, 180, 180, 180);
    animation.toValue = [NSValue valueWithCATransform3D:tranform3D];
    animation.cumulative     = YES;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses  = YES;
    animation.fillMode = kCAFillModeForwards;
    [animationView.layer addAnimation:animation forKey:@"transform"];
}

//缩放动画
- (void)baseScaleAnimation
{
    UIView *animationView = [[UIView alloc] initWithFrame:CGRectMake(100, 260, 50, 50)];
    [self.view addSubview:animationView];
    animationView.layer.borderColor = [UIColor yellowColor].CGColor;
    animationView.layer.borderWidth = 2;
    animationView.backgroundColor = [UIColor blackColor];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 2;
    animation.fromValue = @1;
    animation.toValue = @0;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeRemoved;
    [animationView.layer addAnimation:animation forKey:@"transform.scale"];
}


//闪烁动画
- (void)baseSpringAnimation
{
    UIView *animationView = [[UIView alloc] initWithFrame:CGRectMake(60, 310, 50, 50)];
    [self.view addSubview:animationView];
    [self.view addSubview:animationView];
    animationView.layer.borderColor = [UIColor yellowColor].CGColor;
    animationView.layer.borderWidth = 2;
    animationView.backgroundColor = [UIColor blackColor];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 2;
    animation.fromValue = @1;
    animation.toValue = @0;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeRemoved;
    [animationView.layer addAnimation:animation forKey:@"opacity"];
}

//路径动画
- (void)basePathAnimation
{
    UIView *animationView = [[UIView alloc] initWithFrame:CGRectMake(60, 310, 50, 50)];
    [self.view addSubview:animationView];
    [self.view addSubview:animationView];
    animationView.layer.borderColor = [UIColor yellowColor].CGColor;
    animationView.layer.borderWidth = 2;
    animationView.backgroundColor = [UIColor blackColor];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width - 50, self.view.bounds.size.height - 50)];
    animation.speed = 0.1;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeRemoved;
    [animationView.layer addAnimation:animation forKey:@"position"];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
