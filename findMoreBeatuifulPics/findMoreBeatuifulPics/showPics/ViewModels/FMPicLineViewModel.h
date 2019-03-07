//
//  FMPicLineViewModel.h
//  FindMoreBeautifulPics
//
//  Created by 陈宁权 on 2019/3/7.
//  Copyright © 2019年 陈宁权. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMPicsModel;

@interface FMPicLineViewModel : NSObject

/**
 预览图Url
 */
@property (nonatomic, copy) NSString *previewImgUrl;

/**
 原图Url
 */
@property (nonatomic, copy) NSString *originalImgUrl;

/**
 图片的发布信息
 */
@property (nonatomic, copy) NSString *publishInfo;

/**
 cell的高度
 */
@property (nonatomic, assign) NSInteger cellHeight;


/**
 通过dataModel初始化ViewModel

 @param dataModel 数据Model
 */
+ (instancetype)initWithDataModel:(FMPicsModel *)dataModel;

@end
