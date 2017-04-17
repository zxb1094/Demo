//
//  TimerInfo.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 定时器控制信息类型 -
typedef NS_OPTIONS(NSInteger, Timer_Ctrl_Type)
{
    Timer_Ctrl_Type_Scene        = 0x00,//场景定时器
    Timer_Ctrl_Type_Device       = 0x01,//设备定时器
    Timer_Ctrl_Type_All          = 0x02,//所有定时器
};

#pragma mark 定时器循环类型
typedef NS_OPTIONS(NSInteger, Timer_Cycle_Type)
{
    Timer_Cycle_Type_INVALID       = 0x00,//未知类型
    Timer_Cycle_Type_Dally,
    Timer_Cycle_Type_Weekly,
    Timer_Cycle_Type_Monthly,
    Timer_Cycle_Type_Never,
};

@class STRDeviceInfo;
@class SceneInfo;

#pragma mark - 定时器星期循环封装 -
@interface TimerWeekCycle : NSObject
/**
 周一重复标识
 */
@property (nonatomic) BOOL isMondayRepeat;

/**
 周二重复标识
 */
@property (nonatomic) BOOL isTuesdayRepeat;

/**
 周三重复标识
 */
@property (nonatomic) BOOL isWensdayRepeat;

/**
 周四重复标识
 */
@property (nonatomic) BOOL isThursdayRepeat;

/**
 周五重复标识
 */
@property (nonatomic) BOOL isFridayRepeat;

/**
 周六重复标识
 */
@property (nonatomic) BOOL isSaturdayRepeat;

/**
 周日重复标识
 */
@property (nonatomic) BOOL isSundayRepeat;

@end


#pragma mark - 定时器控制信息封装 -
@interface TimerDataInfo : NSObject
/**
 控制信息类型
 */
@property (nonatomic) Timer_Ctrl_Type infoType;

/**
 控制信息是否存在 YES 有效  NO 无效
 */
@property (nonatomic) BOOL isValid;

/**
 场景信息
 */
@property (nonatomic,strong) SceneInfo* sceneInfo;

/**
 设备信息
 */
@property (nonatomic,strong) STRDeviceInfo* deviceInfo;

@end

@interface TimerInfo : NSObject
/**
 定时器ID,定时器唯一标识
 */
@property (nonatomic,strong) NSData* timerID;

/**
 定时器名称
 */
@property (nonatomic,strong) NSString* timerName;

/**
 定时器图标
 */
@property (nonatomic) NSInteger timerIcon;

/**
 定时器开启标识
 */
@property (nonatomic) BOOL isStart;

/**
 定时器时间
 */
@property (nonatomic,strong) NSDateComponents* timerTimeValue;

/**
 定时器循环类型
 */
@property (nonatomic)Timer_Cycle_Type timerCycleType;

/**
 定时器星期循环
 */
@property (nonatomic,strong) TimerWeekCycle* timerWeekCyle;

/**
 定时器按每月指定日期循环(如果这个天存在，则timerMonthCycle中保存了以对应日期作为key的信息)
 比如：1号指定为循环日，[timerMonthCycle objectForKey@"1"]不为空.实际处理时可以获取
 timerMonthCycle的AllKeysL来获取已指定那些日期为循环日
 */
@property (nonatomic,strong) NSMutableDictionary* timerMonthCycle;

/**
 定时控制信息
 */
@property (nonatomic,strong) TimerDataInfo* timerData;

/**
 排序值
 */
@property (nonatomic)NSInteger  sortNum;
@end
