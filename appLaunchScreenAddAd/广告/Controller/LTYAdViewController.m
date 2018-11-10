//
//  LTYAdViewController.m
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/10/28.
//  Copyright © 2018 lty. All rights reserved.
//

#import "LTYAdViewController.h"
#import "BaseNetManager.h"
#import "AdViewModel.h"

@interface LTYAdViewController ()
@property(nonatomic,weak) IBOutlet UIImageView *adImageView;
@property(nonatomic,strong) AdViewModel *adVM;
@end

@implementation LTYAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*用来测试中文转换方法
    NSString *string = [BaseNetManager percentURLByPath:@"lty" params:@{@"1":@"你厉害了！"}];
    NSLog(@"%@",string);
    string = [string stringByRemovingPercentEncoding];
    NSLog(@"%@",string);
     */
    [self.adVM getDataCompletionHandle:^(NSError *error) {
        [self setupAdImage];
    }];

}

- (void)setupAdImage{
    //self.adImageView.image = [UIImage imageNamed:@"ad"];//设置本地广告图片
    [self.adImageView setImageWithURL:[NSURL URLWithString:self.adVM.adModel.ads[1].res_url[0]]];
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(removeAdImageView) userInfo:nil repeats:NO];//10秒后去除广告界面
}

- (void)removeAdImageView{
    [UIView animateWithDuration:0.3f animations:^{
        self.adImageView.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
        self.adImageView.alpha = 0.f;
    } completion:^(BOOL finished) {
        //显示完广告后的动作
    }];
}

- (AdViewModel *)adVM{
    if (!_adVM) {
        _adVM = [[AdViewModel alloc] init];
    }
    return _adVM;
}

@end
