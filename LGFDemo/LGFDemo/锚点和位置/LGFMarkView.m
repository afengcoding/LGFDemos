//
//  LGFMarkView.m
//  LGFDemo
//
//  Created by qddios2 on 16/9/8.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFMarkView.h"
#import "LGFSingleTouchRotationGesture.h"
@interface LGFMarkView ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation LGFMarkView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = NO;
        CAShapeLayer *border = [CAShapeLayer layer];
        border.strokeColor = [UIColor redColor].CGColor;
        
        border.fillColor = [UIColor clearColor].CGColor;
        
        border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        
        border.frame = self.bounds;
        
        border.lineWidth = 1.f;
        /* The cap style used when stroking the path. Options are `butt', `round'
         * and `square'. Defaults to `butt'. */

        border.lineCap = @"square";
        
        //这个是随机间隔闲的长短
        border.lineDashPattern = @[@3, @5];
        
        [self.layer addSublayer:border];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_right);
            make.centerY.equalTo(self.mas_bottom);
            make.width.height.greaterThanOrEqualTo(@0);
        }];
        LGFSingleTouchRotationGesture *srotation = [[LGFSingleTouchRotationGesture alloc] initWithTarget:self action:@selector(gestureAction:)];
        [self.imageView addGestureRecognizer:srotation];
        
    }
    return self;
}

- (void)gestureAction:(LGFSingleTouchRotationGesture*)sender
{
    self.transform = CGAffineTransformRotate(self.transform, sender.rotation);
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rotate_mark"]];
        _imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}

@end
