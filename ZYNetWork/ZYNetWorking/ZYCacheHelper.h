//
//  ZYCacheHelper.h
//  ZYNetWorking
//
//  Created by allen on 2017/5/2.
//  Copyright © 2017年 allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYCacheHelper : NSObject
/**
 *  缓存网络数据
 *
 *  @param responseCache 服务器返回的数据
 *  @param key           缓存数据对应的key值,推荐填入请求的URL
 */
+(void)saveResponseCache:(id)responseCache forKey:(NSString *)key;

/**
 *  取出缓存的数据
 *
 *  @param key 根据存入时候填入的key值来取出对应的数据
 *
 *  @return 缓存的数据
 */
+(id)getResponseCacheForKey:(NSString *)key;
/**
 *   根据某个值删除缓存
 *
 *  @param key key
 */
+(void)removeCacheForKey:(NSString *)key;
/**
 *  清除所有数据
 */
+(void)removAllCache;

/**
 存储文件
 
 @param key      缓存数据对应的key值
 @param file     文件
 @param fileName 文件名称
 
 @return 存储的位置
 */
+(NSString *)saveFileWithKey:(NSString *)key file:(id)file fileName:(NSString *)fileName;

/**
 得到存储的文件
 
 @param key 存储的key
 
 @return 返回文件
 */
+(id)getFileWithKey:(NSString *)key;

/**
 得到文件储存路径

 @return 返回路径
 */
+(NSString *)getFilePath;
@end
