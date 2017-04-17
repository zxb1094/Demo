//
//  ForgetVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/13.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "ForgetVC.h"

@interface ForgetVC ()
{
    UITextField* gUserNameTextField;
    UIButton*  gNextBtn;
}
@end

@implementation ForgetVC

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
    
    
    gNextBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 0, 300, 50)];
    [gNextBtn addTarget:self action:@selector(btnNextClick) forControlEvents:UIControlEventTouchUpInside];
    [gNextBtn setBackgroundColor:[UIColor redColor]];
    [gNextBtn.titleLabel setFont:[UIFont systemFontOfSize:18.f]];
    [gNextBtn setTitle:NSLocalizedString(LOGIN_DONE, nil) forState:UIControlStateNormal];
    [gNextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:gNextBtn];
    [gNextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(gUserNameTextField.mas_bottom).with.offset(21);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@45);
        make.width.equalTo(@300);
    }];
}

- (void)btnNextClick
{
    [self dooyaUIShowProgressHUD:nil];
    [DooyaSDK dooyaUIResetPassWord:gUserNameTextField.text completion:^(NSError *error, id responseObject) {
        
        [self dooyaUIHiddenProgresHUD];
        if (error.code == Open_Sdk_Success) {
             [self.navigationController popViewControllerAnimated:YES];
        }else {
            [self dooyaUIShowErrorAlertView:responseObject
                                      title:NSLocalizedString(LOGIN_FAIL, nil)
                                 buttonType:JCAlertViewButtonTypeError];
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
    
}

@end
