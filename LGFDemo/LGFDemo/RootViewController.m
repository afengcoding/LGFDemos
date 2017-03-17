//
//  RootViewController.m
//  demos
//
//  Created by qddios2 on 16/4/15.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import <objc/runtime.h>
static NSString *const cellId = @"cellId";
@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *dataDic;
@property (nonatomic, strong) NSMutableArray *classArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor   = [UIColor lightGrayColor];
    self.title = @"demo合集";
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self confingureData];
    NSLog(@"%@________________/n%@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.tableView.frame));
}


#pragma mark - confingureData
- (void)confingureData
{
//    NSString *path = [[NSBundle mainBundle] pathForResource:nil ofType:@"plist"];
//    NSArray *array = [NSArray arrayWithContentsOfFile:path];
//    for (NSDictionary *dic  in array) {
//        [self.dataArray addObject:dic[@"title"]];
//        [self.classArray addObject:dic[@"class"]];
//    }
    
    [self.classArray addObjectsFromArray:[self.dataDic allKeys]];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.classArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.text = [self.dataDic objectForKey:self.classArray[indexPath.row]];
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:self.classArray[indexPath.row] ofType:@"xib"];
    if (path.length) {
        vc = [[NSClassFromString(self.classArray[indexPath.row]) alloc] initWithNibName:self.classArray[indexPath.row] bundle:nil];
    } else {
        vc = [[NSClassFromString(self.classArray[indexPath.row]) alloc] init];
    }
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - getter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    }
    return _tableView;
}

void EnumerateRuntimeClasses(void (^block)(Class cls)){
    
    static Class *classes;
    static unsigned int classCount;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        classes = objc_copyClassList(&classCount);
    });
    
    for (unsigned int i = 0; i < classCount; i++){
        
        Class cls = classes[i];
        
        if (class_conformsToProtocol(cls, @protocol(LGFProtocol))){
            block(cls);
        }
    }
}

- (NSMutableDictionary *)dataDic
{
    if (_dataDic == nil) {
        _dataDic = [NSMutableDictionary dictionary];
        EnumerateRuntimeClasses(^(__unsafe_unretained Class cls) {
//            [_dataDic  ];
            NSString *protocolDef = [cls URLProtocol];
            [_dataDic setObject:protocolDef forKey:NSStringFromClass(cls)];
        });
    }
    return _dataDic;
}

- (NSMutableArray *)classArray
{
    if (_classArray == nil) {
        _classArray = [NSMutableArray array];
    }
    return _classArray;
}

@end
