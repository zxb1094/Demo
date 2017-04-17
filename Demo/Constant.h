//
//  Constant.h
//  BOKO
//
//  Created by perry on 17/1/10.
//  Copyright © 2017年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomFont.h"
#ifndef Constant_h
#define Constant_h

#define colorFromRGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//背景颜色
#define MAIN_COLOR              COLOR_RGB(0x0b, 0x1c, 0x31, 1)

#define LOGIN_TITLE             COLOR_RGB(0x4d, 0x64, 0x80, 1)

#define BTN_COLOR               COLOR_RGB(0x00, 0x76, 0xff, 1)

#pragma mark 字体
static NSString* const FONT_TITLE = @"PingFangSC-Regular";
static NSString* const FONT_PING_FANG_SC_MEDIUM = @"PingFangSC-Medium";

/**
 *  苹方简常规
 */
#define fontRegular(X)  [CustomFont fontWithName:@"PingFang-SC-Regular" size:X]
/**
 *  苹方简中
 */
#define fontMedium(X)  [CustomFont fontWithName:@"PingFangSC-Medium" size:X]

#pragma mark 提示框显示文字
static NSString* const ALERT_ERROR = @"错误";
static NSString* const ALERT_DONE = @"确定";
static NSString* const ALERT_TISHI = @"提示";
static NSString* const ALERT_CELER = @"取消";
static NSString* const ALERT_REFUSE = @"拒绝";
static NSString* const ALERT_AGREE = @"同意";

#pragma mark 登录界面
static NSString* const LOGIN_RESGISTER = @"注册";
static NSString* const LOGIN_LOGIN = @"登录";
static NSString* const LOGIN_PHONE = @"手机号";
static NSString* const LOGIN_CODE = @"验证码";
static NSString* const LOGIN_PLS_PHONE = @"请输入手机号/邮箱";
static NSString* const LOGIN_PLS_CODE = @"请输入发送至手机的验证码";
static NSString* const LOGIN_NUMBER = @"密码";
static NSString* const LOGIN_PLS_NUMBER = @"请输入密码";
static NSString* const LOGIN_SET_NUMBER = @"请设置密码";
static NSString* const LOGIN_FORGET_NUMBER = @"忘记密码";
static NSString* const LOGIN_ERROR = @"登录失败";
static NSString* const DLG_MSG_LOGIN_EMPTY = @"用户名或密码不能为空";
static NSString* const LOGIN_GET_CODE = @"获取验证码";
static NSString* const LOGIN_GET_PASS = @"密码找回";
static NSString* const LOGIN_REGESTER = @"注册";
static NSString* const LOGIN_CHANGE_PHONE = @"更换手机号";
static NSString* const LOGIN_GET_ERROR = @"账号不存在";
static NSString* const LOGIN_PHONE_ERROR = @"请输入正确手机号";
static NSString* const PHONE_AGAIN = @"此手机号已被注册 \n 请登录";
static NSString* const DLG_SEND_CODE_FAIL = @"验证码发送失败";
static NSString* const LOGIN_NEXT_BTN = @"下一步";
static NSString* const RE_GET = @"重新发送";
static NSString* const LOGIN_NEW_PASSWORD = @"新密码";
static NSString* const LOGIN_AGAIN_PASSWORD = @"再次输入新密码";
static NSString* const LOGIN_SET_NEW_PASSWORD = @"请输入您要设置的新密码";
static NSString* const LOGIN_SET_PASSWORD_AGAGIN = @"请确认您输入的新密码";
static NSString* const LOGIN_DONE = @"完成";
static NSString* const LOGIN_PLS_PASSWORD = @"请输入密码";
static NSString* const TWP_PASS_NOT = @"两次密码输入的不一致";
static NSString* const LOGIN_PHONERESET_YES = @"密码修改成功";
static NSString* const LOGIN_CHANGE_ERROR = @"密码修改失败";
static NSString* const LOGIN_REGISTER_FAIL= @"注册失败";
static NSString* const LOGIN_CODE_ERROR = @"验证码错误";

#pragma mark 设置界面
static NSString* const SET_SETTING = @"设置";
static NSString* const SET_ABOUT = @"关于";
static NSString* const SET_LOGOUT = @"退出登录";
static NSString* const SET_OUT = @"退出";
static NSString* const SET_OUTUSER = @"您确定要退出当前账号";
static NSString* const SET_CHANGE_PHONE = @"更换手机号";
static NSString* const SET_CHANGE_PASSWORD = @"更换密码";
static NSString* const SET_PHONE = @"请输入要更换的手机号";
static NSString* const SET_CHANGE_PHONE_FAIL = @"手机号更换失败";
static NSString* const SET_CHANGE_PHONE_SUCCESS = @"手机号更换成功";
static NSString* const SET_DEVICE_OLD_PASSWORD = @"旧密码";
static NSString* const SET_DEVICE_NEW_PASSWORD = @"新密码";
static NSString* const SET_DEVICE_XIANZHI = @"6-12个字符，区分大小写";
static NSString* const SET_DEVICE_PASSWORD_SUCCESS = @"密码修改成功";
static NSString* const SET_DEVICE_PASSWORD_FAIL = @"密码修改失败";
static NSString* const SET_DEVICE_LONG = @"密码应为6-12个字符";
static NSString* const SET_DEVICE_SHADE = @"共享设备";
static NSString* const SET_QCODE = @"我的二维码";
static NSString* const SET_BOTTOM_TISHI = @"扫二维码，邀请好友共享智能设备给你";
static NSString* const SET_SHARE_NUM = @"已共享至";
static NSString* const SET_SHARE_LAST = @"个账号";
static NSString* const SET_SHARE_GUANLI = @"管理";
static NSString* const MANAGE_SHARE_DEVICE = @"管理共享设备";
static NSString* const SET_SHARE_TO = @"共享至";
static NSString* const SET_QR_LABEL = @"请将共享联系人的二维码置于框内";
static NSString* const SET_SHARE_BTN = @"手动输入联系人";
static NSString* const CANCEL_SHARE = @"取消共享";
static NSString* const CANCEL_SHARE_NOW = @"正在取消共享";
static NSString* const CANCEL_SHARE_FAIL = @"取消共享失败";
static NSString* const CANCEL_PLS = @"您确定要取消共享给";
static NSString* const CANCEL_DE = @"的";
static NSString* const CANCEL_LAST = @"设备吗";
static NSString* const SHARE_SAND = @"发送共享";
static NSString* const SHARE_USER_PLEPER = @"联系人";
static NSString* const SHARE_PLS_NUMBER = @"请输入联系人";
static NSString* const SHARE_WRITE_FAIL = @"联系人输入有误";
static NSString* const SHARE_NO_HAVE = @"联系人不存在";
static NSString* const SHARE_SAND_FAIL = @"发送失败";
static NSString* const SHARE_SAND_SUCCESS = @"发送成功";
static NSString* const DEL_DEVICE_TITLE = @"正在删除设备";

#pragma mark 设备列表界面
static NSString* const LOGIN_MID = @"正在登陆...";
static NSString* const DEVICE_LIST = @"正在获取设备列表...";
static NSString* const DEVICE_FAIL = @"设备列表获取失败";

#pragma mark 添加设备
static NSString* const ADD_DEVICE_TYPE = @"设备类型";
static NSString* const ADD_DEVICE_ONELABEL = @"1、接通电源，电机处于上电状态";
static NSString* const ADD_DEVICE_TWOLABEL1 = @"2、按下电机设置键10秒，等指示灯慢闪八次后松开设置键，然后再按下电机设置键2秒，等指示灯闪烁一下后，松开设置键，指示灯慢速闪烁，请点击下一步";
static NSString* const ADD_DEVICE_TWOLABEL2 = @"2、按住模块配网键5秒，松开配网键，指示灯快速闪烁，指示模块进入待配网状态";
static NSString* const ADD_DEVICE_NOW_WIFI = @"当前Wi-Fi";
static NSString* const ADD_DEVICE_WIFI_PASSWORD = @"请输入Wi-Fi密码";
static NSString* const ADD_DEVICE_ADD = @"设备添加";
static NSString* const ADD_DEVICE_WIFI_CHOOSE = @"Wi-Fi选择";
static NSString* const PLS_SET_DEVICE_WIFI = @"请到手机“设置-WALN”连接无线设备Wi-Fi\n 设备网络名称：ms0002-xxxx \n 默认密码：12345678";
static NSString* const NOW_WIFI = @"当前wifi:";
static NSString* const CONNECTION_DEVICE_WIFI = @"请连接无线设备Wi-Fi";
static NSString* const ADD_DEVICE_LIANJIE = @"设备连接";
static NSString* const DEVICE_CONNECTION_MOD = @"设备连接中...";
static NSString* const DEVICE_CONNECTION_FAIL = @"连接失败";
static NSString* const DEVICE_CONNECTION_SUCCESS = @"连接成功";
static NSString* const ADD_DEVICE_AGAIN = @"重试";
static NSString* const DEVICE_CONNECTION_WIFI = @"请连接Wi-Fi:";
static NSString* const ADD_DEVICE = @"添加设备";
static NSString* const EDIT_DEVICE = @"设备设置";
static NSString* const DEVICE_MOD_FAIL = @"操作失败";

#pragma mark 设备
static NSString* const DEVICE_EDIT = @"编辑";
static NSString* const DEVICE_DEL_FAIL = @"删除失败";
static NSString* const DEVICE_DEL_SURE = @"设备删除后需要重新 \n 添加才能使用, \n 您确定要删除此设备吗";
static NSString* const DEVICE_TIME_FAIL = @"控制失败";
static NSString* const DEVICE_READ_FAIL = @"设备离线，读取失败";
static NSString* const DEVICE_PLAY_FAIL = @"设备离线，控制失败";
static NSString* const DEVICE_LINGOUT = @"设备不在线";
static NSString* const DEVICE_SET_STROTE = @"设备未设置行程";
static NSString* const DEVICE_ANGLE = @"角度";

static NSString* const DEVICE_ABOUT = @"Copyright © 2012-2017 BOKO. All Rights Reserved.";

static NSString* const DEVICE_NAME = @"名称";

static NSString* const DEVICE_SET = @"电机参数设置";
static NSString* const DEVICE_SET_ZF = @"电机正反转设置";
static NSString* const DEVICE_SET_ANGLE = @"角度系数";
static NSString* const DEVICE_SET_ANGLEPC = @"角度偏差系数";
static NSString* const DEVICE_SET_ANGELFX = @"角度反向设置";

static NSString* const DEVICE_SET_FAIL = @"设置失败";

static NSString* const DEVICE_ZX = @"正向";
static NSString* const DEVICE_FX = @"反向";
static NSString* const DEVICE_HM = @"0-255";

static NSString* const DEVICE_SET_SUCCESS = @"设置成功";
static NSString* const AIRER_FAIL = @"状态获取 \n 失败";
static NSString* const DEL_DEVICE = @"删除设备";

#pragma mark 分享
static NSString* const TISHI_KNOW = @"知道了";
static NSString* const DEL_SON_ONE = @"此设备需要账号";
static NSString* const DEL_SON_TWO = @"取消共享给您，才能解绑";
static NSString* const SHARE_QQJ = @"请求将";
static NSString* const SHARE_GIVE_YOU = @"分享给您";
static NSString* const SHARE_YOU = @"分享您的";
static NSString* const SHARE_YJ = @"已将";
static NSString* const SHARE_CXFX = @"撤销分享";
static NSString* const SHARE_DEL = @"删除";
static NSString* const OTHER_LOGIN = @"账号在其它地方登录";

#endif /* Constant_h */
