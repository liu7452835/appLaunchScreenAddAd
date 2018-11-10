//
//  BaseViewModel.m
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/10/30.
//  Copyright © 2018 lty. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

- (void)cancelTask{
    [self.dataTask cancel];
}

- (void)suspendTask{
    [self.dataTask suspend];
}

- (void)resumeTask{
    [self.dataTask resume];
}

@end
