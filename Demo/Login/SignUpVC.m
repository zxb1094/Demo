//
//  SignUpVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/13.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "SignUpVC.h"

@interface SignUpVC ()
{
    UITextField* gUserNameTextField;
    UITextField* gUserPassTextField;
    
    UIButton* gDoneBtn;
}
@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addleftBarButton:NSLocalizedString(LOGIN_BACK, nil)];
    gUserNameTextField = [[UITextField alloc] init];
    gUserNameTextField.delegate = self;
    gUserNameTextField.keyboardType = UIKeyboardTypeEmailAddress;
    gUserNameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    gUserNameTextField.placeholder = NSLocalizedString(LOGIN_EMAIL, nil);
    [gUserNameTextField setFont:[UIFont systemFontOfSize:15]];
    [gUserNameTextField setTextColor:[UIColor blackColor]];
    [gUserNameTextField setTextAlignment:NSTextAlignmentLeft];
    gUserNameTextField.borderStyle = UITextBorderStyleNone;
    
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
    
    
    gDoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 300, 50)];
    [gDoneBtn addTarget:self action:@selector(btnDoneClick) forControlEvents:UIControlEventTouchUpInside];
    [gDoneBtn setBackgroundColor:MAIN_COLOR];
    [gDoneBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [gDoneBtn setTitle:NSLocalizedString(LOGIN_DONE, nil) forState:UIControlStateNormal];
    [gDoneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:gDoneBtn];
    [gDoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(gUserPassTextField.mas_bottom).with.offset(21);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@45);
        make.width.equalTo(@300);
    }];
}

- (void)btnDoneClick
{
    [self dooyaUIShowProgressHUD:nil];
    [DooyaSDK dooyaUIRegister:gUserNameTextField.text
                     passWord:gUserPassTextField.text
                   completion:^(NSError *error, id responseObject){
                       [self dooyaUIHiddenProgresHUD];
                       if (error.code == Open_Sdk_Success) {
                           [self.navigationController popViewControllerAnimated:YES];
                       }else {
                           
                           [JCAlertView showOneButtonWithTitle:NSLocalizedString(MESSAGE_ERROR, nil) Message:[NSString stringWithFormat:@"%@",error] ButtonType:JCAlertViewButtonTypeError ButtonTitle:NSLocalizedString(MESSAGE_OK, nil) Click:^{
                               
                           }];
                       }
                       
                   }];
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
