//
//  FMNetService.m
//  FindMoreBeautifulPics
//
//  Created by 陈宁权 on 2019/3/7.
//  Copyright © 2019年 陈宁权. All rights reserved.
//

#import "FMNetService.h"
#import "FMPicsModel.h"
#import <AFNetworking.h>
#import <YYModel.h>

static NSString *getPicsUrlStr = @"https://api.unsplash.com/photos/";

@implementation FMNetService

/**
 根据页数获取图片Model数组
 
 @param page 页数
 @param finishBlock 回调block
 */
+ (void)getPicModelsWithPage:(NSInteger)page finished:(void (^)(BOOL isSuccess, NSArray <FMPicsModel *> *models, NSString *msg))finishBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *params = @{
                             @"client_id":@"04848ae8a784bbb8f94e2b5b22c17ffa73d7e3b5e4dba0c50e4be0a6788e5db5",
                             @"page":[NSNumber numberWithInteger:page]
                             };
    [manager GET:getPicsUrlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *modelArr = [NSArray yy_modelArrayWithClass:[FMPicsModel class] json:responseObject];
        finishBlock(YES,modelArr,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finishBlock(NO,nil,error.localizedDescription);
    }];
}

@end
