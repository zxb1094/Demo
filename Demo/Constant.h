//
//  Constant.h
//  BOKO
//
//  Created by perry on 17/1/10.
//  Copyright © 2017年 dooya. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef Constant_h
#define Constant_h

static NSString* const Getting_Data_Notify = @"GettingDataNotify";
static NSString* const Get_Data_Fail_Notify = @"GetDataFailNotify";
static NSString* const Get_Data_Success_Notify = @"GetDataSuccessNotify";

static NSString* const LOGIN_EMAIL = @"Enter your email";
static NSString* const LOGIN_PASS = @"Enter your password";
static NSString* const LOGIN_LOGIN = @"LOGIN";
static NSString* const LOGIN_SIGN_UP = @"SIGN UP";
static NSString* const LOGIN_FORGET = @"FORGOT PASSWORD";
static NSString* const LOGIN_GETTING_DATA_FAILED = @"Loading failed";
static NSString* const SCENE_CANCEL = @"Cancel";
static NSString* const MESSAGE_OK = @"OK";
static NSString* const LOGIN_LOADING_FAILED = @"Loading Failed";
static NSString* const MESSAGE_ERROR = @"ERROR";
static NSString* const LOGIN_MESSAGE = @"Email or password error. Please re-enter.";
static NSString* const LOGIN_NEXT = @"NEXT";
static NSString* const LOGIN_FAIL = @"failed";
static NSString* const LOGIN_DONE = @"DONE";
static NSString* const LOGIN_BACK = @"BACK";
static NSString* const MAIN_CHOOSE_LOCATION = @"CHOOSE";

static NSString* const MAIN_HUB = @"HUB";
static NSString* const MAIN_DEVICE = @"DEVICE";
static NSString* const MAIN_ROOM = @"ROOM";
static NSString* const MAIN_OUT = @"SIGN OUT";

static NSString* const MAIN_ADD = @"ADD";

static NSString* const HUB_NAME = @"NAME";
static NSString* const PLS_ENTER_HUB_NAME = @"Please enter name";
static NSString* const PLACHOLDER_ENTER_HUB_NAME = @"Enter name";
static NSString* const HUB_DELETE = @"DELETE";
static NSString* const HUB_BEGIN = @"PAIR";
static NSString* const LOGIN_WIFI = @"Enter your wifi";
static NSString* const HUB_FAIL = @"Fail  again?";
static NSString* const HUB_LABEL = @"Quick wizard \n 1、Enter your Wifi password \n 2、Press the set button(the big one) on the hub until the hub starts blinking bule \n 3、Cliks 'PAIR' on the APP";
static NSString* const ROOM_DEVICE = @"DEVICE";
static NSString* const DEVICE_LABEL = @" 1、Before you add a new motor, you need to trigger bi-directional motor into program mode. There are two options to do this job. \n 2、Option1, press the setting button on the motor head for 2 seconds then click PAIR \n 3、Option2, pross P2 button twice then click PAIR \n 4、If it's one way motor, please click PAIR then long press STOP button on the remote about 3 seconds ";

static NSString* const DEVICE_OPEN = @"OPEN";
static NSString* const DEVICE_DOWN = @"DOWN";
static NSString* const DEVICE_STOP = @"STOP";

#endif /* Constant_h */
