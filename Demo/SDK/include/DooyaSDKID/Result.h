//
//  Result.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataType.h"

#pragma mark - 页面回调状态 -
typedef NS_OPTIONS(NSInteger, UICALLBACKSTATE)
{
    CALL_BACK_NORMAL                            = 0,
    CALL_BACK_NET_DIS_CONNCET                   ,//当前移动设备未连接网络
    CALL_BACK_SYSTEM_DIS_CONNECT                ,//与主机断开链接
    CALL_BACK_SYSTEM_RECONNECTING               ,//正在重连主机
    CALL_BACK_AUTHENTIC_FAILED_INVALID_USER     ,//用户验证失败，无效的用户
    CALL_BACK_AUTHENTIC_SUCCESS                 ,//用户验证成功
    CALL_BACK_AUTHENTIC_FAILED                  ,//用户验证失败(用户名或者密码错误)
    CALL_BACK_LOGIN_SUCCESS                     ,//登陆成功
    CALL_BACK_LOGIN_FAIL                        ,//登陆失败
    CALL_BACK_DEVICE_DEL_UPDATE                 ,//设备删除更新
    CALL_BACK_DEVICE_ADD_UPDATE                 ,//设备添加更新
    CALL_BACK_DEVICE_MOD_UPDATE                 ,//设备修改更新
    CALL_BACK_SCENE_DEL_UPDATE                  ,//场景删除跟新
    CALL_BACK_SCENE_ADD_UPDATE                  ,//场景添加更新
    CALL_BACK_SCENE_MOD_UPDATE                  ,//场景修改更新
    CALL_BACK_TIMER_DEL_UPDATE                  ,//定时器删除更新
    CALL_BACK_TIMER_ADD_UPDATE                  ,//定时器添加更新
    CALL_BACK_TIMER_MOD_UPDATE                  ,//定时器修改更新
    CALL_BACK_ROOM_DEL_UPDATE                   ,//房间删除更新
    CALL_BACK_ROOM_ADD_UPDATE                   ,//房间添加更新
    CALL_BACK_ROOM_MOD_UPDATE                   ,//房间修改更新
    CALL_BACK_USER_DEL_UPDATE                   ,//用户删除更新
    CALL_BACK_USER_ADD_UPDATE                   ,//用户添加更新
    CALL_BACK_USER_MOD_UPDATE                   ,//用户修改更新
    CALL_BACK_RECONNECT_SUCCESS                 ,//后台重连成功
    CALL_BACK_FAVORITE_DEVICE_DEL_UPDATE        ,//收藏夹设备删除更新
    CALL_BACK_FAVORITE_DEVICE_ADD_UPDATE        ,//收藏夹设备添加更新
    CALL_BACK_FAVORITE_SCENE_DEL_UPDATE         ,//收藏夹场景删除更新
    CALL_BACK_FAVORITE_SCENE_ADD_UPDATE         ,//收藏夹场景删除更新
    CALL_BACK_SYSTEM_TIME_ACK                   ,//系统时间请求响应
    CALL_BACK_SCENE_DATA_REQ_ACK                ,//场景设备数据请求应答
    CALL_BACK_HOST_GATEWAY_ACK                  ,//主机网关数据请求应答
    CALL_BACK_SYSTEM_TIME_UPDATE                ,//主机时间更新
    CALL_BACK_HUB_ADD_UPDATE                    ,//Hub添加更新
    CALL_BACK_HUB_MOD_UPDATE                    ,//Hub修改更新
    CALL_BACK_HUB_DEL_UPDATE                    ,//Hub删除更新
    CALL_BACK_DEVICE_PARA_ACK                   ,//设备参数请求应答
    CALL_BACK_GETTING_DATA                      ,//获取数据
    CALL_BACK_GETTING_DATA_FAIL                 ,//获取数据失败
    CALL_BACK_GETTING_DATA_SUCCESS              ,//获取数据成功
    CALL_BACK_EXE_ERROR                         ,//执行错误
    CALL_BACK_USER_LIST_INFO_UPDATE             ,//用户列表更新
    CALL_BACK_DEVICE_READ_PARA_ACK              ,//设备参数读取请求应答
};

@interface Result : NSObject
/**
 回调状态
 */
@property(nonatomic) UICALLBACKSTATE state;

/**
 设备ID
 */
@property(nonatomic,strong) NSData* deviceID;

/**
 场景ID
 */

@property(nonatomic,strong) NSData* sceneID;

/**
 定时器ID
 */
@property(nonatomic,strong) NSData* timerID;

/**
 房间ID
 */
@property(nonatomic) NSData* roomID;

/**
 用户名称
 */
@property(nonatomic,strong) NSString* userName;

/**
 执行错误码
 */
@property(nonatomic) NSInteger exeErrorCode;

/**
 设备
 */
@property(nonatomic, strong)DeviceInfo* Device;

/**
 设备参数
 */
@property(nonatomic, strong)BlindParaInfo* DevicePara;

/**
 房间
 */
@property(nonatomic, strong)RoomInfo* Room;

/**
 定时器
 */
@property(nonatomic, strong)TimerInfo* Timer;

/**
 场景
 */
@property(nonatomic, strong)SceneInfo* Scene;

/**
 主机
 */
@property(nonatomic, strong)HubInfo* host;

/**
 系统时间
 */
@property(nonatomic, strong)NSDateComponents* SystemTime;

@property(nonatomic, strong)NSMutableArray* DataArray;

@property(nonatomic, strong)id object;

@end
