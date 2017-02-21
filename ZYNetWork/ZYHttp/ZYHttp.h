//
//  ZYHttp.h
//  ZYBookMarks
//
//  Created by 换一换 on 16/8/26.
//  Copyright © 2016年 张洋. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, NetworkStatus) {
    /** 未知网络*/
    NetworkStatusUnknown,
    /** 无网络*/
    NetworkStatusNotReachable,
    /** 手机网络*/
    NetworkStatusReachableViaWWAN,
    /** WIFI网络*/
    NetworkStatusReachableViaWiFi
};

/**  成功的回调 */
typedef void(^RequestSuccess)(id  requestDic);
/**  失败的回调 */
typedef void(^RequestFail)(NSError *error);
/**  缓存的回调 */
typedef void(^RequestCache)(id requestCache);
/**  上传或者下载进度的回调 */
typedef void(^RequestProgress)(NSProgress *progress);
/**   网络状态回调 */
typedef void(^RequestNetWorkStatus)(NetworkStatus status);
/**  请求任务 */
typedef NSURLSessionTask URLSessionTask;

@interface ZYHttp : NSObject
/**
 *  监听网络,可在appdelegate设置全局监控
 */
+(void)MonitorNetwork;


/**
 *  get请求
 *
 *  @param url           请求路径
 *  @param cache         是否缓存
 *  @param params        参数
 *  @param target        目标vc
 *  @param indicator     是否显示指示器
 *  @param progressBlock 进度回调
 *  @param successBlock  成功回调
 *  @param failBlock     失败回调
 *
 *  @return 返回任务,可以取消
 */

+(URLSessionTask *)getRequestUrl:(NSString *)url params:(NSDictionary *)params cache:(BOOL )cache target:(UIViewController *)target indicator:(BOOL)indicator progressBlock:(RequestProgress)progressBlock successBlock:(RequestSuccess)successBlock failBlock:(RequestFail)failBlock;


/**
 *  post请求
 *
 *  @param url           请求路径
 *  @param cache         是否缓存
 *  @param params        参数
 *  @param target        目标vc
 *  @param indicator     是否显示指示器
 *  @param progressBlock 进度回调
 *  @param successBlock  成功回调
 *  @param failBlock     失败回调
 *
 *  @return 返回任务,可以取消
 */
+(URLSessionTask *)postRequestUrl:(NSString *)url params:(NSDictionary *)params cache:(BOOL )cache  target:(UIViewController *)target indicator:(BOOL)indicator progressBlock:(RequestProgress)progressBlock successBlock:(RequestSuccess)successBlock failBlock:(RequestFail)failBlock;

/**
 *   上传单个文件
 *
 *  @param url           路径
 *  @param params        拼接参数
 *  @param data          数据
 *  @param type          上传文件类型
 *  @param fileName      上传服务器文件夹名字
 *  @param mimeType      媒体类型
 *  @param target        当前vc
 *  @param indicator     是否显示指示器
 *  @param progressBlock 进度回调
 *  @param successBlock  成功回调
 *  @param failBlock     失败回调
 *
 *  @return 任务
 */
+(URLSessionTask *)uploadFileWithUrl:(NSString *)url params:(NSDictionary *)params fileData:(NSData *)data type:(NSString *)type name:(NSString *)name mimeType:(NSString *)mimeType target:(UIViewController *)target indicator:(BOOL)indicator progressBlock:(RequestProgress)progressBlock successBlock:(RequestSuccess)successBlock failBlock:(RequestFail)failBlock;

/**
 *   上传多个文件
 *
 *  @param url           路径
 *  @param params        拼接参数
 *  @param data          数据
 *  @param type          上传文件类型
 *  @param fileName      上传服务器文件夹名字
 *  @param mimeType      媒体类型
 *  @param target        当前vc
 *  @param indicator     是否显示指示器
 *  @param progressBlock 进度回调
 *  @param successBlock  成功回调
 *  @param failBlock     失败回调
 *
 *  @return 任务
 */
+(URLSessionTask *)uploadMultiFileWithUrl:(NSString *)url params:(NSDictionary *)params fileData:(NSArray  *)datas type:(NSString *)type name:(NSString *)name mimeType:(NSString *)mimeType target:(UIViewController *)target indicator:(BOOL)indicator progressBlock:(RequestProgress)progressBlock successBlock:(RequestSuccess)successBlock failBlock:(RequestFail)failBlock;

/**
 *  文件下载
 *
 *  @param url           下载文件接口地址
 *  @param progressBlock 下载进度
 *  @param successBlock  成功回调
 *  @param failBlock     下载回调
 *
 *  @return 返回的对象可取消请求
 */
+ (URLSessionTask *)downloadWithUrl:(NSString *)url
                        progressBlock:(RequestProgress)progressBlock
                         successBlock:(RequestSuccess)successBlock
                            failBlock:(RequestFail)failBlock;


/**
 *  配置请求头
 *
 *  @param httpHeader 请求头
 */
+ (void)configHttpHeader:(NSDictionary *)httpHeader;

/**
 *  取消GET请求
 */
+ (void)cancelRequestWithURL:(NSString *)url;

/**
 *  取消所有请求
 */
+ (void)cancleAllRequest;

/**
 *	设置超时时间
 *
 *  @param timeout 超时时间
 */
+ (void)setupTimeout:(NSTimeInterval)timeout;

@end
