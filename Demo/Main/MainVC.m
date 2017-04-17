//
//  MainVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/13.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "MainVC.h"
#import "LoginVC.h"
#import "HubVC.h"
#import "DeviceVC.h"
#import "RoomVC.h"

@interface MainVC ()
{
    NSArray *dataArray;
}
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton* hubBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 250, 50)];
    [hubBtn addTarget:self action:@selector(btnHubClick) forControlEvents:UIControlEventTouchUpInside];
    [hubBtn setBackgroundColor:MAIN_COLOR];
    [hubBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [hubBtn setTitle:NSLocalizedString(MAIN_HUB, nil) forState:UIControlStateNormal];
    [hubBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:hubBtn];
    WS(ws)
    [hubBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(64+50);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@50);
        make.width.equalTo(@250);
    }];
    
    UIButton* deviceBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 200, 50)];
    [deviceBtn addTarget:self action:@selector(btnDeviceClick) forControlEvents:UIControlEventTouchUpInside];
    [deviceBtn setBackgroundColor:MAIN_COLOR];
    [deviceBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [deviceBtn setTitle:NSLocalizedString(MAIN_DEVICE, nil) forState:UIControlStateNormal];
    [deviceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:deviceBtn];
    
    [deviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hubBtn.mas_bottom).with.offset(30);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@50);
        make.width.equalTo(@250);
    }];
    
    UIButton* roomBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 200, 50)];
    [roomBtn addTarget:self action:@selector(btnRoomClick) forControlEvents:UIControlEventTouchUpInside];
    [roomBtn setBackgroundColor:MAIN_COLOR];
    [roomBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [roomBtn setTitle:NSLocalizedString(MAIN_ROOM, nil) forState:UIControlStateNormal];
    [roomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:roomBtn];
    
    [roomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(deviceBtn.mas_bottom).with.offset(30);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@50);
        make.width.equalTo(@250);
    }];
    
    UIButton* signOutBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 200, 50)];
    [signOutBtn addTarget:self action:@selector(btnOutClick) forControlEvents:UIControlEventTouchUpInside];
    [signOutBtn setBackgroundColor:[UIColor redColor]];
    [signOutBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [signOutBtn setTitle:NSLocalizedString(MAIN_OUT, nil) forState:UIControlStateNormal];
    [signOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:signOutBtn];
    
    [signOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(roomBtn.mas_bottom).with.offset(30);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@50);
        make.width.equalTo(@250);
    }];
}

- (void)btnHubClick
{
    HubVC* mHubVC = [[HubVC alloc] init];
    [self.navigationController pushViewController:mHubVC animated:YES];
}

- (void)btnDeviceClick
{
    DeviceVC* mDeviceVC = [[DeviceVC alloc] init];
    [self.navigationController pushViewController:mDeviceVC animated:YES];
}

- (void)btnRoomClick
{
    RoomVC* mRoomVC = [[RoomVC alloc] init];
    mRoomVC.isAdd = NO;
    [self.navigationController pushViewController:mRoomVC animated:YES];
}

- (void)btnOutClick
{
    [DooyaSDK dooyaUILogOut];
    for (id item in self.navigationController.childViewControllers) {
        if ([item isKindOfClass:[LoginVC class]]) {
            
            [self.navigationController popToViewController:item animated:NO];
        }
    }
}

@end
