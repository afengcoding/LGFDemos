//
//  LGFLabel.m
//  demos
//
//  Created by qddios2 on 16/5/25.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFLabel.h"

@implementation LGFLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self handleGesture];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)handleGesture
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPress.minimumPressDuration = 1.0;
    [self addGestureRecognizer:longPress];
    
}

- (void)longPressAction:(UIGestureRecognizer *)sender
{
    [self becomeFirstResponder];
    self.backgroundColor = [UIColor lightGrayColor];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
    
}

#pragma mark - 是否可以成为第一响应
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)resignFirstResponder
{
    self.backgroundColor = [UIColor whiteColor];
    return YES;
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(select:));
}

- (void)select:(id)sender
{
    
}

- (void)copy:(id)sender
{
    UIPasteboard  *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
    [self resignFirstResponder];
}

#pragma mark - 判断是否有中文字符
- (NSArray *)IsChinese:(NSString *)str
{
    NSMutableArray *chinese = [NSMutableArray array];
    for (int i =0; i < str.length; i++) {
//        int a = [str characterAtIndex:i];
//        if (a >0x4e00 && a < 0x9fff) {
            //判断汉子编码的范围
            [chinese addObject:[str substringWithRange:NSMakeRange(i, 1)]];
//        }
    }
    return [NSArray arrayWithArray:chinese];
}

- (void)setKeyWord:(NSString *)keyWord
{
    _keyWord = keyWord;
    NSString *keychar = keyWord;
    NSRange range;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSStringCompareOptions mask = NSCaseInsensitiveSearch |NSNumericSearch;
    if ([self IsChinese:keyWord].count) {
        for (NSString *keyChinese in [self IsChinese:keyWord]) {
            range = [self.text rangeOfString:keyChinese options:mask];
            while (range.length) {
                [attributedString setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:14]} range:range];
                range = [self.text rangeOfString:keyChinese options:mask range:NSMakeRange(range.location + range.length, self.text.length - range.location - range.length)];
            }
            keychar = [keychar stringByReplacingOccurrencesOfString:keyChinese withString:@""];
        }
    }
    keychar = [keychar stringByReplacingOccurrencesOfString:@" " withString:@""];
    range = [self.text rangeOfString:keychar options:mask];
    while (range.length) {
        [attributedString setAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} range:range];
           range = [self.text rangeOfString:keychar options:mask range:NSMakeRange(range.location + range.length, self.text.length - range.location - range.length)];
    }
    self.attributedText = attributedString;
}
@end
