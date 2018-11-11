//
//  AdSkip.m
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/11/11.
//  Copyright © 2018 lty. All rights reserved.
//

#import "AdSkip.h"

@implementation AdSkip
/*
- (instancetype)init{
    if (self = [super init]) {
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitle:@"跳过" forState:UIControlStateNormal];
        self.layer.cornerRadius = 5;
    }
    return self;
}
*/

-(void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[self setTitle:@"跳过" forState:UIControlStateNormal];
    self.backgroundColor = [UIColor grayColor];
    self.alpha = 0.5;
    self.layer.cornerRadius = 5;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
}

@end
