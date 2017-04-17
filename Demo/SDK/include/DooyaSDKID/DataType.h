//
//  DataType.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#ifndef DataType_h
#define DataType_h
#import "DeviceInfo.h"
#import "RoomInfo.h"
#import "HubInfo.h"
#import "SceneInfo.h"
#import "STRDeviceInfo.h"
#import "TimerInfo.h"
#import "FavoriteInfo.h"
#import "LocationInfo.h"
#import "Result.h"
#import "RoomCtrlInfo.h"
#import "UserInfo.h"


//客户代号
typedef NS_OPTIONS(NSInteger, Custom_Code)
{
    Custom_Code_Common           = 0x00, //通用型
    Custom_Code_1126                   , //1126客户
    Custom_Code_538                    , //538客户
};


#endif /* DataType_h */
