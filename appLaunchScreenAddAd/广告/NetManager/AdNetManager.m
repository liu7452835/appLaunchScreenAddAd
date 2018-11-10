//
//  AdNetManager.m
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/11/4.
//  Copyright © 2018 lty. All rights reserved.
//

#import "AdNetManager.h"
#import "adModel.h"

@implementation AdNetManager
//网易广告地址(基本地址)
#define AdImageResource @"http://g1.163.com/madr?app=7A16FBB6&platform=ios&category=startup&location=1&timestamp="

+ (id)getAdImageResourceCompletionHandle:(void (^)(id _Nonnull, NSError * _Nullable))completed{
    return [self GET:[self adImageResourceURL] parameters:nil completionHandle:^(id  _Nonnull responseObject, NSError * _Nullable error) {
        
//        将非UTF8编码方式转换
        NSError * encodeError;
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
        NSString* strdata = [[NSString alloc]initWithData:responseObject encoding:enc];//再将NSString类型转为NSData
        
        NSData * data = [strdata dataUsingEncoding:NSUTF8StringEncoding];//这样解决的乱码问题。
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&encodeError ];
        
        //NSLog(@"%@",json);
//        将非UTF8编码方式转换
        
        completed([AdModel mj_objectWithKeyValues:json],error);
        //通过responseobject转换后的json来创建一个admodel模型
    }];
}

+ (NSString *)adImageResourceURL{
    NSInteger now = [[[NSDate alloc] init] timeIntervalSince1970];
    return [AdImageResource stringByAppendingFormat:@"%ld",(long)now];
}


@end
