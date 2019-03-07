//
//  FMPicLineCell.m
//  FindMoreBeautifulPics
//
//  Created by 陈宁权 on 2019/3/7.
//  Copyright © 2019年 陈宁权. All rights reserved.
//

#import "FMPicLineCell.h"
#import "FMPicLineViewModel.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@interface FMPicLineCell()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *publishInfoLabel;

@end

@implementation FMPicLineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configSubViews];
        self.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)configSubViews {
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:backView];
    [backView addSubview:self.imgView];
    [backView addSubview:self.publishInfoLabel];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.leading.trailing.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-40);
    }];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top).offset(10);
        make.leading.equalTo(backView.mas_leading).offset(20);
        make.trailing.equalTo(backView.mas_trailing).offset(-20);
        make.bottom.equalTo(backView.mas_bottom).offset(-40);
    }];
    
    [self.publishInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(backView).offset(-10);
        make.leading.equalTo(backView).offset(20);
        make.trailing.equalTo(backView).offset(-20);
        make.height.offset(20);
    }];
}

- (void)refreshWithViewModel:(FMPicLineViewModel *)viewModel {
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:viewModel.previewImgUrl]];
    self.publishInfoLabel.text = viewModel.publishInfo;
}

#pragma mark - Getter & Setter
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
    }
    return _imgView;
}

- (UILabel *)publishInfoLabel {
    if (!_publishInfoLabel) {
        _publishInfoLabel = [UILabel new];
        _publishInfoLabel.textAlignment = NSTextAlignmentRight;
    }
    return _publishInfoLabel;
}


@end
