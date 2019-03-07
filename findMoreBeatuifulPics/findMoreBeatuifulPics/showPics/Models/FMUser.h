//
//	FMUser.m
//
//	Create by 宁权 陈 on 7/3/2019
//	Copyright © 2019 宁权 陈. All rights reserved.
//	Model file Generated using: 
//	Vin.Favara's JSONExportV https://github.com/vivi7/JSONExport 
//	(forked from Ahmed-Ali's JSONExport)
//

#import <UIKit/UIKit.h>
#import "FMLink.h"
#import "FMProfileImage.h"

@interface FMUser : NSObject

@property (nonatomic, assign) BOOL acceptedTos;
@property (nonatomic, strong) NSString * bio;
@property (nonatomic, strong) NSString * firstName;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * instagramUsername;
@property (nonatomic, strong) NSString * lastName;
@property (nonatomic, strong) FMLink * links;
@property (nonatomic, strong) NSString * location;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * portfolioUrl;
@property (nonatomic, strong) FMProfileImage * profileImage;
@property (nonatomic, assign) NSInteger totalCollections;
@property (nonatomic, assign) NSInteger totalLikes;
@property (nonatomic, assign) NSInteger totalPhotos;
@property (nonatomic, strong) NSObject * twitterUsername;
@property (nonatomic, strong) NSString * updatedAt;
@property (nonatomic, strong) NSString * username;

@end
