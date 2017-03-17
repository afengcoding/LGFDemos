//
//  LGFCALayerExampleViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/29.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFCALayerExampleViewController.h"
#import "LGFCAGradientLayerExample.h"
@interface LGFCALayerExampleViewController ()

@end

@implementation LGFCALayerExampleViewController

+ (NSString *)URLProtocol
{
    return [LGFProtocolDef pCALayer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
}
- (IBAction)caLayerAction:(UIButton *)sender {
}
- (IBAction)caShapeLayer:(UIButton *)sender {
}
- (IBAction)caGradientLayerAction:(UIButton *)sender {
    LGFCAGradientLayerExample *gradientVC = [LGFCAGradientLayerExample new];
    [self.navigationController pushViewController:gradientVC animated:YES];
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
