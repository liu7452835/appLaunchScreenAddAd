//
//  AdNetManager.h
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/11/4.
//  Copyright © 2018 lty. All rights reserved.
//

#import "BaseNetManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdNetManager : BaseNetManager

/**
 根据url获得广告图片资源
 */
+(id)getAdImageResourceCompletionHandle:(void(^)(id responseObject,  NSError * _Nullable error))completed;

@end

NS_ASSUME_NONNULL_END
