//
//  LGFHighLightKeyWordsViewController.m
//  demos
//
//  Created by qddios2 on 16/5/25.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFHighLightKeyWordsViewController.h"
#import "LGFLabel.h"
@interface LGFHighLightKeyWordsViewController ()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

@implementation LGFHighLightKeyWordsViewController

+ (NSString *)URLProtocol
{
    return [LGFProtocolDef pHighLightKeyWords];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *keyword = @"我爱你520ABC";
    self.title = @"keyword = 我爱你520";
    LGFLabel *label = [[LGFLabel alloc] initWithFrame:CGRectMake(20, 100, 150, 50)];
    label.text = @"我AAB是吕桂峰";
    label.keyWord = keyword;
    LGFLabel *label1 = [[LGFLabel alloc] initWithFrame:CGRectMake(20, 170, 150, 50)];
    label1.text = @"爱你ABC啊2";
    label1.keyWord = keyword;
    LGFLabel *label2 = [[LGFLabel alloc] initWithFrame:CGRectMake(20, 240, 150, 50)];
    label2.text = @"我520";
    label2.keyWord = keyword;
    LGFLabel *label3 = [[LGFLabel alloc] initWithFrame:CGRectMake(20, 310, 150, 50)];
    label3.text = @"大爱无疆";
    label3.keyWord = keyword;
    LGFLabel *label4 = [[LGFLabel alloc] initWithFrame:CGRectMake(20, 380, 150, 50)];
    label4.text = @"我520吕桂峰";
    label4.keyWord = keyword;
    [self.view addSubview:label];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    //一下部分实现文字渐变颜色的实现
    //创建渐变层
    UILabel *gLabel = [[UILabel alloc] init];
    gLabel.text = @"哈利哈啊苦逼男爸爸那么你把空间及挨个看空间了";
    gLabel.center = CGPointMake(20, 200);
    [gLabel sizeToFit];
    [self.view addSubview:gLabel];
    
   UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 30);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(UIButton *)sender
{
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor clearColor];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    UIView *myView = [[UIView alloc] initWithFrame:self.view.frame];
    myView.backgroundColor = [UIColor blackColor];
    myView.alpha = 0.3;
    [vc.view addSubview:myView];
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end
