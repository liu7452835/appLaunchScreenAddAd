//
//  AdViewModel.h
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/10/31.
//  Copyright © 2018 lty. All rights reserved.
//

#import "BaseViewModel.h"
#import "AdModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdViewModel : BaseViewModel
@property(nonatomic,readonly) AdModel *adModel;
@end

NS_ASSUME_NONNULL_END
