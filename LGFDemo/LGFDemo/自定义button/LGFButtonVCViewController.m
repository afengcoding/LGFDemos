//
//  LGFButtonVCViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/6/17.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFButtonVCViewController.h"
#import "UIButton+LGF.h"
#import "LGFButton.h"
@interface LGFButtonVCViewController ()

@end

@implementation LGFButtonVCViewController

+ (NSString *)URLProtocol
{
    return [LGFProtocolDef  pCustomButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    LGFButton  *button = [LGFButton buttonWithType:UIButtonTypeCustom];
    button.btype = ButtonTypeTopImage;
    button.imageView.contentMode = UIViewContentModeCenter;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setImage:[UIImage imageNamed:@"AppIcon-129x29"] forState:UIControlStateNormal];
    [button setTitle:@"QQQQQQQQQQQQQQQQQ" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 2;
    button.layer.masksToBounds = YES;
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.greaterThanOrEqualTo(@0);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       [button setTitle:@"123" forState:UIControlStateNormal];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
