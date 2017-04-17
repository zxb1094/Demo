//
//  LoginVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/13.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "LoginVC.h"
#import "MainVC.h"
#import "ForgetVC.h"
#import "SignUpVC.h"

@interface LoginVC ()
{
    UITextField* gUserNameTextField;
    UITextField* gUserPassTextField;
    
    UIButton* loginBtn;
    UIButton* remoteBtn;
    UIButton *registUserBtn;
    UIButton *forgetPwdBtn;
}
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    gUserNameTextField = [[UITextField alloc] init];
    gUserNameTextField.delegate = self;
    gUserNameTextField.keyboardType = UIKeyboardTypeEmailAddress;
    gUserNameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    gUserNameTextField.placeholder = NSLocalizedString(LOGIN_EMAIL, nil);
    [gUserNameTextField setFont:[UIFont systemFontOfSize:15]];
    [gUserNameTextField setTextColor:[UIColor blackColor]];
    [gUserNameTextField setTextAlignment:NSTextAlignmentLeft];
    gUserNameTextField.borderStyle = UITextBorderStyleNone;
    gUserNameTextField.text = [DooyaSDK dooyaUIGetLastLoginUserName];
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
    [gUserPassTextField setSecureTextEntry:YES];
    [gUserPassTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    gUserPassTextField.borderStyle = UITextBorderStyleNone;
    [gUserPassTextField setBackground:[UIImage imageNamed:@"sign in-输入框"]];
    gUserPassTextField.text = [DooyaSDK dooyaUIGetLastLoginUserPassword];
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
    
    
    loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 300, 50)];
    [loginBtn addTarget:self action:@selector(btnLoginClick) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundColor:MAIN_COLOR];
    [loginBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [loginBtn setTitle:NSLocalizedString(LOGIN_LOGIN, nil) forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(gUserPassTextField.mas_bottom).with.offset(21);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@45);
        make.width.equalTo(@300);
    }];
    registUserBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 25)];
    [registUserBtn setTitle:NSLocalizedString(LOGIN_SIGN_UP, nil) forState:UIControlStateNormal];
    [registUserBtn setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
    registUserBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [registUserBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registUserBtn];
    [registUserBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).with.offset(12);
        make.left.equalTo(ws.view).with.offset(38);
    }];
    
    forgetPwdBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 25)];
    [forgetPwdBtn setTitle:NSLocalizedString(LOGIN_FORGET, nil) forState:UIControlStateNormal];
    forgetPwdBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [forgetPwdBtn setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
    [forgetPwdBtn addTarget:self action:@selector(forgrtBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPwdBtn];
    [forgetPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).with.offset(12);
        make.right.equalTo(ws.view).with.offset(-38);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnLoginClick
{
    [self dooyaUIShowProgressHUD:nil];
    [DooyaSDK dooyaUILoginSystem:gUserNameTextField.text
                        PassWord:gUserPassTextField.text
                      completion:^(NSError *error, id responseObject) {
                          [self dooyaUIHiddenProgresHUD];
                          if (error.code == Open_Sdk_Success)
                          {
                              [self pushToMainView];
                          }else if(error.code == Open_Sdk_User_Pass_Error)
                          {
                              [JCAlertView showOneButtonWithTitle:NSLocalizedString(MESSAGE_ERROR, nil) Message:NSLocalizedString(LOGIN_MESSAGE, nil) ButtonType:JCAlertViewButtonTypeError ButtonTitle:NSLocalizedString(MESSAGE_OK, nil) Click:^{
                                  
                              }];
                          }else
                          {
                              [self dooyaUIShowErrorAlertView:responseObject
                                                        title:NSLocalizedString(LOGIN_LOADING_FAILED, nil)
                                                   buttonType:JCAlertViewButtonTypeError];
                          }
                      }];

}

- (void)registerBtnClick
{
    SignUpVC* mSignUpVC = [[SignUpVC alloc] init];
    [self.navigationController pushViewController:mSignUpVC animated:YES];
}

- (void)forgrtBtnClick
{
    ForgetVC* mForgetVC = [[ForgetVC alloc] init];
    [self.navigationController pushViewController:mForgetVC animated:YES];
}

- (void)pushToMainView
{
    MainVC* mMainVC = [[MainVC alloc] init];
    [self.navigationController pushViewController:mMainVC animated:NO];
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
