//
//  ZYServerConfig.h
//  ZYNetWorking
//
//  Created by allen on 2017/5/2.
//  Copyright © 2017年 allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYServerConfig : NSObject

// env: 环境参数 00: 测试环境 01: 生产环境
+ (void)setZYConfigEnv:(NSString *)value;

// 返回环境参数 00: 测试环境 01: 生产环境
+ (NSString *)ZYConfigEnv;

// 获取服务器地址
+ (NSString *)getZYServerAddr;
@end
