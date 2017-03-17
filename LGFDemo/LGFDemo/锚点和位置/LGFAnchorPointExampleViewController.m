//
//  LGFAnchorPointExampleViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/9/8.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFAnchorPointExampleViewController.h"
#import "LGFMarkView.h"
@interface LGFAnchorPointExampleViewController ()
@property (nonatomic, strong) UIView *rotationView;
@end

@implementation LGFAnchorPointExampleViewController

+ (NSString *)URLProtocol
{
    return @"锚点和位置";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    LGFMarkView *markView = [[LGFMarkView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:markView];
    UIBarButtonItem *ta = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonSystemItemFixedSpace target:nil action:nil];
}

- (void)rotationAction:(UIPanGestureRecognizer *)sender
{
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
