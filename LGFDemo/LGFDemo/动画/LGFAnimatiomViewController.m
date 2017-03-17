//
//  LGFAnimatiomViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/28.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFAnimatiomViewController.h"
#import "LGFBasicAnimationViewController.h"
#import "LGFAnimationExample.h"
@interface LGFAnimatiomViewController ()

@end

@implementation LGFAnimatiomViewController

+ (NSString *)URLProtocol
{
    return [LGFProtocolDef pAnimation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)caBasicAnimationAction:(UIButton *)sender {
    
    LGFBasicAnimationViewController *basicAnimationVC = [LGFBasicAnimationViewController new];
    [self.navigationController pushViewController:basicAnimationVC animated:YES ];
}

- (IBAction)animationExampleAction:(UIButton *)sender {
    LGFAnimationExample *vc = [LGFAnimationExample new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
