//
//  LGFCustomSearchBarViewController.m
//  demos
//
//  Created by qddios2 on 16/5/19.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFCustomSearchBarViewController.h"
#import "LGFSearchBar.h"
#import <Masonry/Masonry.h>
@interface LGFCustomSearchBarViewController ()<UISearchBarDelegate>
@property (nonatomic, strong) LGFSearchBar *searchBar;

@end

@implementation LGFCustomSearchBarViewController

+ (NSString *)URLProtocol
{
    return [LGFProtocolDef pSearchBarHeight ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"自定义UISearchBar";
    self.view.backgroundColor = [UIColor whiteColor];
    self.searchBar = [[LGFSearchBar alloc] init];
    self.searchBar.showsCancelButton = YES;
    self.searchBar.placeholder = @"自定义位置";
    self.searchBar.tintColor = [UIColor blackColor];
    [self.view addSubview:self.searchBar];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.searchBar.contentInsert = UIEdgeInsetsMake(20, 40, 10, 5);
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@60);
    }];
    UITextField *textfield = [self.searchBar valueForKey:@"_searchField"];
    
    [textfield setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    textfield.textAlignment = NSTextAlignmentJustified;
    textfield.textColor = [UIColor blackColor];
    self.searchBar.delegate = self;
    
   
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
