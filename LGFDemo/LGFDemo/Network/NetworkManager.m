//
//  NetworkManager.m
//  LGFDemo
//
//  Created by qddios2 on 16/8/17.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "NetworkManager.h"

@interface NetworkManager ()
@property (nonatomic, strong) AFHTTPSessionManager *afManager;
@property (nonatomic, strong) AFHTTPResponseSerializer *responseSerializer;
@end

@implementation NetworkManager

+ (instancetype)shareManager
{
    static NetworkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetworkManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.afManager.responseSerializer = self.responseSerializer;
    }
    return self;
}

- (void)aaa
{
  
}

#pragma mark - getter
- (AFHTTPSessionManager *)afManager
{
    if (_afManager == nil) {
        _afManager = [AFHTTPSessionManager manager];
    }
    return _afManager;
}

- (AFHTTPResponseSerializer *)responseSerializer
{
    if (_responseSerializer == nil) {
        _responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _responseSerializer;
}
@end
