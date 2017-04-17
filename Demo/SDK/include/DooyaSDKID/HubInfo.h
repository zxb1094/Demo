//
//  HubInfo.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 HubWifiConfigureMode枚举，描述SDK支持的设备配置方式
*/
typedef NS_ENUM(NSInteger, HubWifiConfigureMode) {
    /*
     SoftAP配置模式
     */
    Hub_Wifi_SoftAP = 0,
    /*
     AirLink配置模式
     */
    Hub_Wifi_AirLink = 1,
};

@interface HubInfo : NSObject
/**
 主机地址,主机的唯一标识属性
 */
@property (nonatomic,strong) NSString* hubMac;

/**
 主机所在Location
 */
@property (nonatomic,strong) NSNumber* locationID;

/**
 主机所在Location名称
 */
@property (nonatomic,strong) NSString* locationName;

/**
 主机名称
 */
@property (nonatomic,strong) NSString* hubName;

/**
 主机版本
 */
@property (nonatomic,strong) NSString* hubVersion;

/**
 主机是否在线
 */
@property (nonatomic) BOOL isOnline;

/**
 主机图标
 */
@property (nonatomic) NSInteger hubIcon;

/**
 主机IP地址
 */
@property (nonatomic,strong) NSString* hubIP;

/**
 主机Did
 */
@property(nonatomic,strong) NSString* hubDid;

/**
 主机PassCode
 */
@property(nonatomic,strong) NSString* hubPassCode;

/**
 主机wifi软件版本
 */
@property (nonatomic,strong) NSString* hubWifiSoftVersion;

/**
 主机wifi硬件版本
 */
@property (nonatomic,strong) NSString* hubWifiHardVersion;

/**
 主机wifi SSID
 */
@property (nonatomic,strong) NSString* hubWifiSSID;

@end
