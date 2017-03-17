//
//  LGFCAGradientLayerExample.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/29.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFCAGradientLayerExample.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "LGFCircleLoaderView.h"
@interface LGFCAGradientLayerExample ()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) UILabel *unlock;
@property (nonatomic, strong) UILabel *label;
@end

@implementation LGFCAGradientLayerExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor darkGrayColor];
    [self changeTextColor];
    [self sliderLock];
    [self imageLoadProgress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imageLoadProgress
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, 100, 100)];
    [self.view addSubview:imageView];
    NSString *url = @"http://www.raywenderlich.com/wp-content/uploads/2015/02/mac-glasses.jpeg";
    LGFCircleLoaderView *progressView = [[LGFCircleLoaderView alloc] initWithFrame:imageView.bounds];
    [imageView addSubview:progressView];
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil options:SDWebImageRefreshCached progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        [progressView confingureProgress:receivedSize*1.0 / expectedSize];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
    
}


- (void)changeColor
{
    self.gradientLayer.colors = @[(id)[self randomColor].CGColor, (id)[self randomColor].CGColor,(id)[self randomColor].CGColor,(id)[self randomColor].CGColor];
}
- (UIColor *)randomColor
{
    CGFloat red = arc4random() % 256 / 255.0;
    CGFloat green = arc4random() % 256 / 255.0;
    CGFloat blue = arc4random() % 256 / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

//渐变颜色文字
- (void)changeTextColor
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];

    gradientLayer.frame = CGRectMake(100, 100, 200, 60);
    gradientLayer.colors = @[(id)[self randomColor].CGColor,
                             (id)[self randomColor].CGColor,
                             (id)[self randomColor].CGColor,
                             (id)[self randomColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    gradientLayer.locations = @[@0.25,@0.5,@0.75];
    self.gradientLayer = gradientLayer;
//    
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 60)];
        label.text = @"这是一个美丽的故事,发生很久很久以前~";
    gradientLayer.mask  = label.layer;
    self.label = label;
        label.frame = gradientLayer.bounds;
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeColor)];
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}


// 滑动解锁
- (void)sliderLock
{
    // 渐变Layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.frame = CGRectMake(0, 200, self.view.frame.size.width, 64);
    gradientLayer.colors = @[
                             (__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor whiteColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor,                             ];
    gradientLayer.locations = @[@0.25,@0.5,@0.75];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    
    
    // 添加部分
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    basicAnimation.fromValue = @[@0, @0, @0.25];
    basicAnimation.toValue = @[@0.75, @1, @1];
    basicAnimation.duration = 2.5;
    basicAnimation.repeatCount = HUGE;
    [gradientLayer addAnimation:basicAnimation forKey:nil];
    
    // 第二次添加部分
    UILabel *unlock = [[UILabel alloc] initWithFrame:gradientLayer.bounds];
    // 必需要强引用保存unlock，此句也可以用[self.view addSubview:unlock]来替代;
    self.unlock = unlock;
    unlock.alpha = 0.5;
    unlock.text = @"滑动来解锁 >>";
    unlock.textAlignment = NSTextAlignmentCenter;
    unlock.font = [UIFont boldSystemFontOfSize:30];
    gradientLayer.mask = unlock.layer;
}
  

@end
