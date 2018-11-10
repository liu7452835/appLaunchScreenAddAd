//
//  BaseNetManager.m
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/10/30.
//  Copyright © 2018 lty. All rights reserved.
//

#import "BaseNetManager.h"



@implementation BaseNetManager

/**单例一个AFHTTPSessionManager*/
+ (AFHTTPSessionManager *)defaultManager{
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];

        //设置接受解析的内容
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"text/plain",@"text/javascript",@"application/json", nil];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return manager;
}

+(id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id _Nonnull, NSError * _Nullable))completed{
    NSLog(@"Request Method:GET,Path:%@,params:%@",path,params);
    
    return [[self defaultManager] GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"GET ERROR:%@",error.userInfo);
    }];
   
}

+(id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id _Nonnull, NSError * _Nullable))completed{
    NSLog(@"Request Method:POST,Paht:%@,params:%@",path,params);
    return [[self defaultManager] POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"GET ERROR:%@",error.userInfo);
    }];
}

+(NSString *)percentURLByPath:(NSString *)path params:(NSDictionary *)params{
    NSMutableString *percentPath = [NSMutableString stringWithString:path];
    NSArray *key = params.allKeys;
    NSInteger count = key.count;
    
    for (int i = 0; i < count; i++) {
        if (i == 0) {
            [percentPath appendFormat:@"?%@=%@",key[i],params[key[i]]];
        } else {
            [percentPath appendFormat:@"&%@=%@",key[i],params[key[i]]];
        }
    }
//    return [percentPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "]];//最后一个是空格,这些字符编码时将忽略，不会进行编码。
//  把字符串中的中文转换为%号形式
    return [percentPath stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "] invertedSet]];//这些字符编码时将编码。这些字符之外的字符编码时不进行编码，如？、&、英文字母和数字等都不进行编码。
}

@end
