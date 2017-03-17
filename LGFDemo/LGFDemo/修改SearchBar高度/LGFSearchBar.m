//
//  LGFSearchBar.m
//  demos
//
//  Created by qddios2 on 16/5/19.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFSearchBar.h"

@implementation LGFSearchBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIView *view in self.subviews) {
        for (UIView *sView in view.subviews) {
            if ([sView isKindOfClass:[UITextField class]]) {
                CGFloat x = self.contentInsert.left;
                CGFloat y = self.contentInsert.top;
//                CGFloat w = self.bounds.size.width - x - self.contentInsert.right;
                CGFloat w =  CGRectGetWidth(sView.frame)-self.contentInsert.left;
                CGFloat h = self.bounds.size.height - y - self.contentInsert.bottom;
                sView.frame = CGRectMake(x, y, w, h);
            }
        }
    }
}
@end
