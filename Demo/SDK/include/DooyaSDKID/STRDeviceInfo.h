//
//  STRDeviceInfo.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceInfo.h"

@class RoomInfo;

@interface STRDeviceInfo : NSObject
/**
 设备ID，唯一标识设备
 */
@property (nonatomic,strong) NSData* deviceID;

/**
 设备名称
 */
@property (nonatomic,strong) NSString* deviceName;

/**
 设备所属房间(如若房间不存在，这里置nil)
 */
@property (nonatomic) RoomInfo* deviceRoom;

/**
 设备类型
 */
@property (nonatomic) Device_Type deviceType;

/**
 设备图标
 */
@property (nonatomic) NSInteger deviceIcon;

/**
 设备命令集(存储的是对应命令的NSNumber对象)
 */
@property (nonatomic,strong) NSMutableArray* deviceCmd;

/**
 设备命令数据集(与cmd对应的命令数据，以NSData对象存储，如若该命令没有命令数据，NSData长度为0
 如若整个设备都没有命令数据，则deviceCmdData为nil)
 */
@property (nonatomic,strong) NSMutableArray* deviceCmdData;

/**
 设备是否有效
 */
@property (nonatomic) BOOL isValid;

/**
 设备延时时间(浮点行数据,精确到.1s)
 */
@property (nonatomic,strong) NSNumber* deviceDelayTime;

/**
 设备是否在线
 */
@property (nonatomic) BOOL isOnline;
@end
