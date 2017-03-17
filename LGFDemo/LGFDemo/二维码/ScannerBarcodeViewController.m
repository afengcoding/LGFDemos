//
//  ScannerBarcodeViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/5/31.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "ScannerBarcodeViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ScannerBarcodeViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic, strong) AVCaptureDevice *devcice;
@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) CALayer *layer;
@end

@implementation ScannerBarcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    AVCaptureDeviceInput *input =[AVCaptureDeviceInput deviceInputWithDevice:self.devcice error:nil ];
    [self.session addInput:input];
    //设置输出数据
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [self.session addOutput:output];
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    //添加阅读预览图层
    AVCaptureVideoPreviewLayer *layer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    layer.frame = self.view.bounds;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
    //开始扫描
    [self.session startRunning];
    
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count) {
        AVMetadataMachineReadableCodeObject *metadata = [metadataObjects lastObject];
        NSLog(@"%@", metadata.stringValue);
    }
    [self.session stopRunning];
    [self.layer removeFromSuperlayer];
    
}

#pragma mark - getter
/** 设备*/
- (AVCaptureDevice *)devcice
{
    if (_devcice == nil) {
        _devcice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

    }
    return _devcice;
}

/**
 *  捕捉会话
 *
 *  @return
 */
- (AVCaptureSession *)session
{
    if (_session == nil) {
        _session = [[AVCaptureSession alloc] init];
    }
    return _session;
}
@end
