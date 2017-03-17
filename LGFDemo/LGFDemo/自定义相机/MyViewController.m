//
//  MyViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/6/12.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.frame];
    [web loadHTMLString:@"http://www.qidiandian.com/wap/protocol.html" baseURL:nil];
    [self.view addSubview:web];
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
