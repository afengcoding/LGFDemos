//
//  LGFButton.h
//  LGFDemo
//
//  Created by qddios2 on 16/6/17.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,ButtonType) {
    ButtonTypeLeftImage,
    ButtonTypeRightImage,
    ButtonTypeTopImage,
    ButtonTypeBottomImage
};
@interface LGFButton : UIButton
@property (nonatomic, assign) ButtonType btype;
@end
