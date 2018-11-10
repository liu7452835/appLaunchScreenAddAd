//
//  BaseModel.m
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/10/31.
//  Copyright © 2018 lty. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID" : @"id",@"SINGED" : @"signed",@"DESCRIPTION" : @"description"};
}

@end
