//
//  NSURLSessonTestViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/6/2.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "NSURLSessonTestViewController.h"
#import "AFNetworking.h"
@interface NSURLSessonTestViewController ()
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UIProgressView *progressView1;
@property (nonatomic, strong) UIProgressView *progressView2;
@property (nonatomic, strong) UIProgressView *progressView3;
@property (nonatomic, strong) UIProgressView *progressView4;
@end

@implementation NSURLSessonTestViewController

+ (NSString *)URLProtocol
{
    return [LGFProtocolDef pDownLoad];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *downLoadTestButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downLoadTestButton.frame = CGRectMake(50, 100, 100, 50);
    [downLoadTestButton setTitle:@"下载测试" forState:UIControlStateNormal];
    downLoadTestButton.layer.borderColor = [UIColor blueColor].CGColor;
    [downLoadTestButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [downLoadTestButton addTarget:self action:@selector(downLoadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downLoadTestButton];
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.frame = CGRectMake(20, 200, 200, 10);
    self.progressView = progressView;
    [self.view addSubview:self.progressView];
    
}

- (void)downLoadButtonAction:(UIButton *)sender
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.operationQueue.maxConcurrentOperationCount = 2;
   NSURLSessionDataTask *task = [manager GET:@"http://pic22.nipic.com/20120711/6678871_132334363130_2.jpg" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@", downloadProgress);
      dispatch_async(dispatch_get_main_queue(), ^{
          [self.progressView setProgress:downloadProgress.fractionCompleted animated:YES];
      });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
