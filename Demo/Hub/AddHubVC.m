//
//  AddHubVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/14.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "AddHubVC.h"
#import "EditHubVC.h"

@interface AddHubVC ()
{
    UITextField*    gUserNameTextField;
    UITextField*    gUserPassTextField;
    
    UIButton*       gBeginBtn;
    NSTimer*        mTimer;
    NSInteger       timerCount;
    UILabel*        promptLabel;
}
@end

@implementation AddHubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addleftBarButton:NSLocalizedString(LOGIN_BACK, nil)];
    gUserNameTextField = [[UITextField alloc] init];
    gUserNameTextField.delegate = self;
    gUserNameTextField.keyboardType = UIKeyboardTypeEmailAddress;
    gUserNameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    gUserNameTextField.placeholder = NSLocalizedString(LOGIN_WIFI, nil);
    [gUserNameTextField setFont:[UIFont systemFontOfSize:15]];
    [gUserNameTextField setTextColor:[UIColor blackColor]];
    [gUserNameTextField setTextAlignment:NSTextAlignmentLeft];
    gUserNameTextField.borderStyle = UITextBorderStyleNone;
    gUserNameTextField.text = [DooyaSDK dooyaUIGetCurrentWiFiSSID];
    [gUserNameTextField setBackground:[UIImage imageNamed:@"sign in-输入框"]];
    [self.view addSubview:gUserNameTextField];
    [gUserNameTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    WS(ws)
    [gUserNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top).with.offset(64 + 35);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(300, 44));
    }];
    
    gUserNameTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 0)];
    gUserNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    gUserPassTextField = [[UITextField alloc] init];
    gUserPassTextField.delegate = self;
    gUserPassTextField.keyboardType = UIKeyboardTypeASCIICapable;
    gUserPassTextField.placeholder = NSLocalizedString(LOGIN_PASS, nil);
    [gUserPassTextField setFont:[UIFont systemFontOfSize:15]];
    [gUserPassTextField setTextColor:[UIColor blackColor]];
    [gUserPassTextField setTextAlignment:NSTextAlignmentLeft];
    gUserPassTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [gUserPassTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    gUserPassTextField.borderStyle = UITextBorderStyleNone;
    [gUserPassTextField setBackground:[UIImage imageNamed:@"sign in-输入框"]];
    [self.view addSubview:gUserPassTextField];
    [gUserPassTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(gUserNameTextField.mas_bottom).with.offset(12);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(300, 44));
    }];
    gUserPassTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 0)];
    gUserPassTextField.leftViewMode = UITextFieldViewModeAlways;
    
    gUserPassTextField.rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 0)];
    gUserPassTextField.rightViewMode = UITextFieldViewModeAlways;
    
    
    promptLabel  =[[UILabel alloc] init];
    promptLabel.textColor = [UIColor blackColor];
    promptLabel.text = NSLocalizedString(HUB_LABEL, nil);
    promptLabel.numberOfLines = 0;
    promptLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:promptLabel];
    [promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(24);
        make.top.equalTo(gUserPassTextField.mas_bottom).with.offset(25);
        make.size.mas_equalTo(CGSizeMake(300, 140));
    }];
    
    gBeginBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 300, 50)];
    [gBeginBtn addTarget:self action:@selector(btnBeginClick) forControlEvents:UIControlEventTouchUpInside];
    [gBeginBtn setBackgroundColor:MAIN_COLOR];
    [gBeginBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [gBeginBtn setTitle:NSLocalizedString(HUB_BEGIN, nil) forState:UIControlStateNormal];
    [gBeginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:gBeginBtn];
    [gBeginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(promptLabel.mas_bottom).with.offset(21);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@45);
        make.width.equalTo(@300);
    }];

}

- (void)btnBeginClick
{
    gUserNameTextField.userInteractionEnabled = NO;
    gUserPassTextField.userInteractionEnabled = NO;
    [gBeginBtn setBackgroundColor:[UIColor lightGrayColor]];
    gBeginBtn.userInteractionEnabled = NO;
    [DooyaSDK dooyaUISettingDeviceWifiInfo:gUserNameTextField.text
                                  password:gUserPassTextField.text
                                configMode:Hub_Wifi_AirLink
                                   timeOut:60
                                completion:^(NSError *error, id responseObject) {
                                    if (error.code == Open_Sdk_Success)
                                    {
                                        [self addHubSuccess:responseObject];
                                        
                                    }else
                                    {
                                        [self addHubFail];
                                        [JCAlertView showOneButtonWithTitle:NSLocalizedString(MESSAGE_ERROR, nil) Message:[NSString stringWithFormat:@"%@",error] ButtonType:JCAlertViewButtonTypeError ButtonTitle:NSLocalizedString(MESSAGE_OK, nil) Click:^{
                                            
                                        }];
                                    }
                                }];
    
    if (mTimer == nil)
    {
        timerCount = 60;
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
        [gBeginBtn setTitle:[NSString stringWithFormat:@"%ld",(long)timerCount] forState:UIControlStateNormal];
    }else
    {
        [mTimer invalidate];
        mTimer = nil;
        [gBeginBtn setTitle:[NSString stringWithFormat:@"%ld",(long)timerCount] forState:UIControlStateNormal];
        gUserNameTextField.userInteractionEnabled = YES;
        gUserPassTextField.userInteractionEnabled = YES;
        [gBeginBtn setBackgroundColor:[UIColor redColor]];
        gBeginBtn.userInteractionEnabled = YES;
        [gBeginBtn setTitle:[NSString stringWithFormat:@"%@",NSLocalizedString(HUB_FAIL, nil)] forState:UIControlStateNormal];
    }
}

- (void)addHubFail
{
    [mTimer invalidate];
    mTimer = nil;
    [gBeginBtn setTitle:[NSString stringWithFormat:@"%ld",(long)timerCount] forState:UIControlStateNormal];
    gUserNameTextField.userInteractionEnabled = YES;
    gUserPassTextField.userInteractionEnabled = YES;
    [gBeginBtn setBackgroundColor:[UIColor redColor]];
    gBeginBtn.userInteractionEnabled = YES;
    [gBeginBtn setTitle:[NSString stringWithFormat:@"%@",NSLocalizedString(HUB_FAIL, nil)] forState:UIControlStateNormal];
}

- (void)addHubSuccess:(NSString*)str
{
    [mTimer invalidate];
    mTimer = nil;
    
    EditHubVC* mEditHubVC = [[EditHubVC alloc] init];
    mEditHubVC.isAdd = YES;
    mEditHubVC.hubAddress = str;
    [self.navigationController pushViewController:mEditHubVC animated:YES];
}

-(void)leftBarButtonTouchUpInside
{
    [mTimer invalidate];
    mTimer = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFiledDelegte
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [gUserNameTextField resignFirstResponder];
    [gUserPassTextField resignFirstResponder];
    
}

@end
