//
//  FMPicLineCell.h
//  FindMoreBeautifulPics
//
//  Created by 陈宁权 on 2019/3/7.
//  Copyright © 2019年 陈宁权. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FMPicLineViewModel;

@interface FMPicLineCell : UITableViewCell

- (void)refreshWithViewModel:(FMPicLineViewModel *)viewModel;

@end

