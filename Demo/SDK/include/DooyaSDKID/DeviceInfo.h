//
//  DeviceInfo.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 设备类型枚举 -
typedef NS_OPTIONS(NSInteger, Device_Type)
{
    UI_Device_Type_Invalid                    = 0x0000,//无效设备类型
    
    //无行程电机(双向)
    SHCP_DEVICE_ELECTRIC_CURTAIN              = 0x0201,//电动窗帘(开合帘)
    SHCP_DEVICE_ELECTRIC_SHUTTER              = 0x0202,//电动卷帘
    SHCP_DEVICE_ELECTRIC_ALUMINUM_BLIND       = 0x0203,//电动铝百叶
    SHCP_DEVICE_ELECTRIC_WOOD_BLIND           = 0x0204,//电动木百叶
    SHCP_DEVICE_ELECTRIC_HOLLOWALUMINUM_BLIND = 0x0205,//电动中空铝百叶
    SHCP_DEVICE_ELECTRIC_SHUTTER_CURTAIN      = 0x0206,//电动百折帘
    SHCP_DEVICE_ELECTRIC_HONEYCOMB_CURTAIN    = 0x0207,//电动蜂巢帘
    SHCP_DEVICE_ELECTRIC_DAY_LIGHT_CURTAIN    = 0x0208,//电动日夜帘
    SHCP_DEVICE_ELECTRIC_SHANGRI_LA_CURTAIN   = 0x0209,//电动香格里拉帘
    SHCP_DEVICE_ELECTRIC_SOFT_CURTAIN         = 0x020a,//电动柔纱帘
    SHCP_DEVICE_ELECTRIC_ROME_CURTAIN         = 0x020b,//电动罗马帘
    SHCP_DEVICE_ELECTRIC_VERTICAL_BLIND       = 0x020c,//电动垂直帘
    SHCP_DEVICE_ELECTRIC_CANOPY_CURTAIN       = 0x020d,//电动天蓬帘
    SHCP_DEVICE_ELECTRIC_SHUTTER_WINDOW       = 0x020e,//电动卷帘窗
    SHCP_DEVICE_ELECTRIC_SHUTTER_DOOR         = 0x020f,//电动卷帘门
    SHCP_DEVICE_OUTSIDE_ELECTRIC_ALUMINUM_BLIND = 0x0210,//室外电动铝百叶
    SHCP_DEVICE_ELECTRIC_LOUVER_CURTAIN       = 0x0211,//电动遮阳蓬
    SHCP_DEVICE_OUTSIDE_ELECTRIC_SHUTTER      = 0x0212,//室外电动卷帘
    SHCP_DEVICE_OUTSIDE_ELECTRIC_CANOPY_CURTAIN  = 0x0213,//室外电动天蓬帘
    SHCP_DEVICE_OPEN_WINDOW_CURTAIN           = 0x0214,//电动开窗机
    SHCP_DEVICE_ELECTRIC_FLIP_BLIND           = 0x0215,//电动百叶翻板
    SHCP_DEVICE_ELECTRIC_PROJECTION_SCREEN    = 0x0216,//电动投影幕
    SHCP_DEVICE_ELECTRIC_CLOTHES_HANGER       = 0x0217,//电动晾衣架
    
    
    //有行程电机(双向)
    SHCP_STROKE_DEVICE_ELECTRIC_CURTAIN              = 0x0230,//电动窗帘(开合帘)
    SHCP_STROKE_DEVICE_ELECTRIC_SHUTTER              = 0x0231,//电动卷帘
    SHCP_STROKE_DEVICE_ELECTRIC_ALUMINUM_BLIND       = 0x0232,//电动铝百叶
    SHCP_STROKE_DEVICE_ELECTRIC_WOOD_BLIND           = 0x0233,//电动木百叶
    SHCP_STROKE_DEVICE_ELECTRIC_HOLLOWALUMINUM_BLIND = 0x0234,//电动中空铝百叶
    SHCP_STROKE_DEVICE_ELECTRIC_SHUTTER_CURTAIN      = 0x0235,//电动百折帘
    SHCP_STROKE_DEVICE_ELECTRIC_HONEYCOMB_CURTAIN    = 0x0236,//电动蜂巢帘
    SHCP_STROKE_DEVICE_ELECTRIC_DAY_LIGHT_CURTAIN    = 0x0237,//电动日夜帘
    SHCP_STROKE_DEVICE_ELECTRIC_SHANGRI_LA_CURTAIN   = 0x0238,//电动香格里拉帘
    SHCP_STROKE_DEVICE_ELECTRIC_SOFT_CURTAIN         = 0x0239,//电动柔纱帘
    SHCP_STROKE_DEVICE_ELECTRIC_ROME_CURTAIN         = 0x023a,//电动罗马帘
    SHCP_STROKE_DEVICE_ELECTRIC_VERTICAL_BLIND       = 0x023b,//电动垂直帘
    SHCP_STROKE_DEVICE_ELECTRIC_CANOPY_CURTAIN       = 0x023c,//电动天蓬帘
    SHCP_STROKE_DEVICE_ELECTRIC_SHUTTER_WINDOW       = 0x023d,//电动卷帘窗
    SHCP_STROKE_DEVICE_ELECTRIC_SHUTTER_DOOR         = 0x023e,//电动卷帘门
    SHCP_STROKE_DEVICE_OUTSIDE_ELECTRIC_ALUMINUM_BLIND = 0x023f,//室外电动铝百叶
    SHCP_STROKE_DEVICE_ELECTRIC_LOUVER_CURTAIN       = 0x0240,//电动遮阳蓬
    SHCP_STROKE_DEVICE_OUTSIDE_ELECTRIC_SHUTTER      = 0x0241,//室外电动卷帘
    SHCP_STROKE_DEVICE_OUTSIDE_ELECTRIC_CANOPY_CURTAIN  = 0x0242,//室外电动天蓬帘
    SHCP_STROKE_DEVICE_OPEN_WINDOW_CURTAIN           = 0x0243,//电动开窗机
    SHCP_STROKE_DEVICE_ELECTRIC_FLIP_BLIND           = 0x0244,//电动百叶翻板
    SHCP_STROKE_DEVICE_ELECTRIC_PROJECTION_SCREEN    = 0x0245,//电动投影幕
    SHCP_STROKE_DEVICE_ELECTRIC_CLOTHES_HANGER       = 0x0246,//电动晾衣架
    
    
    //无行程电机(单向)
    SHCP_SINGLE_DEVICE_ELECTRIC_CURTAIN              = 0x0301,//电动窗帘(开合帘)
    SHCP_SINGLE_DEVICE_ELECTRIC_SHUTTER              = 0x0302,//电动卷帘
    SHCP_SINGLE_DEVICE_ELECTRIC_ALUMINUM_BLIND       = 0x0303,//电动铝百叶
    SHCP_SINGLE_DEVICE_ELECTRIC_WOOD_BLIND           = 0x0304,//电动木百叶
    SHCP_SINGLE_DEVICE_ELECTRIC_HOLLOWALUMINUM_BLIND = 0x0305,//电动中空铝百叶
    SHCP_SINGLE_DEVICE_ELECTRIC_SHUTTER_CURTAIN      = 0x0306,//电动百折帘
    SHCP_SINGLE_DEVICE_ELECTRIC_HONEYCOMB_CURTAIN    = 0x0307,//电动蜂巢帘
    SHCP_SINGLE_DEVICE_ELECTRIC_DAY_LIGHT_CURTAIN    = 0x0308,//电动日夜帘
    SHCP_SINGLE_DEVICE_ELECTRIC_SHANGRI_LA_CURTAIN   = 0x0309,//电动香格里拉帘
    SHCP_SINGLE_DEVICE_ELECTRIC_SOFT_CURTAIN         = 0x030a,//电动柔纱帘
    SHCP_SINGLE_DEVICE_ELECTRIC_ROME_CURTAIN         = 0x030b,//电动罗马帘
    SHCP_SINGLE_DEVICE_ELECTRIC_VERTICAL_BLIND       = 0x030c,//电动垂直帘
    SHCP_SINGLE_DEVICE_ELECTRIC_CANOPY_CURTAIN       = 0x030d,//电动天蓬帘
    SHCP_SINGLE_DEVICE_ELECTRIC_SHUTTER_WINDOW       = 0x030e,//电动卷帘窗
    SHCP_SINGLE_DEVICE_ELECTRIC_SHUTTER_DOOR         = 0x030f,//电动卷帘门
    SHCP_SINGLE_DEVICE_OUTSIDE_ELECTRIC_ALUMINUM_BLIND = 0x0310,//室外电动铝百叶
    SHCP_SINGLE_DEVICE_ELECTRIC_LOUVER_CURTAIN       = 0x0311,//电动遮阳蓬
    SHCP_SINGLE_DEVICE_OUTSIDE_ELECTRIC_SHUTTER      = 0x0312,//室外电动卷帘
    SHCP_SINGLE_DEVICE_OUTSIDE_ELECTRIC_CANOPY_CURTAIN  = 0x0313,//室外电动天蓬帘
    SHCP_SINGLE_DEVICE_OPEN_WINDOW_CURTAIN           = 0x0314,//电动开窗机
    SHCP_SINGLE_DEVICE_ELECTRIC_FLIP_BLIND           = 0x0315,//电动百叶翻板
    SHCP_SINGLE_DEVICE_ELECTRIC_PROJECTION_SCREEN    = 0x0316,//电动投影幕
    SHCP_SINGLE_DEVICE_ELECTRIC_CLOTHES_HANGER       = 0x0317,//电动晾衣架
    
};

#pragma mark - 设备控制命令

typedef NS_OPTIONS(NSInteger, Device_Cmd){
    Device_Cmd_Blind_Open                      = 0x10,//窗帘开
    Device_Cmd_Blind_Stop                      = 0x11,//窗帘停
    Device_Cmd_Blind_Close                     = 0x12,//窗帘关
    Device_Cmd_Blind_Auto_Set                  = 0x13,//自动行程设置
    Device_Cmd_Blind_Little_Up                 = 0x14,//向上点动
    Device_Cmd_Blind_Little_Down               = 0x15,//向下点动
    Device_Cmd_Blind_Run_Specific_Point        = 0x16,//运行第三行程点
    Device_Cmd_Blind_Point                     = 0x17,//窗帘指定行程运行
    Device_Cmd_Blind_Light                     = 0x18,//窗帘调光指定光度
    Device_Cmd_Blind_Point_Light               = 0x19,//窗帘调光、行程值同时控制
    Device_Cmd_Blind_Set_Upper_Point           = 0x21,//设定上行程点
    Device_Cmd_Blind_Set_Down_Point            = 0x22,//设定下行程点
    Device_Cmd_Blind_Edit_Upper_Point          = 0x23,//修改上行程点
    Device_Cmd_Blind_Edit_Down_Point           = 0x24,//修改下行程点
    Device_Cmd_Blind_Set_Specific_Point        = 0x25,//设定第三行程点
    Device_Cmd_Blind_Edit_Specific_Point       = 0x26,//修改第三行程点
    Device_Cmd_Blind_Cancel_Point              = 0x29,//取消行程
    Device_Cmd_Blind_Reversal                  = 0x2b,//换向
};


#pragma mark - 电机工作状态 -
typedef NS_OPTIONS(NSInteger, Blind_Work_Status)
{
    Blind_Work_Status_Standby         = 0x00,//电机处于待机状态
    Blind_Work_Status_Runing          = 0x01,//电机处于运行状态
    Blind_Work_Status_Sleep           = 0x02,//电机处于睡眠状态
    Blind_Work_Status_Deep_Sleep      = 0x03,//电机处于深度睡眠状态
    Blind_Work_Status_Trouble         = 0x04,//电机处于故障状态
    Blind_Work_Status_Reboot          = 0x05,//电机处于重启状态
    Blind_Work_Status_Code_Enable     = 0x06,//电机处于可对码状态
    Blind_Work_Status_Trim_Point      = 0x07,//电机处于微调行程状态
};

#pragma mark - 电机运行状态 -
typedef NS_OPTIONS(NSInteger, Blind_Run_Status)
{
    Blind_Run_Status_Stop                 = 0x00,//电机停止
    Blind_Run_Status_Up                   = 0x01,//电机上行
    Blind_Run_Status_Down                 = 0x02,//电机下行
    Blind_Run_Status_Little_Up            = 0x03,//电机点动上行
    Blind_Run_Status_Little_Down          = 0x04,//电机点动下行
    Blind_Run_Status_Arrive_Turn          = 0x05,//电机转动提示
    Blind_Run_Status_Arrive_Upper         = 0x06,//电机停在上行程点
    Blind_Run_Status_Arrive_Down          = 0x07,//电机停在下行程点
    Blind_Run_Status_Arrive_Favorite      = 0x08,//电机停在第三行程点
};

@class RoomInfo;
@class HubInfo;

#pragma mark - 设备封装 -
@interface DeviceInfo : NSObject

/**
 设备ID,设备唯一标识属性
 */
@property (nonatomic,strong) NSData* deviceID;

/**
 设备名称
 */
@property (nonatomic,strong) NSString* deviceName;

/**
 设备图标
 */
@property (nonatomic) NSInteger deviceIcon;

/**
 设备类型
 */
@property (nonatomic)Device_Type deviceType;

/**
 设备所属房间(如若房间不存在，这里置nil)
 */
@property (nonatomic) RoomInfo* deviceRoom;

/**
 设备状态,具体值含义参考开发文档
 */
@property (nonatomic,strong) NSNumber* deviceState;

/**
 设备状态数据
 */
@property (nonatomic,strong) NSData* deviceStateData;

/**
 设备配置数据,具体值含义参考开发文档
 */
@property (nonatomic,strong) NSData* deviceConfig;

/**
 标识是否已收藏
 */
@property (nonatomic) BOOL isFavorite;

/**
 标识是否在线
 */
@property (nonatomic) BOOL isOnline;

/**
 电机行程值
 */
@property (nonatomic) NSInteger deviceBlindStroke;

/**
 电机角度值
 */
@property (nonatomic) NSInteger deviceBlindAngle;

/**
 电机是否是锂电池电机
 */
@property (nonatomic) BOOL isBatteryBlind;

/**
 锂电池电机电量(仅限锂电池电机有效)
 */
@property (nonatomic,strong) NSNumber* deviceBatteryValue;

/**
 设备所在HUB
 */
@property(nonatomic,strong)HubInfo* deviceHub;

/**
 排序值
 */
@property (nonatomic) NSInteger sortNum;
@end


#pragma mark - 电机参数封装 -
@interface BlindParaInfo : NSObject
/**
 电机工作状态，起始地址0x02 读取字节数1
 */
@property(nonatomic)Blind_Work_Status blindWorkStatus;

/**
 是否已经设置过上行程点，起始地址0x02 读取字节数1
 */
@property(nonatomic)BOOL isSetUpperPoint;

/**
 是否已经设置过下行程点，起始地址0x02 读取字节数1
 */
@property(nonatomic)BOOL isSetDownPoint;

/**
 是否处于低功耗模式，起始地址0x02 读取字节数1
 */
@property(nonatomic)BOOL isLowPowerMode;

/**
 电机运行状态，起始地址0x03 读取字节数1
 */
@property(nonatomic)Blind_Run_Status blindRunStatus;

/**
 电机当前行程值，起始地址0x04 读取字节数1
 */
@property(nonatomic)NSInteger blindTravelValue;

/**
 电机当前角度值，起始地址0x05 读取字节数1
 */
@property(nonatomic)NSInteger blindAngleValue;

/**
 电机当前电压值，起始地址0x08 读取字节数2
 */
@property(nonatomic)float blindPowerValue;

/**
 电机速度档位，起始地址0x0A 读取字节数1
 */
@property(nonatomic)NSInteger blindSpeedLevel;

/**
 电机类型，起始地址0x10 读取字节数1
 */
@property(nonatomic)NSInteger blindType;
@end

