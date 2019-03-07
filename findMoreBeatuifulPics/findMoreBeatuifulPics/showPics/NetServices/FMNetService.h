//
//  FMNetService.h
//  FindMoreBeautifulPics
//
//  Created by 陈宁权 on 2019/3/7.
//  Copyright © 2019年 陈宁权. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMPicsModel;
NS_ASSUME_NONNULL_BEGIN

@interface FMNetService : NSObject

/**
 根据页数获取图片Model数组

 @param page 页数
 @param finishBlock 回调block
 */
+ (void)getPicModelsWithPage:(NSInteger)page finished:(void (^)(BOOL isSuccess, NSArray <FMPicsModel *> *models, NSString *msg))finishBlock;

@end

NS_ASSUME_NONNULL_END
