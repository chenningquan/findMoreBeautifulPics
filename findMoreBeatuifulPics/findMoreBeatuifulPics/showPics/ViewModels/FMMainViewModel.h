//
//  FMMainViewModel.h
//  FindMoreBeautifulPics
//
//  Created by 陈宁权 on 2019/3/7.
//  Copyright © 2019年 陈宁权. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMPicLineViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FMMainViewModel : NSObject

@property (nonatomic, strong) NSArray *datas;

/**
 下拉刷新

 @param finish 完成回调
 */
- (void)downRefreshWithFinished:(void (^)(BOOL isSuccess, NSString *msg))finish;

/**
 上拉加载更多

 @param finish 完成回调
 */
- (void)upRefreshWithFinished:(void (^)(BOOL isSuccess, NSString *msg))finish;

@end

NS_ASSUME_NONNULL_END
