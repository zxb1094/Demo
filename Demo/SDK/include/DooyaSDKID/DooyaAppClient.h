//
//  DooyaAppClient.h
//  DooyaSDKID
//
//  Created by apple  on 15/10/16.
//  Copyright (c) 2015年 dooya. All rights reserved.
//

#import "DataType.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OpenSdkErrorCode) {
    
    /*
     * 操作成功
     */
    Open_Sdk_Success                             = 0,
    
    /*
     * 参数错误
     */
    Open_Sdk_Para_Error                          = 80000,
    
    /*
     * 用户名或密码错误
     */
    Open_Sdk_User_Pass_Error                     = 90000,
    
    /*
     * 服务器错误
     */
    Open_Sdk_Cloud_Error                         = 90001,
};

@interface DooyaAppClient : NSObject

/**
 *  SDK请求单例
 *
 *  @return 单例
 *
 *  @since v2.0.0
 */
+ (DooyaAppClient *)SharedInstance;

/**
 *	@brief	SDK初始化
 *
 *  @para   customCode 客户代号
 *
 *	@since v2.0.0
 */
-(void)dooyaUISDKInitWithCustomCode:(NSInteger) customCode;

/**
 *	@brief	SDK注册推送DeviceToken
 *
 *	@para   deviceToken
 *
 *	@since v2.0.0
 */
-(void)dooyaUISDKRegisterDeviceToken:(NSString*)deviceToken;

/**
 *	@brief	界面注册回调
 *
 *	@para   Selector 回调方法
 *          Target 目标页面
 *
 *	@since v2.0.0
 */
-(void)dooyaUICallBackSelector:(SEL)selector
                      toTarget:(id)target;

/**
 *	@brief	登录接口
 *
 *	@para   UserName 用户名
 *          UserPass 密码
 *
 *	@return 正常返回TRUE 异常返回FALSE 登陆成功依回调状态为准
 *
 *	@since v2.0.0
 */
-(BOOL)dooyaUILoginSystem:(NSString*)UserName
                 PassWord:(NSString*)UserPass
               completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *	@brief	注销接口
 *
 *	@return 正常返回TRUE 异常返回FALSE
 *
 *	@since v2.0.0
 */
-(void)dooyaUILogOut;


#pragma mark 界面获取数据API
/**
 *	@brief	获取主机HUB列表
 *
 *  @para   locationId location id
 *
 *	@return 数组中存储HostInfo数据
 *
 *	@since v2.0.0
 */
-(NSMutableArray*)dooyaUIGetHostList:(NSInteger) locationId;

/**
 *	@brief	获取收藏夹列表
 *
 *  @para   infoType 收藏类型
 *
 *	@return 数组中存储DeviceInfo或SceneInfo数据
 *
 *	@since v2.0.0
 */
-(NSMutableArray*)dooyaUIGetFavoriteListWithFavoriteType:(UI_Favorite_Type) infoType;

/**
 *	@brief	获取房间列表
 *
 *	@return 数组中存储RoomInfo数据
 *
 *	@since v2.0.0
 */
-(NSMutableArray*)dooyaUIGetRoomList;

/**
 *	@brief	获取场景列表
 *
 *	@return 数组中存储SceneInfo数据
 *
 *	@since v2.0.0
 */
-(NSMutableArray*)dooyaUIGetSceneList;

/**
 *	@brief	获取定时器列表
 *
 *	@return 数组中存储TimerInfo数据
 *
 *	@since v2.0.0
 */
-(NSMutableArray*)dooyaUIGetTimerListWithTimerInfo:(Timer_Ctrl_Type) timerInfoType;

/**
 *	@brief	获取指定房间设备列表
 *
 *	@para   roomID 指定房间ID
 *          infoType 设备类型
 *
 *	@return 数组中存储RoomCtrlInfo数据
 *
 *	@since v2.0.0
 */
-(NSMutableArray*)dooyaUIGetRoomDeviceListWithRoomID:(NSData*) roomID
                                        RoomCtrlType:(Room_Ctrl_Type) infoType;

/**
 *	@brief	获取当前房屋所有设备列表
 *
 *	@para   指定房间ID
 *
 *	@return 数组中存储RoomCtrlInfo数据
 *
 *	@since v2.0.0
 */
-(NSMutableArray*)dooyaUIGetAllDeviceList;

/**
 *	@brief	获取指定房间信息
 *
 *	@para   房间ID
 *
 *	@return 存在返回RoomInfo数据,否则返回nil
 *
 *	@since v2.0.0
 */
-(RoomInfo*)dooyaUIGetRoomInfo:(NSData*) roomID;

/**
 *	@brief	获取指定设备信息
 *
 *	@para   设备ID
 *
 *	@return 存在返回DeviceInfo数据,否则返回nil
 *
 *	@since v2.0.0
 */
-(DeviceInfo*)dooyaUIGetDeviceInfo:(NSData*) deviceID;

/**
 *	@brief	获取指定时器信息
 *
 *  @para   定时器ID
 *
 *  @return 存在返回TimerInfo数据,否则返回nil
 *
 *  @since v2.0.0
 */
-(TimerInfo*)dooyaUIGetTimerInfo:(NSData*) timerID;

/**
 *	@brief	获取当前Hub信息
 *
 *	@since v2.0.0
 */
-(HubInfo*)dooyaUIGetHostInfo:(NSString*) hubMac;

/**
 *	@brief	获取系统时间值（系统时间值以CALL_BACK_SYSTEM_TIME_ACK回调状态告知）
 *
 *	@since v2.0.0
 */
-(void)dooyaUIGetSystemTime:(NSString*) hubMac;

/**
 *	@brief	获取当前主机版本
 *
 *	@since v2.0.0
 */
-(void)dooyaUIGetSystemHostVersion:(NSString*) hubMac;

/**
 *	@brief	获取当前WiFi SSID
 *
 *	@return 当前WiFi SSID
 *
 *	@since v2.0.0
 */
-(NSString*)dooyaUIGetCurrentWiFiSSID;

/**
 *	@brief	获取当前用户信息
 *
 *	@since v2.0.0
 */
-(UserInfo*)dooyaUIGetUserInfo;

/**
 *	@brief	获取当前用户子账户列表(仅限当前账户是master账号)
 *
 * 	@return UserInfo 对象数组
 *
 *	@since v2.0.0
 */
-(NSMutableArray*)dooyaUIGetSubAccountList;

/**
 *	@brief	获取当前location Id
 *
 *	@since v2.0.0
 */
-(NSInteger)dooyaUIGetCurrentLocationId;

/**
 *	@brief	当前账户是主账号
 *
 *	@since v2.0.0
 */
-(BOOL)dooyaUIIsMaster;

#pragma mark - Favorite API -
/**
 *	@brief	添加设备或者场景到收藏夹
 *
 *  @para   infoID   设备或者场景ID
 *          infoType 收藏类型
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIAddFavoriteWithInfoID:(NSData*) infoID
                               Type:(UI_Favorite_Type) infoType;

/**
 *	@brief	收藏夹删除设备或者场景
 *
 *  @para   infoID   设备或者场景ID
 *          infoType 收藏类型
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDelFavoriteWithInfoID:(NSData*) infoID
                               Type:(UI_Favorite_Type) infoType;

/**
 *	@brief	收藏夹排序
 *
 *  @para   favoriteList  收藏夹列表数据
 *          infoType      收藏夹类型
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUISortFavorite:(NSMutableArray*) favoriteList
              FavoriteType:(UI_Favorite_Type)infoType;


#pragma mark Room API
/**
 *	@brief	添加房间
 *
 *  @para   roomName 房间名称
 *          roomIcon 房间图标
 *          HubMac   主机地址
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIAddRoom:(NSString*) roomName
                 Icon:(NSInteger) roomIcon
               roomID:(NSData*) roomID;

/**
 *	@brief	编辑房间
 *
 *  @para   room 房间信息
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIEditRoom:(RoomInfo*) room;

/**
 *	@brief	删除房间
 *
 *  @para   roomID 房间描述符
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDelRoom:(NSData*) roomID;

/**
 *	@brief	房间执行
 *
 *  @para   roomID 房间描述符
 *          isAllOn Yes全开 No全关
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIExeRoomWithRoomID:(NSData*) roomID AllOn:(BOOL)isAllOn;

/**
 *	@brief	房间排序
 *
 *  @para   roomList  房间列表数据
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUISortRoom:(NSMutableArray*) roomList;

/**
 *	@brief	房间设备排序
 *
 *  @para   roomCtrlInfoList  房间控制信息列表数据
 *          roomID  房间ID
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUISortRoomDevice:(NSData*)roomID :(NSMutableArray*) roomCtrlInfoList;


#pragma mark Timer API
/**
 *	@brief	添加定时器
 *
 *  @para   timerInfo 定时器信息，定时器ID不用设置
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIAddTimer:(TimerInfo*) timerInfo;

/**
 *	@brief	编辑定时器
 *
 *  @para   timerInfo 定时器信息
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIEditTimer:(TimerInfo*) timerInfo;

/**
 *  @brief	删除定时器
 *
 *  @para   timerID 定时器ID
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDelTimer:(NSData*) timerID;

/**
 *  @brief	开关定时器
 *
 *  @para   timerInfo 定时器
 *
 *          enable NO关闭定时器，YES打开定时器
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIExeEnableTimer:(TimerInfo*) timerInfo
                       Eable:(BOOL) enable;
/**
 *  @brief	获取设备、场景关联定时器
 *
 *  @para   infoID 设备ID号或者场景描述符
 *
 *          isDevice 当前获取的是否设备
 *
 *  @return 定时器列表
 *
 *  @since v2.0.0
 */
-(NSMutableArray*)dooyaUIGetDeviceOrSceneTiemrList:(NSData*)infoID
                                          infoType:(BOOL)isDevice;



#pragma mark Scene API

/**
 *  @brief	执行场景
 *
 *  @para   sceneID 场景ID
 *          exeMode 场景执行模式  填0
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIExeSceneReq:(NSData*) sceneID
                     Mode:(NSInteger) exeMode;
/**
 *	@brief	删除场景
 *
 *  @para   sceneID 场景ID
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDelScene:(NSData*) sceneID;

/**
 *  @brief	添加场景
 *
 *  @para   sceneName 场景名称
 *          sceneIcon 场景图标
 *          sceneDevice 场景设备信息
 *          sceneMode 场景模式，用户设置模式、全关模式、全开模式
 *
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIAddScene:(NSString*) sceneName
                  Icon:(NSInteger) sceneIcon
                  Mode:(Scene_Mode_Type) sceneMode
                Device:(NSMutableArray*) sceneDevice;


/**
 *  @brief	编辑场景
 *
 *  @para   sceneID   场景ID
 *          sceneName 场景名称
 *          sceneIcon 场景图标
 *          sceneMode 场景模式
 *          sceneDevice 场景中的设备
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIEditScene:(NSData*) sceneID
                   Name:(NSString*) sceneName
                   Icon:(NSInteger) sceneIcon
                   Mode:(Scene_Mode_Type) sceneMode
                 Device:(NSMutableArray*) sceneDevice;

/**
 *	@brief	请求场景控制信息
 *
 *  @para   sceneID 场景ID
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIReqSceneCtrlInfo:(NSData*) sceneID;

/**
 *	@brief	场景排序
 *
 *  @para   sceneList  场景列表数据
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUISortScene:(NSMutableArray*) sceneList;


#pragma mark Device API
/**
 *  @brief	执行设备
 *
 *  @para   deviceID 设备ID
 *          deviceCmd 设备命令 不可缺省
 *          deviceCmddata 设备命令数据 根据实际设备做填充,缺省填nil
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDeviceExeWithDeviceID:(NSData*) deviceID
                                Cmd:(NSInteger) deviceCmd
                            CmdData:(NSData*)deviceCmddata;

/**
 *  @brief	执行设备(命令数据长度为1)
 *
 *  @para   deviceID 设备ID
 *          deviceCmd 设备命令 不可缺省
 *          deviceCmddata 设备命令数据为单字节
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDeviceOneByteDataExe:(NSData*) deviceID
                    Cmd:(NSInteger) deviceCmd
                CmdData:(unsigned char)deviceCmddata;

/**
 *  @brief	修改设备
 *
 *  @para   deviceID 设备ID
 *          deviceName 设备名称
 *          deviceIcon 设备图标
 *          deviceType 设备类型
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDeviceEdit:(NSData*) deviceID
                        Name:(NSString*) deviceName
                        Room:(NSData*) deviceRoom
                        Icon:(NSInteger) deviceIcon
                        Type:(NSInteger) deviceType;

/**
 *  @brief	修改设备名称
 *
 *  @para   deviceID 设备ID
 *          deviceName 设备名称
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDeviceEditName:(NSData*) deviceID
                        Name:(NSString*) deviceName;

/**
 *  @brief	修改设备图标
 *
 *  @para   deviceID 设备ID
 *          deviceIcon 设备图标
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDeviceEditIcon:(NSData*) deviceID
                        Icon:(NSInteger) deviceIcon;

/**
 *  @brief	修改设备房间
 *
 *  @para   deviceID 设备ID
 *          roomID   房间ID
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDeviceEditRoom:(NSData*) deviceID
                        room:(NSData*) roomID;

/**
 *  @brief	读取设备参数
 *
 *  @para   deviceID 设备ID
 *          paraCount 参数字节数
 *          fromAddr  参数起始地址
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDeviceReadPara:(NSData*) deviceID
                   ParaCount:(NSInteger) prarCount
                 FromAddress:(NSInteger) fromAddr;

/**
 *  @brief	添加设备
 *
 *  @para   roomID   房间ID
 *
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDeviceAdd:(NSData*) roomID
                   icon:(NSInteger) devIcon
                    hub:(NSString*) hubMacAddress
                   name:(NSString*) devName;

/**
 *  @brief	设备删除
 *
 *  @para   deviceID 设备ID
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIDeviceDel:(NSData*) deviceID;

/**
 *  @brief	设备排序
 *
 *  @para   deviceArray 设备序列数据
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUISortDevice:(NSMutableArray*) deviceArray;

/**
 *  @brief	设备收藏的第三行程点获取
 *
 *  @para   deviceID 设备ID
 *
 *  @return 0-100的百分比
 *
 *  @since v2.1.0
 */
-(NSInteger)dooyaUIDeviceReadFavoritePoint:(NSData*)deviceID;

/**
 *  @brief	设备收藏的第三行程点设置
 *
 *  @para   deviceID 设备ID
 *          favoritePoint 收藏的行程点
 *
 *  @return 操作结果
 *
 *  @since v2.1.0
 */
-(BOOL)dooyaUIDeviceSetFavoritePoint:(NSData*)deviceID
                       favoritePoint:(NSInteger)favoritePoint;



#pragma mark User
/**
 *  @brief	用户注册
 *
 *  @para   email 邮箱
 *          password 密码
 *
 *  @since v2.0.0
 */
-(void)dooyaUIRegister:(NSString*)email
              passWord:(NSString*)passWord
            completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief	用户密码修改
 *
 *  @para   email 邮箱
 *          oldPassWord 旧密码
 *          newPassWord 新密码
 *
 *  @since v2.0.0
 */
-(void)dooyaUIModifyPassWord:(NSString*)email
                 oldPassWord:(NSString*)oldPassWord
                 newPassWord:(NSString*)newPassWord
                  completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief	用户密码重置
 *
 *  @para   email 邮箱
 *
 *  @since v2.0.0
 */
-(void)dooyaUIResetPassWord:(NSString*)email
                 completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief	用户昵称设置
 *
 *  @para   name 用户昵称
 *
 *  @since v2.0.0
 */
-(void)dooyaUIUserNameEdit:(NSString*)name
                completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief	用户头像设置
 *
 *  @para   face 用户头像
 *
 *  @since v2.0.0
 */
-(void)dooyaUIUserFaceImage:(UIImage*)face
                 completion:(void (^)(NSError* error, id responseObject)) result;

#pragma mark Hub
/**
 *  @brief	主机发现添加
 *
 *  @para   SSID  无线网络 SSID
 *          password 无线网络密码
 *          configMode 配网方式
 *          timeout 超时时间，最短时间值30秒
 *
 *  @since v2.0.0
 */
-(void)dooyaUISettingDeviceWifiInfo:(NSString*)wifiSSID
                           password:(NSString*)wifiPassword
                         configMode:(HubWifiConfigureMode)wifiMode
                            timeOut:(int)timeout
                         completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief	绑定Hub到当前账户下
 *
 *  @para   macAddress 设备Mac地址
 *          deviceName 设备名称
 *          locationID location ID
 *
 *  @since v2.0.0
 */
-(void)dooyaUIBindHubToCurrentAccount:(NSInteger) locationID
                           macAddress:(NSString*) macAddress
                                 name:(NSString*) deviceName
                              completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief	修改主机名称
 *
 *  @para   hubMac  Hub Mac地址
 *          deviceName 设备名称
 *
 *  @since v2.0.0
 */
-(void)dooyaUIEditHubNameWithLocationID:(NSInteger) locationID
                                 hubMac:(NSString*) hubMac
                                   name:(NSString*) deviceName
                             completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief	解绑设备
 *
 *  @para   hubDid  did
 *          hubMac  hub mac地址
 *          locationID location id号
 *
 *  @since v2.0.0
 */
-(void)dooyaUIUnBindDeviceWithLocationID:(NSInteger) locationID
                                  hubMac:(NSString*) hubMac
                                  hubDid:(NSString*) hubDid
                              completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief	添加Location
 *
 *  @para   name  location名称
 *          locationPic  location图像数据
 *
 *  @since v2.0.0
 */
-(void)dooyaUIAddLocationWithName:(NSString*) name
                     LocationPic:(UIImage*) locationPic
                      completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief	修改Location
 *
 *  @para   name  location名称
 *          locationPic  location图像数据
 *          locationID location ID号
 *
 *  @since v2.0.0
 */
-(void)dooyaUIEditLocationWithLocationId:(NSInteger) locationID
                                    Name:(NSString*) name
                             LocationPic:(UIImage*) locationPic
                              completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief	删除位置数据
 *
 *  @para   locationId location id号
 *
 *  @since v2.0.0
 */
-(void)dooyaUIDeleteLocationWithId:(NSInteger) locationId
                        completion:(void (^)(NSError* error, id responseObject)) result;

/**
 *  @brief 设置当前界面显示的location
 *
 *  @para   locationID
 *
 *  @since v2.1.0
 */
-(void)dooyaUISetCurrentLocation:(NSInteger)locationID;


#pragma mark SystemTime
/**
 *  @brief	主机系统时间设置
 *
 *  @para   systeTime 设置时间(年月日时分秒)(回调CALL_BACK_SYSTEM_TIME_UPDATE)
 *
 *  @return 数据合法返回TRUE, 非法返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIHostSystemTimeSet:(NSDateComponents*) systeTime :(NSString*)hostMac;


#pragma mark 获取本地缓存信息

/**
 *  @brief	获取上一次成功登陆标识
 *
 *  @return 上次登陆返回TRUE,否则返回FALSE
 *
 *  @since v2.0.0
 */
-(BOOL)dooyaUIGetLastLoginFlag;

/**
 *  @brief	获取上一次成功登陆的用户名
 *
 *  @return 用户名
 *
 *  @since v2.0.0
 */
-(NSString*)dooyaUIGetLastLoginUserName;

/**
 *  @brief	获取上一次成功登陆的用户密码
 *
 *  @return 用户密码
 *
 *  @since v2.0.0
 */
-(NSString*)dooyaUIGetLastLoginUserPassword;

@end
