//
//  LGFResizableImageViewController.m
//  demos
//
//  Created by qddios2 on 16/5/20.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFResizableImageViewController.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>
@interface LGFResizableImageViewController ()<TTTAttributedLabelDelegate>
@property (nonatomic, strong) UIImageView *orimageView;
@property (nonatomic, strong) UIImageView *strechImageView;

@end

@implementation LGFResizableImageViewController

+ (NSString *)URLProtocol
{
    return [LGFProtocolDef pPicStrecth];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"图片拉伸";
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIImage * image = [UIImage imageNamed:@"123"];
    [self.view addSubview:self.orimageView];
    [self.view addSubview:self.strechImageView];
    [self.orimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(50);
        make.left.equalTo(self.view.mas_left).offset(50);
        make.width.height.greaterThanOrEqualTo(@0);
    }];
    
    [self.strechImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50);
        make.top.equalTo(self.orimageView.mas_bottom).offset(50);
        make.height.equalTo(@300);
        make.width.equalTo(@250);
    }];
    
    self.orimageView.image = image;
    self.orimageView.userInteractionEnabled = YES;
    self.strechImageView.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(50, 50, 50, -50) resizingMode:UIImageResizingModeStretch];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(add)];
    [self.orimageView addGestureRecognizer:tap];
    
    
}

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImageView *)orimageView
{
    if (_orimageView == nil) {
        _orimageView = [[UIImageView alloc] init];
        
    }
    return _orimageView;
}

- (UIImageView *)strechImageView
{
    if (_strechImageView == nil) {
        _strechImageView = [[UIImageView alloc] init];
    }
    return _strechImageView;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}



- (void)add
{
    UIMenuController *menu=[UIMenuController sharedMenuController];
    
    UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(add)];
    
    UIMenuItem *resendItem = [[UIMenuItem alloc] initWithTitle:@"转发" action:@selector(add)];
    
    [menu setMenuItems:[NSArray arrayWithObjects:copyItem,resendItem,nil]];
    
    [menu setTargetRect:self.orimageView.frame inView:self.view];
    menu.arrowDirection = UIMenuControllerArrowRight;
    
    [menu setMenuVisible:YES animated:YES];
}


@end
