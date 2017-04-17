//
//  RoomInfo.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoomInfo : NSObject
/**
 房间ID,房间唯一属性
 */
@property (nonatomic) NSData* roomID;

/**
 房间所在Hub Id列表
 */
@property(nonatomic,strong)NSMutableArray* hubIdList;

/**
 房间名称
 */
@property (nonatomic,strong) NSString* roomName;

/**
 房间图标
 */
@property (nonatomic)NSInteger roomIcon;

/**
 房间排序值
 */
@property (nonatomic) NSInteger sortNum;

/**
 房间设备总数
 */
@property (nonatomic)NSInteger deviceCount;

@end
