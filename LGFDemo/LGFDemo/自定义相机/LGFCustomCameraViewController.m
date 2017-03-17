//
//  LGFCustomCameraViewController.m
//  demos
//
//  Created by qddios2 on 16/5/17.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFCustomCameraViewController.h"
#import "MyViewController.h"
#import "LGFUIButton.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIView+LGF.h"
@interface LGFCustomCameraViewController ()
@property (nonatomic, assign) CGFloat topOffset;
@end

@implementation LGFCustomCameraViewController
+ (NSString *)URLProtocol
{
    return [LGFProtocolDef pCustomCamera];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"自定义相机";
    self.view.backgroundColor = [UIColor redColor];
    UIImageView *image = [[UIImageView alloc] init];
    [self.view addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.height.width.greaterThanOrEqualTo(@0);
    }];
    
    [image sd_setImageWithURL:[NSURL URLWithString:@"http://qddfiletest.img-cn-hangzhou.aliyuncs.com/default/biggrade3.png"]];

    UIView *my = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [my getGradientBackgroundColorWithColor:[UIColor yellowColor] isUpToDownChange:YES];
    [self.view addSubview:my];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    MyViewController *vc = [[MyViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
