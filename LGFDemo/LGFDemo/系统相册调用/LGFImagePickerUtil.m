//
//  LGFImagePickerUtil.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/25.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFImagePickerUtil.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation LGFImagePickerUtil

- (void)pickPhotoWithType:(LPickerSourceType)type allowsEditing:(BOOL)allowsEditing
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    if (type == LPickerSourceTypeCamera) {
        //拍照
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if (!isCamera) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"此设备没有摄像头" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
            return;
        }
        sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if (type == LPickerSourceTypePhotoLibrary) {
        //用户相册
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    } else {
        //相册时刻
        sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    
    [self presentImagePickerWithSource:sourceType allowsEditing:allowsEditing];
}

- (void)presentImagePickerWithSource:(UIImagePickerControllerSourceType)type allowsEditing:(BOOL)allowsEditing
{
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:type];
    if ([UIImagePickerController isSourceTypeAvailable:type] && [mediaTypes count] > 0) {
        if (self.presentedBlock) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeImage, nil];
            picker.allowsEditing = allowsEditing;
            picker.sourceType = type;
            self.presentedBlock(picker);
        }
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"访问照片库失败" message:@"没有权限访问您的照片" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
