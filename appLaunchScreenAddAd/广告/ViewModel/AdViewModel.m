//
//  AdViewModel.m
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/10/31.
//  Copyright © 2018 lty. All rights reserved.
//

#import "AdViewModel.h"
#import "AdNetManager.h"


@interface AdViewModel ()

@property(nonatomic,strong)AdModel * adModel;
@end


@implementation AdViewModel

/**
获得广告数据储存到模型中
*/
- (void)getDataCompletionHandle:(void (^)(NSError *))completed{
    self.dataTask = [AdNetManager getAdImageResourceCompletionHandle:^(id  _Nonnull responseObject, NSError * _Nullable error) {
        self.adModel = responseObject;
        completed(error);
    }];
}

- (NSURL *)adURLAndAllowRandom:(BOOL)allowRandom{
    if (allowRandom) {
        NSInteger i = arc4random() % self.adModel.ads.count;
        NSInteger j = arc4random() % self.adModel.ads[i].res_url.count;
        return [NSURL URLWithString:self.adModel.ads[i].res_url[j]];
    }else{
        return [NSURL URLWithString:self.adModel.ads[0].res_url[0]];
    }
}

- (AdModel *)adModel{
    if (!_adModel) {
        _adModel = [[AdModel alloc] init];
    }
    return _adModel;
}

@end
