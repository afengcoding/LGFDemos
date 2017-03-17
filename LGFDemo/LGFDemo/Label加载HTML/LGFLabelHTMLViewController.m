//
//  LGFLabelHTMLViewController.m
//  demos
//
//  Created by qddios2 on 16/5/25.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFLabelHTMLViewController.h"

#import <WebKit/WebKit.h>
#import <SafariServices/SFSafariViewController.h>
@interface LGFLabelHTMLViewController ()<UITextViewDelegate>
@property (nonatomic, strong) MASConstraint *height;
@end

@implementation LGFLabelHTMLViewController

+ (NSString *)URLProtocol
{
    return [LGFProtocolDef pLabelHtml];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Label加载HTML语言";
    NSString *reusult = @"结果发现在ios6上计算出的长度根www.baidu.com本不对， 会致使有一部分文字显示不出来的情况。但在ios7上上面这分代码是正确的。";
    NSString *key = @"长度";
    NSString * htmlString = [NSString stringWithFormat:@"<html><body><font color=\"#ff6601\">%@</font> </body></html>", key];
    NSString *str = [reusult stringByReplacingOccurrencesOfString:key withString:htmlString];
    
    
    UILabel *my = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 100)];
    my.numberOfLines = 0;
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    my.attributedText = attrStr;
    my.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:my];
    
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectZero];
    textView.delegate = self;
    textView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.height.equalTo(@40);
        make.top.equalTo(my.mas_bottom).offset(100);
    }];
    
    
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
     return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
     return YES;
}
- (void)textViewDidChange:(UITextView *)textView
{
    [textView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(textView.contentSize.height));
    }];
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0)
{
     return YES;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0)
{
     return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SFSafariViewController *vc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"http://app.diyidan.net/level.html"]];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
