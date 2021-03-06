//
//  FMMainViewController.m
//  FindMoreBeautifulPics
//
//  Created by 陈宁权 on 2019/3/7.
//  Copyright © 2019年 陈宁权. All rights reserved.
//

#import "FMMainViewController.h"
#import "FMMainViewModel.h"
#import "FMPicLineCell.h"
#import <MJRefresh.h>
#import "HZPhotoBrowser.h"
#import <SVProgressHUD.h>

@interface FMMainViewController ()<UITableViewDelegate,UITableViewDataSource>

/**
 tableView
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 viewModel
 */
@property (nonatomic, strong) FMMainViewModel *viewModel;

@end

@implementation FMMainViewController

#pragma mark - LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configSubViews];
    [self configHUD];
    [self.tableView.mj_header beginRefreshing];
}


#pragma mark - Init
- (void)configSubViews {
    self.navigationItem.title = @"发现更多美图";
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.tableView];
}

- (void)configHUD {
    [SVProgressHUD setBackgroundColor:[UIColor grayColor]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD setMaximumDismissTimeInterval:1];
}

#pragma mark - Actions
- (void)downRefresh {
    [self.viewModel downRefreshWithFinished:^(BOOL isSuccess, NSString * _Nonnull msg) {
        [self.tableView.mj_header endRefreshing];
        if (isSuccess) {
            [self.tableView reloadData];
        } else {
            [SVProgressHUD showErrorWithStatus:msg];
        }
        
    }];
}

- (void)upRefresh {
    [self.viewModel upRefreshWithFinished:^(BOOL isSuccess, NSString * _Nonnull msg) {
        [self.tableView.mj_footer endRefreshing];
        if (isSuccess) {
            [self.tableView reloadData];
        } else {
            [SVProgressHUD showErrorWithStatus:msg];
        }
        
    }];
}

#pragma mark - Private Methods


#pragma mark - Delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FMPicLineViewModel *cellModel = self.viewModel.datas[indexPath.row];
    return cellModel.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellId = @"FMPicLineCell";
    FMPicLineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[FMPicLineCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell refreshWithViewModel:self.viewModel.datas[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FMPicLineViewModel *cellModel = self.viewModel.datas[indexPath.row];
    HZPhotoBrowser *browser = [[HZPhotoBrowser alloc] init];
    browser.isFullWidthForLandScape = YES;
    browser.isNeedLandscape = YES;
    browser.imageArray = @[cellModel.previewImgUrl];
    browser.isNeedSave = NO;
    [browser show];
}

#pragma mark - Getter & Setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefresh)];
        _tableView.mj_header.automaticallyChangeAlpha = YES;
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefresh)];
        _tableView.mj_footer.automaticallyHidden = YES;
        if (@available(iOS 11.0, *)) {
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.contentInsetAdjustmentBehavior= UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
}

- (FMMainViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [FMMainViewModel new];
    }
    return _viewModel;
}

@end
