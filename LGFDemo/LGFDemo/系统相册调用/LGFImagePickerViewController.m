//
//  LGFImagePickerViewController.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/25.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFImagePickerViewController.h"
#import "LGFImagePickerUtil.h"
@interface LGFImagePickerViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation LGFImagePickerViewController

+ (NSString *)URLProtocol
{
    return [LGFProtocolDef pImagePicker];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"点击屏幕";
    self.view.backgroundColor = [UIColor lightGrayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    LGFImagePickerUtil * handler = [[LGFImagePickerUtil alloc] init];
    __weak typeof(self) weakSelf = self;
    handler.presentedBlock = ^(UIImagePickerController *picker) {
        picker.delegate = weakSelf;
        [weakSelf presentViewController:picker animated:YES completion:nil];
    };
    UIAlertController   *alertVC = [UIAlertController alertControllerWithTitle:@"选择" message:@"图片来源" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *camarmeAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        [handler pickPhotoWithType:LPickerSourceTypeCamera allowsEditing:YES];
    }];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [handler pickPhotoWithType:LPickerSourceTypePhotoLibrary allowsEditing:YES];
    }];
    
    [alertVC addAction:camarmeAction];
    [alertVC addAction:photoAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *originalImage = nil;
    
    if ([info objectForKey:UIImagePickerControllerEditedImage]) {
        originalImage = [info objectForKey:UIImagePickerControllerEditedImage];
    } else {
        originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

@end
