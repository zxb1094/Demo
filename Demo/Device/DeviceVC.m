//
//  DeviceVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/14.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "DeviceVC.h"
#import "EditDeviceVC.h"
#import "AddDeviceVC.h"

@interface DeviceVC ()
{
    NSMutableArray* deviceArray;
}
@end

@implementation DeviceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addleftBarButton:NSLocalizedString(LOGIN_BACK, nil)];
    if (!self.isAdd) {
        [self addrightBarButton:NSLocalizedString(MAIN_ADD, nil)];
    }
    self.mTableView = [[UITableView alloc]init];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.frame = CGRectMake(0, 76, self.view.frame.size.width,self.view.frame.size.height-64);
    [self.mTableView setEditing:NO];
    [self.view addSubview:self.mTableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    deviceArray = [DooyaSDK dooyaUIGetAllDeviceList];
    [self.mTableView reloadData];
}

-(void)viewCallBack:(Result *)result
{
    switch (result.state)
    {
        case CALL_BACK_DEVICE_MOD_UPDATE:
            [self palySuccsee];
            break;
        case CALL_BACK_EXE_ERROR:
            [self palyFail];
            break;
        default:
            break;
    }
}

- (void)palySuccsee
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
    AddDeviceVC* mAddDeviceVC = [[AddDeviceVC alloc] init];
    [self.navigationController pushViewController:mAddDeviceVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.backgroundView = nil;
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    
    return 44;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (deviceArray.count == 0) {
        tableView.alpha = 0.0f;
    }else {
        tableView.alpha = 1.0f;
    }
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    return deviceArray.count;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleNone;
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
    
    RoomCtrlInfo *deviceInfo = [[RoomCtrlInfo alloc]init];
    deviceInfo  = [deviceArray objectAtIndex:indexPath.row];
    cell.textLabel.text = deviceInfo.deviceInfo.deviceName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    RoomCtrlInfo* device = [deviceArray objectAtIndex:indexPath.row];
    if (self.isAdd) {
        
        [self dooyaUIShowProgressHUD:nil];
        [DooyaSDK dooyaUIDeviceEdit:device.deviceInfo.deviceID
                               Name:device.deviceInfo.deviceName
                               Room:self.gRoomID
                               Icon:device.deviceInfo.deviceIcon
                               Type:device.deviceInfo.deviceType];
    }else {
        EditDeviceVC* mEditDeviceVC = [[EditDeviceVC alloc] init];
        mEditDeviceVC.isAdd = NO;
        mEditDeviceVC.deviceInfo = device.deviceInfo;
        [self.navigationController pushViewController:mEditDeviceVC animated:YES];
    }
    
}


@end
