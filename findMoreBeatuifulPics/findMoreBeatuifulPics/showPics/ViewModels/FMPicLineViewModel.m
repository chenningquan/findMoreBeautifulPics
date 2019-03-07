//
//  FMPicLineViewModel.m
//  FindMoreBeautifulPics
//
//  Created by 陈宁权 on 2019/3/7.
//  Copyright © 2019年 陈宁权. All rights reserved.
//

#import "FMPicLineViewModel.h"
#import "FMPicsModel.h"

@implementation FMPicLineViewModel

/**
 通过dataModel初始化ViewModel
 
 @param dataModel 数据Model
 */
+ (instancetype)initWithDataModel:(FMPicsModel *)dataModel {
    FMPicLineViewModel *viewModel = [FMPicLineViewModel new];
    viewModel.previewImgUrl = dataModel.urls.small;
    viewModel.originalImgUrl = dataModel.urls.raw;
    viewModel.publishInfo = [NSString stringWithFormat:@"%@ ·  %@",dataModel.user.name,dataModel.user.location ?: @"Secrecy"];
    //对图片的高度进行等比缩放，计算出显示的高度
    NSInteger oriHeight = dataModel.height;
    NSInteger oriWidth = dataModel.width;
    NSInteger fixHeight = oriHeight;
    NSInteger fixWidth = oriWidth;
    if (oriWidth > ([UIScreen mainScreen].bounds.size.width * 0.7)) {
        fixWidth = [UIScreen mainScreen].bounds.size.width * 0.7;
        fixHeight = fixWidth * oriHeight / oriWidth;
    }
    //cell的总高度等于图片view的高度加上底部发布信息栏的高度
    viewModel.cellHeight = fixHeight + 90;
    return viewModel;
}

@end
