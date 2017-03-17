//
//  BarcodeViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/5/31.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "BarcodeViewController.h"
#import "CreateBarcodeViewController.h"
#import "ScannerBarcodeViewController.h"
@interface BarcodeViewController ()

@end

@implementation BarcodeViewController

+(NSString *)URLProtocol
{
    return [LGFProtocolDef pBarCode];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UISegmentedControl *segmentControls = [[UISegmentedControl alloc] initWithItems:@[@"二维码生成", @"扫描二维码"]];
    segmentControls.frame = CGRectMake(100, 100, 200, 60);
//    segmentControls.selectedSegmentIndex = 0;
    [segmentControls addTarget:self action:@selector(didClickSegmentControl:) forControlEvents:UIControlEventValueChanged];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:segmentControls];
    
    
}

- (void)didClickSegmentControl:(UISegmentedControl *)sender
{
    NSInteger index = sender.selectedSegmentIndex;
    if (index) {
        ScannerBarcodeViewController *scannerVC = [[ScannerBarcodeViewController alloc] init];
        [self.navigationController   pushViewController:scannerVC animated:YES];
    } else {
        CreateBarcodeViewController *createBarcodeVC = [[CreateBarcodeViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController   pushViewController:createBarcodeVC animated:YES];
    }
}


@end
