//
//  EditDeviceVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/14.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "EditDeviceVC.h"
#import "RoomVC.h"
#import "DeviceVC.h"

@interface EditDeviceVC ()
{
    NSString* nameStr;
    NSString* roomName;
    RoomInfo* roomInfo;
    BOOL isPlay;
}
@end

@implementation EditDeviceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addrightBarButton:NSLocalizedString(LOGIN_DONE, nil)];
    self.mTableView = [[UITableView alloc]init];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.scrollEnabled = NO;
    self.mTableView.frame = CGRectMake(0, 76, self.view.frame.size.width,self.view.frame.size.height-64);
    [self.mTableView setEditing:NO];
    [self.view addSubview:self.mTableView];
    
    UIButton* gDelBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 300, 50)];
    [gDelBtn addTarget:self action:@selector(btnDelClick) forControlEvents:UIControlEventTouchUpInside];
    [gDelBtn setBackgroundColor:[UIColor redColor]];
    [gDelBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [gDelBtn setTitle:NSLocalizedString(HUB_DELETE, nil) forState:UIControlStateNormal];
    [gDelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:gDelBtn];
    WS(ws)
    [gDelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(230);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@45);
        make.width.equalTo(@300);
    }];
    
    UIButton* gDownBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 80, 50)];
    [gDownBtn addTarget:self action:@selector(btnDownClick) forControlEvents:UIControlEventTouchUpInside];
    [gDownBtn setBackgroundColor:MAIN_COLOR];
    [gDownBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [gDownBtn setTitle:NSLocalizedString(DEVICE_DOWN, nil) forState:UIControlStateNormal];
    [gDownBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:gDownBtn];
    [gDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(gDelBtn.mas_bottom).with.offset(30);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@45);
        make.width.equalTo(@80);
    }];
    
    UIButton* gOpenBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    [gOpenBtn addTarget:self action:@selector(btnOpenClick) forControlEvents:UIControlEventTouchUpInside];
    [gOpenBtn setBackgroundColor:MAIN_COLOR];
    [gOpenBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [gOpenBtn setTitle:NSLocalizedString(DEVICE_OPEN, nil) forState:UIControlStateNormal];
    [gOpenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:gOpenBtn];
    [gOpenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(gDownBtn.mas_left).with.offset(-20);
        make.centerY.equalTo(gDownBtn.mas_centerY);
        make.height.equalTo(@45);
        make.width.equalTo(@80);
    }];
    
    UIButton* gStopBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    [gStopBtn addTarget:self action:@selector(btnStopClick) forControlEvents:UIControlEventTouchUpInside];
    [gStopBtn setBackgroundColor:MAIN_COLOR];
    [gStopBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [gStopBtn setTitle:NSLocalizedString(DEVICE_STOP, nil) forState:UIControlStateNormal];
    [gStopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:gStopBtn];
    [gStopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(gDownBtn.mas_centerY);
        make.left.equalTo(gDownBtn.mas_right).with.offset(20);
        make.height.equalTo(@45);
        make.width.equalTo(@80);
    }];
    
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 150, 20)];
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(gStopBtn.mas_bottom).with.offset(50);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(300, 20));
    }];
    
    nameStr = self.deviceInfo.deviceName;
    roomName = self.deviceInfo.deviceRoom.roomName;
    roomInfo = nil;
    if (self.isAdd) {
        gDelBtn.hidden = YES;
        gDownBtn.hidden = YES;
        gOpenBtn.hidden = YES;
        gStopBtn.hidden = YES;
        slider.hidden = YES;
    }else {
        [self addleftBarButton:NSLocalizedString(LOGIN_BACK, nil)];
        gDelBtn.hidden = NO;
        gDownBtn.hidden = NO;
        gOpenBtn.hidden = NO;
        gStopBtn.hidden = NO;
        slider.hidden = NO;
        
    }
    
    isPlay = NO;
}

-(void)viewCallBack:(Result *)result
{
    switch (result.state)
    {
        case CALL_BACK_DEVICE_MOD_UPDATE:
        case CALL_BACK_DEVICE_ADD_UPDATE:
        case CALL_BACK_DEVICE_DEL_UPDATE:
            if (!isPlay) {
                [self palySuccsee];
            }
            
            break;
        case CALL_BACK_EXE_ERROR:
            [self palyFail];
            break;
        default:
            break;
    }
}

- (void)sliderValueChanged:(id)sender {
    isPlay = YES;
    UISlider *slider = (UISlider *)sender;
    UInt8 zdcmddata[24];
    zdcmddata[0] = (int)slider.value;
    [DooyaSDK dooyaUIDeviceExeWithDeviceID:self.deviceInfo.deviceID
                                       Cmd:Device_Cmd_Blind_Point
                                   CmdData:[NSData dataWithBytes:zdcmddata length:1]];
}

- (void)btnOpenClick
{
    isPlay = YES;
    
    [DooyaSDK dooyaUIDeviceExeWithDeviceID:self.deviceInfo.deviceID
                                       Cmd:Device_Cmd_Blind_Open
                                   CmdData:nil];
}

- (void)btnDownClick
{
    isPlay = YES;
    [DooyaSDK dooyaUIDeviceExeWithDeviceID:self.deviceInfo.deviceID
                                       Cmd:Device_Cmd_Blind_Close
                                   CmdData:nil];
}
- (void)btnStopClick
{
    isPlay = YES;
    [DooyaSDK dooyaUIDeviceExeWithDeviceID:self.deviceInfo.deviceID
                                       Cmd:Device_Cmd_Blind_Stop
                                   CmdData:nil];
}

- (void)btnDelClick
{
    isPlay = NO;
    [self dooyaUIShowProgressHUD:nil];
    [DooyaSDK dooyaUIDeviceDel:self.deviceInfo.deviceID];
}

- (void)rightBarButtonTouchUpInside
{
    [self dooyaUIShowProgressHUD:nil];
    isPlay = NO;
    if (roomInfo == nil) {
        [DooyaSDK dooyaUIDeviceEdit:self.deviceInfo.deviceID
                               Name:nameStr
                               Room:self.deviceInfo.deviceRoom.roomID
                               Icon:self.deviceInfo.deviceIcon
                               Type:self.deviceInfo.deviceType];
    }else {
        [DooyaSDK dooyaUIDeviceEdit:self.deviceInfo.deviceID
                               Name:nameStr
                               Room:roomInfo.roomID
                               Icon:self.deviceInfo.deviceIcon
                               Type:self.deviceInfo.deviceType];
    }
    
}

- (void)palySuccsee
{
    [self dooyaUIHiddenProgresHUD];
    for (UIViewController* view in self.navigationController.viewControllers)
    {
        if ([view isKindOfClass:[DeviceVC class]])
        {
            [self.navigationController popToViewController:view animated:NO];
        }
    }
}

- (void)palyFail
{
    [self dooyaUIHiddenProgresHUD];
    [self dooyaUIShowErrorAlertView:NSLocalizedString(LOGIN_FAIL, nil)
                              title:NSLocalizedString(MESSAGE_ERROR, nil)
                         buttonType:JCAlertViewButtonTypeError];
}

-(void)dooyaUISetDeviceRoom:(RoomInfo*) room
{
    roomInfo = room;
    roomName = room.roomName;
    [self.mTableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.backgroundView = nil;
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    
    return 44;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *dentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:dentifier];
    if (cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:dentifier];
        UIImageView *backView = [[UIImageView alloc]init];
        backView.backgroundColor = [UIColor whiteColor];
        [cell setBackgroundView:backView];
    }
    UIImageView* gLineView = [[UIImageView alloc] init];
    [gLineView setBackgroundColor:MAIN_COLOR];
    [cell addSubview:gLineView];
    
    [gLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(cell).with.offset(0);
        make.right.equalTo(cell).with.offset(0);
        make.height.equalTo(@0.5);
        make.left.equalTo(cell).with.offset(0);
    }];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"NAME:%@",nameStr];
    }else if (indexPath.row == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"HubMac:%@",self.deviceInfo.deviceHub.hubMac];
    }else if (indexPath.row == 2) {
        cell.textLabel.text = [NSString stringWithFormat:@"ROOM:%@",roomName];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    if (indexPath.row == 0) {
        [JCAlertView showTextFiledButtonsWithTitleAndText:NSLocalizedString(HUB_NAME, nil)
                                                FieldText:nil
                                                  Message:NSLocalizedString(PLS_ENTER_HUB_NAME, nil)
                                              Placeholder:NSLocalizedString(PLACHOLDER_ENTER_HUB_NAME, nil)
                                              ButtonTitle:NSLocalizedString(SCENE_CANCEL, nil)
                                                    Click:^(NSString *message) {
                                                        
                                                    } ButtonTitle:NSLocalizedString(MESSAGE_OK, nil)
                                                    Click:^(NSString *message) {
                                                        nameStr = message;
                                                        [self.mTableView reloadData];
                                                    }];
        
    }else if (indexPath.row == 2) {
        RoomVC* mRoomVC = [[RoomVC alloc] init];
        mRoomVC.isAdd = YES;
        mRoomVC.delegate = self;
        [self.navigationController pushViewController:mRoomVC animated:YES];
    }
}


@end
