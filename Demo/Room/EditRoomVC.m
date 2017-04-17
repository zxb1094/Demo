//
//  EditRoomVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/14.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "EditRoomVC.h"
#import "DeviceVC.h"

@interface EditRoomVC ()
{
    NSString* nameStr;
    NSMutableArray* deviceArray;
}
@end

@implementation EditRoomVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addleftBarButton:NSLocalizedString(LOGIN_BACK, nil)];
    [self addrightBarButton:NSLocalizedString(LOGIN_DONE, nil)];
    
    self.mTableView = [[UITableView alloc]init];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.frame = CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height-64);
    
    [self.view addSubview:self.mTableView];
    
    UIView* footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    footView.backgroundColor = [UIColor whiteColor];
    
    UIButton* gDelBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 300, 50)];
    [gDelBtn addTarget:self action:@selector(btnDelClick) forControlEvents:UIControlEventTouchUpInside];
    [gDelBtn setBackgroundColor:[UIColor redColor]];
    [gDelBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [gDelBtn setTitle:NSLocalizedString(HUB_DELETE, nil) forState:UIControlStateNormal];
    [gDelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [footView addSubview:gDelBtn];
    
    [gDelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footView.mas_top).with.offset(20);
        make.centerX.equalTo(footView.mas_centerX);
        make.height.equalTo(@45);
        make.width.equalTo(@300);
    }];
    
    if (self.isAdd) {
        gDelBtn.hidden = YES;
        nameStr = @"";
    }else {
        gDelBtn.hidden = NO;
        nameStr = self.room.roomName;
        self.mTableView.tableFooterView = footView;
    }

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [deviceArray removeAllObjects];
    deviceArray = [DooyaSDK dooyaUIGetRoomDeviceListWithRoomID:self.room.roomID RoomCtrlType:Room_Ctrl_Type_All_Device];
    [self.mTableView reloadData];
}

- (void)viewCallBack:(Result *)result {
    switch (result.state) {
        case CALL_BACK_ROOM_DEL_UPDATE:
        case CALL_BACK_ROOM_ADD_UPDATE:
        case CALL_BACK_ROOM_MOD_UPDATE:
            [self palySuccess];
            break;
        case CALL_BACK_EXE_ERROR:
            [self palyFail];
            break;
        case CALL_BACK_DEVICE_MOD_UPDATE:
        case CALL_BACK_DEVICE_ADD_UPDATE:
        case CALL_BACK_DEVICE_DEL_UPDATE:
            [self dooyaUIHiddenProgresHUD];
            [deviceArray removeAllObjects];
            deviceArray = [DooyaSDK dooyaUIGetRoomDeviceListWithRoomID:self.room.roomID RoomCtrlType:Room_Ctrl_Type_All_Device];
            [self.mTableView reloadData];
            break;
        default:
            break;
    }
}

- (void)btnDelClick
{
    [self dooyaUIShowProgressHUD:nil];
    [DooyaSDK dooyaUIDelRoom:self.room.roomID];
}

- (void)palySuccess
{
    [self dooyaUIHiddenProgresHUD];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)palyFail
{
    [self dooyaUIHiddenProgresHUD];
    [self dooyaUIShowErrorAlertView:NSLocalizedString(LOGIN_FAIL, nil)
                              title:NSLocalizedString(MESSAGE_ERROR, nil)
                         buttonType:JCAlertViewButtonTypeError];
}

- (void)rightBarButtonTouchUpInside
{
    [self dooyaUIShowProgressHUD:nil];
    if (self.isAdd) {
        [DooyaSDK dooyaUIAddRoom:nameStr Icon:1 roomID:nil];
    }else {
        self.room.roomName = nameStr;
        [DooyaSDK dooyaUIEditRoom:self.room];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.backgroundView = nil;
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    
    return 44;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else
        return deviceArray.count+1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.isAdd) {
        return 1;
    }else
        return 2;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *mSectionHeaderView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [mSectionHeaderView setBackgroundColor:[UIColor whiteColor]];
    
    UILabel* mTipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(16.5, 0, mSectionHeaderView.frame.size.width-10, mSectionHeaderView.frame.size.height)];
    [mTipsLabel setFont:[UIFont systemFontOfSize:14]];
    [mTipsLabel setTextAlignment:NSTextAlignmentLeft];
    [mTipsLabel setTextColor:MAIN_COLOR];
    
    if (section == 0) {
        mTipsLabel.text = NSLocalizedString(MAIN_ROOM, nil);
    }else if (section == 1) {
        mTipsLabel.text = NSLocalizedString(ROOM_DEVICE, nil);
    }

    [mSectionHeaderView addSubview:mTipsLabel];
    
    return mSectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
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
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"NAME:%@",nameStr];
    }else if (indexPath.section == 1) {
        if (indexPath.row == deviceArray.count) {
            cell.textLabel.text = @"Add Device";
            cell.textLabel.textColor = MAIN_COLOR;
        }else {
            RoomCtrlInfo* device = [deviceArray objectAtIndex:indexPath.row];
            cell.textLabel.text = device.deviceInfo.deviceName;
            cell.textLabel.textColor = [UIColor blackColor];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    if (indexPath.section == 0) {
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
        
    }else {
        if (indexPath.row == deviceArray.count) {
            DeviceVC* mDeviceVC = [[DeviceVC alloc] init];
            mDeviceVC.isAdd = YES;
            mDeviceVC.gRoomID = self.room.roomID;
            [self.navigationController pushViewController:mDeviceVC animated:YES];
        }
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        if (indexPath.row < deviceArray.count)
        {
            return YES;
        }
    }
    
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < deviceArray.count)
    {
        [self dooyaUIShowProgressHUD:nil];
        RoomCtrlInfo* roomInfo = [deviceArray objectAtIndex:indexPath.row];
        [DooyaSDK dooyaUIDeviceEdit:roomInfo.deviceInfo.deviceID
                               Name:roomInfo.deviceInfo.deviceName
                               Room:nil
                               Icon:roomInfo.deviceInfo.deviceIcon
                               Type:roomInfo.deviceInfo.deviceType];
    }
}

@end
