//
//  RoomCtrlInfo.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark 房间控制信息类型
typedef NS_OPTIONS(NSInteger, Room_Ctrl_Type)
{
    Room_Ctrl_Type_Invalid       = 0x00, //未知类型
    Room_Ctrl_Type_Light         = 0x01, //房间灯光设备
    Room_Ctrl_Type_Blind         = 0x01 << 1,//房间电机设备
    Room_Ctrl_Type_All_Device    = Room_Ctrl_Type_Light | Room_Ctrl_Type_Blind,//房间类所有设备
};

@class DeviceInfo;
@interface RoomCtrlInfo : NSObject
/**
 控制信息标识
 */
@property (nonatomic) Room_Ctrl_Type roomInfoType;

/**
 设备信息
 */
@property (nonatomic,strong) DeviceInfo* deviceInfo;

/**
 排序值
 */
@property (nonatomic)NSInteger  sortNum;
@end
