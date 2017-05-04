//
//  ZYAppDotNetAPIClient.h
//  ZYNetWorking
//
//  Created by allen on 2017/4/28.
//  Copyright © 2017年 allen. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface ZYAppDotNetAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
