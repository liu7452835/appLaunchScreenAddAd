//
//  AdModel.h
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/11/4.
//  Copyright © 2018 lty. All rights reserved.
//
//模型不全，仅包含广告数据
#import "BaseModel.h"

@class AdModel_ads;

@interface AdModel : BaseModel

@property(nonatomic,copy) NSArray<AdModel_ads *> *ads;

@end


@interface AdModel_ads : BaseModel

@property(nonatomic,copy) NSArray *res_url;

@end





