//
//  SceneInfo.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark 场景当前模式
typedef NS_OPTIONS(NSInteger, Scene_Mode_Type)
{
    Scene_Mode_Type_CustomUSTOM     = 0x00,//自定义
    Scene_Mode_Type_All_On          = 0x01,//全开
    Scene_Mode_Type_All_Off          = 0x02,//全关
};

#pragma mark - 场景封装 -
@interface SceneInfo : NSObject

/**
 场景ID,唯一标识场景
 */
@property (nonatomic,strong) NSData* sceneID;

/**
 场景名称
 */
@property (nonatomic,strong) NSString* sceneName;

/**
 场景图标
 */
@property (nonatomic) NSInteger sceneIcon;

/**
 标识是否已经收藏
 */
@property (nonatomic) BOOL isFavorite;

/**
 设备个数
 */
@property (nonatomic) NSInteger deviceCount;

/**
 场景排序值
 */
@property (nonatomic) NSInteger sortNum;

/**
 标识场景模式
 **/
@property (nonatomic)NSInteger sceneMode;
@end
