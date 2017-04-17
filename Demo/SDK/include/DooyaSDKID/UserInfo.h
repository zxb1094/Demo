//
//  UserInfo.h
//  DooyaSDKID
//
//  Created by moorgen on 2016/12/16.
//  Copyright © 2016年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

/**
 email
 */
@property(nonatomic,strong)NSString* email;

/**
 手机号
 */
@property(nonatomic,strong)NSString* phoneNo;

/**
 昵称
 */
@property(nonatomic,strong)NSString* alias;

/**
 头像
 */
@property(nonatomic,strong)NSString* headerUrl;

/**
 是否是主账号
 */
@property(nonatomic)BOOL isMaster;

/**
 主账号(仅限是当前账号给子账号)
 */
@property(nonatomic,strong)NSString* masterAccount;

/**
 账号权限
 */
@property(nonatomic)NSNumber* authority;

/**
 location列表
 */
@property(nonatomic,strong)NSMutableArray* locationList;
@end
