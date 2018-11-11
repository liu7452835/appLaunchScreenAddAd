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
#import "AdSkip.h"

#define ADTIME 4 //广告停留时间


@interface LTYAdViewController ()
@property(nonatomic,weak) IBOutlet UIImageView *adImageView;
@property (weak, nonatomic) IBOutlet AdSkip *adSkipButton;
@property(nonatomic,strong) AdViewModel *adVM;
@property (weak, nonatomic) IBOutlet UIButton *adLink;

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
    NSURL *url = [self.adVM adURLAndAllowRandom:YES];//由数据库随机给出广告url地址
    [self.adImageView setImageWithURL:url];
    [NSTimer scheduledTimerWithTimeInterval:ADTIME target:self selector:@selector(removeAdImageView) userInfo:nil repeats:NO];//3秒后去除广告界面
    
    [self.adSkipButton setTitle:[NSString stringWithFormat:@"跳过%d",ADTIME] forState:UIControlStateNormal];
    [self startTime];
}

/**
 跳过按钮动作
 */
- (IBAction)adSkipAction:(UIButton *)sender {
    [self removeAdImageView];
}

- (void)removeAdImageView{
    [UIView animateWithDuration:0.3f animations:^{
        self.adImageView.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
        self.adImageView.alpha = 0.f;
        self.adSkipButton.hidden = YES;
        self.adLink.hidden = YES;
    } completion:^(BOOL finished) {
        //显示完广告后的动作
    }];
}

#pragma mark - 广告链接

- (IBAction)adLink:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"] options:@{} completionHandler:^(BOOL success) {
        
    }];
}


#pragma mark - 倒计时
-(void)startTime{
    NSDate *endDate = [NSDate dateWithTimeIntervalSinceNow:ADTIME];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        int interval = [endDate timeIntervalSinceNow];
        if (interval > 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                //[UIView beginAnimations:nil context:nil];
               // [UIView setAnimationDuration:1.0];
                [self.adSkipButton setTitle:[NSString stringWithFormat:@"跳过%d",interval] forState:UIControlStateNormal];
               // [UIView commitAnimations];
            });
        } else {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.adSkipButton setTitle:@"跳过0" forState:UIControlStateNormal];
            });
        }
    });
    dispatch_resume(timer);
}

- (AdViewModel *)adVM{
    if (!_adVM) {
        _adVM = [[AdViewModel alloc] init];
    }
    return _adVM;
}

@end
