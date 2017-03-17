//
//  LGFUIButton.m
//  demos
//
//  Created by qddios2 on 16/5/19.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFUIButton.h"

@implementation LGFUIButton


- (void)setFrame:(CGRect)frame
{
    CGRect my = frame;
    my.size.width = my.size.width + self.titleInsert.left;
    [super setFrame:my];
}
- (void)layoutSubviews
{
    
    [super layoutSubviews];
}

@end
