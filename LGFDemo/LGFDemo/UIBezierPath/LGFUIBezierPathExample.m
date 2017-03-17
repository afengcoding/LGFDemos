//
//  LGFUIBezierPathExample.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/23.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFUIBezierPathExample.h"
#import "LGFBezirePathView.h"
@interface LGFUIBezierPathExample ()

@end

@implementation LGFUIBezierPathExample


#pragma mark- LGFProtocol
+ (NSString *)URLProtocol
{
    return [LGFProtocolDef pBezirePath];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    LGFBezirePathView *view = [[LGFBezirePathView alloc] initWithFrame:self.view.frame];
//    view.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:view];
    [self addMask];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addMask
{
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    UIButton *maskButton = [[UIButton alloc] init];
    [maskButton setFrame:CGRectMake(0, 0, w, h)];
    [maskButton setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [self.view addSubview:maskButton];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, w, h)];
    
//    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(w/2, 200) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    UIBezierPath *path3 = [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 400, w - 2 * 20, 100) cornerRadius:15] bezierPathByReversingPath ];
//    [path appendPath:path2];
    [path appendPath:path3];
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = path.CGPath;
    [maskButton.layer setMask:shapLayer];
}




@end
