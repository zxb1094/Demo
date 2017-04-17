//
//  AddDeviceVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/14.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "AddDeviceVC.h"
#import "EditDeviceVC.h"

@interface AddDeviceVC ()
{
    NSMutableArray* hubArray;
    HubInfo*        hubInfo;
    NSTimer*        mTimer;
    NSInteger       timerCount;
    UIButton*       gDoneBtn;
}
@end

@implementation AddDeviceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addleftBarButton:NSLocalizedString(LOGIN_BACK, nil)];
    
    self.mTableView = [[UITableView alloc]init];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.frame = CGRectMake(0, 76, self.view.frame.size.width,self.view.frame.size.height - 64 - 250);
    [self.view addSubview:self.mTableView];
    
    gDoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 300, 50)];
    [gDoneBtn addTarget:self action:@selector(btnDoneClick) forControlEvents:UIControlEventTouchUpInside];
    [gDoneBtn setBackgroundColor:MAIN_COLOR];
    [gDoneBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [gDoneBtn setTitle:NSLocalizedString(HUB_BEGIN, nil) forState:UIControlStateNormal];
    [gDoneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:gDoneBtn];
    WS(ws)
    [gDoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.view.mas_bottom).with.offset(-20);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@45);
        make.width.equalTo(@300);
    }];
    
    UILabel* promptLabel  =[[UILabel alloc] init];
    promptLabel.textColor = [UIColor blackColor];
    promptLabel.text = NSLocalizedString(DEVICE_LABEL, nil);
    promptLabel.numberOfLines = 0;
    promptLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:promptLabel];
    [promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(24);
        make.bottom.equalTo(gDoneBtn.mas_top).with.offset(-40);
        make.size.mas_equalTo(CGSizeMake(300, 200));
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    hubArray = [[NSMutableArray alloc] init];
    NSMutableArray* array = [DooyaSDK dooyaUIGetHostList:-1];
    for (HubInfo* hub in array) {
        if (hub.isOnline) {
            [hubArray addObject:hub];
        }
    }
    if (hubArray.count >= 1) {
        hubInfo = [hubArray objectAtIndex:0];
    }
    [self.mTableView reloadData];
}

-(void)viewCallBack:(Result *)result
{
    switch (result.state)
    {
        case CALL_BACK_DEVICE_ADD_UPDATE:
            [self palySuccess:result.Device];
            break;
        default:
            break;
            
    }
}
- (void)palySuccess:(DeviceInfo*)device
{
    [mTimer invalidate];
    mTimer = nil;
    
    EditDeviceVC* mEditDeviceVC = [[EditDeviceVC alloc] init];
    mEditDeviceVC.isAdd = YES;
    mEditDeviceVC.deviceInfo = device;
    [self.navigationController pushViewController:mEditDeviceVC animated:YES];
}

- (void)btnDoneClick
{
    [DooyaSDK dooyaUIDeviceAdd:nil
                          icon:0
                           hub:hubInfo.hubMac
                          name:@"SHADE"];
    
    self.mTableView.userInteractionEnabled = NO;
    [gDoneBtn setBackgroundColor:[UIColor lightGrayColor]];
    gDoneBtn.userInteractionEnabled = NO;
    if (mTimer == nil)
    {
        timerCount = 20;
        mTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(dooyaUITimerCount)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

-(void)dooyaUITimerCount
{
    timerCount --;
    if (timerCount > 0)
    {
        [gDoneBtn setTitle:[NSString stringWithFormat:@"%ld",(long)timerCount] forState:UIControlStateNormal];
    }else
    {
        [mTimer invalidate];
        mTimer = nil;
        [gDoneBtn setTitle:[NSString stringWithFormat:@"%ld",(long)timerCount] forState:UIControlStateNormal];
        self.mTableView.userInteractionEnabled = NO;
        [gDoneBtn setBackgroundColor:[UIColor redColor]];
        gDoneBtn.userInteractionEnabled = YES;
        [gDoneBtn setTitle:[NSString stringWithFormat:@"%@",NSLocalizedString(HUB_FAIL, nil)] forState:UIControlStateNormal];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.backgroundView = nil;
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    
    return 44;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (hubArray.count == 0) {
        tableView.alpha = 0.0f;
    }else {
        tableView.alpha = 1.0f;
    }
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    return hubArray.count;
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
    
    HubInfo *hostInfo = [[HubInfo alloc]init];
    hostInfo  = [hubArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = hostInfo.hubName;
    if ([hostInfo.hubMac isEqualToString:hubInfo.hubMac]) {
        cell.textLabel.textColor = [UIColor redColor];
    }else {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    hubInfo = [hubArray objectAtIndex:indexPath.row];
    [self.mTableView reloadData];
}

@end
