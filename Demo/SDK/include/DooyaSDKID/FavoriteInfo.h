//
//  FavoriteInfo.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 收藏夹收藏信息类型 -
typedef NS_OPTIONS(NSInteger, UI_Favorite_Type)
{
    UI_Favorite_Type_Invalid            = 0x00,//未知类型
    UI_Favorite_Type_Device             = 0x01,//设备
    UI_Favorite_Type_Scene              = 0x02,//场景
};

@class DeviceInfo;
@class SceneInfo;
@interface FavoriteInfo : NSObject
/**
 收藏夹收藏标识
 */
@property (nonatomic) UI_Favorite_Type favoriteInfoType;

/**
 设备信息
 */
@property (nonatomic,strong) DeviceInfo* deviceInfo;

/**
 场景信息
 */
@property (nonatomic,strong) SceneInfo* sceneInfo;

/**
 排序值
 */
@property (nonatomic)NSInteger  sortNum;
@end
