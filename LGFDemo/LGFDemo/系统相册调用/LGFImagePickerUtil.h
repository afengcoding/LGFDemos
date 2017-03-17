//
//  LGFImagePickerUtil.h
//  LGFDemo
//
//  Created by qddios2 on 16/8/25.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LPickerSourceType) {
    LPickerSourceTypeCamera,
    LPickerSourceTypePhotoLibrary,
    LPickerSourceTypeSavedPhotosAlbum
};

@interface LGFImagePickerUtil : NSObject

- (void)pickPhotoWithType:(LPickerSourceType)type allowsEditing:(BOOL)allowsEditing;

@property (nonatomic, copy) void (^presentedBlock)(UIImagePickerController *picker);

@end
