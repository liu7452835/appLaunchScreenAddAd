//
//  BaseViewModel.h
//  appLaunchScreenAddAd
//
//  Created by 刘天宇 on 2018/10/30.
//  Copyright © 2018 lty. All rights reserved.
//
/**viewmodel类负责数据处理，通过netmanager请求返回的数据用model储存，该类对model进行相应的调用，提供数据给view */
#import <Foundation/Foundation.h>

@protocol BaseViewModelDelegate <NSObject>

@optional

/**获取数据 */
- (void)getDataCompletionHandle:(void(^)(NSError *error))completed;
/**获取更多数据*/
- (void)getMoreDataCompletionHandle:(void(^)(NSError *error))completed;
/** 刷新 */
- (void)refreshDataCompletionHandle:(void(^)(NSError *error))completed;
@end


NS_ASSUME_NONNULL_BEGIN

@interface BaseViewModel : NSObject<BaseViewModelDelegate>

@property(nonatomic,strong) NSURLSessionDataTask *dataTask;

/** 取消任务 */
- (void)cancelTask;

/** 暂停任务 */
- (void)suspendTask;

/** 继续任务 */
- (void)resumeTask;

@end

NS_ASSUME_NONNULL_END
