//
//  LocationInfo.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/15.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationInfo : NSObject
/**
 locationID,唯一标识 location
 */
@property (nonatomic,strong) NSNumber*  locationID;

/**
 location名称
 */
@property (nonatomic,strong) NSString* locationName;

/**
 location图标
 */
@property (nonatomic,strong) NSString* locationPicUrl;

/**
 是否是默认
 */
@property (nonatomic) BOOL isDefault;

/**
 Hub 列表(HubInfo 对象)
 */
@property(nonatomic,strong) NSMutableArray* hubList;
@end
