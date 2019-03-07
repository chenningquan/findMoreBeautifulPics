//
//	FMPicsModel.m
//
//	Create by 宁权 陈 on 7/3/2019
//	Copyright © 2019 宁权 陈. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

#import <UIKit/UIKit.h>
#import "FMLink.h"
#import "FMUrl.h"
#import "FMUser.h"

@interface FMPicsModel : NSObject

@property (nonatomic, strong) NSArray * categories;
@property (nonatomic, strong) NSString * color;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSArray * currentUserCollections;
@property (nonatomic, strong) NSObject * descriptionField;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, assign) BOOL likedByUser;
@property (nonatomic, assign) NSInteger likes;
@property (nonatomic, strong) FMLink * links;
@property (nonatomic, assign) BOOL sponsored;
@property (nonatomic, strong) NSObject * sponsoredBy;
@property (nonatomic, strong) NSObject * sponsoredImpressionsId;
@property (nonatomic, strong) NSString * updatedAt;
@property (nonatomic, strong) FMUrl * urls;
@property (nonatomic, strong) FMUser * user;
@property (nonatomic, assign) NSInteger width;

@end
