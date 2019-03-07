//
//  FMMainViewModel.m
//  FindMoreBeautifulPics
//
//  Created by 陈宁权 on 2019/3/7.
//  Copyright © 2019年 陈宁权. All rights reserved.
//

#import "FMMainViewModel.h"
#import "FMNetService.h"

@interface FMMainViewModel()

/**
 当前加载了几页数据
 */
@property (nonatomic, assign) NSInteger currentPage;

/**
 数据源
 */
@property (nonatomic, strong) NSMutableArray *models;
@end

@implementation FMMainViewModel

/**
 下拉刷新
 
 @param finish 完成回调
 */
- (void)downRefreshWithFinished:(void (^)(BOOL isSuccess, NSString *msg))finish {
    [FMNetService getPicModelsWithPage:1 finished:^(BOOL isSuccess, NSArray<FMPicsModel *> * _Nonnull models, NSString * _Nonnull msg) {
        if (!isSuccess) { //获取数据失败
            finish(isSuccess,msg);
            return;
        }
        
        //清空数据源
        [self.models removeAllObjects];
        self.currentPage = 1;
        
        //遍历DataModel数组，转换为ViewModel数组
        for (FMPicsModel *dataModel in models) {
            FMPicLineViewModel *viewModel = [FMPicLineViewModel initWithDataModel:dataModel];
            [self.models addObject:viewModel];
        }
        
        //回调给调用方
        finish(isSuccess,nil);
    }];
}

/**
 上拉加载更多
 
 @param finish 完成回调
 */
- (void)upRefreshWithFinished:(void (^)(BOOL isSuccess, NSString *msg))finish {
    [FMNetService getPicModelsWithPage:self.currentPage finished:^(BOOL isSuccess, NSArray<FMPicsModel *> * _Nonnull models, NSString * _Nonnull msg) {
        //获取数据失败直接返回
        if (!isSuccess) {
            finish(isSuccess,msg);
            return;
        }
        self.currentPage++;
        //遍历DataModel数组，转换为ViewModel数组
        for (FMPicsModel *dataModel in models) {
            FMPicLineViewModel *viewModel = [FMPicLineViewModel initWithDataModel:dataModel];
            [self.models addObject:viewModel];
        }
        
        //回调给调用方
        finish(isSuccess,nil);
    }];
}

- (NSMutableArray *)models {
    if (!_models) {
        _models = [NSMutableArray array];
    }
    return _models;
}

- (NSArray *)datas {
    return [self.models copy];
}

@end
