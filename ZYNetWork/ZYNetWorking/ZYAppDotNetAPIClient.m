//
//  ZYAppDotNetAPIClient.m
//  ZYNetWorking
//
//  Created by allen on 2017/4/28.
//  Copyright © 2017年 allen. All rights reserved.
//

#import "ZYAppDotNetAPIClient.h"

@implementation ZYAppDotNetAPIClient
+ (instancetype)sharedClient {
    static ZYAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ZYAppDotNetAPIClient alloc] init];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}
@end
