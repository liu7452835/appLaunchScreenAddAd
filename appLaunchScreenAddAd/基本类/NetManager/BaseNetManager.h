//
//  BaseNetManager.h
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/10/30.
//  Copyright © 2018 lty. All rights reserved.
//
/**netmanager类负责根据网络url对服务器进行请求，回调相应的数据responseobject给viewmodel */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseNetManager : NSObject

/**
 对AFHTTPSessionManager的GET请求方法进行了封装

 @param path 请求的基本路径
 @param params 地址参数
 @param completed 请求完成后进行的动作
 @return 返回 NSURLSessionDataTask对象
 */
+(id)GET:(NSString *)path parameters:(NSDictionary * _Nullable   )params completionHandle:(void(^)(id responseObject, NSError * _Nullable error))completed;

/**
 对AFHTTPSessionManager的POST请求方法进行了封装

 @param path 请求的基本路径
 @param params 地址参数
 @param completed 请求完成后进行的动作
 @return 返回 NSURLSessionDataTask对象
 */
+(id)POST:(NSString *)path parameters:(NSDictionary * _Nullable )params completionHandle:(void(^)(id responseObject,NSError * _Nullable error))completed;

/**
 为了应付某些服务器对于中文字符串不支持的情况，需要转化字符串为带有%号形式

 @param path 请求的路径，即 ? 前面部分
 @param params 请求的参数，即 ? 号后面部分
 @return 转化 路径+参数 拼接出的字符串中的中文为 % 号形式
 */
+(NSString *)percentURLByPath:(NSString *)path params:(NSDictionary *)params;


@end

NS_ASSUME_NONNULL_END
