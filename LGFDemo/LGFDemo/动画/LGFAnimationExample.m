//
//  LGFAnimationExample.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/28.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFAnimationExample.h"
#import "LGFCircleView.h"
#import "LGFRecordingCircleView.h"
@interface LGFAnimationExample ()

@end

@implementation LGFAnimationExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    LGFCircleView *circleView = [[LGFCircleView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    circleView.layer.cornerRadius = 50;
    circleView.layer.masksToBounds = YES;
    [self.view addSubview:circleView];
    
    LGFRecordingCircleView *recode = [[LGFRecordingCircleView alloc] initWithFrame:CGRectMake(50, 250, 200, 200)];
    recode.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:recode];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
