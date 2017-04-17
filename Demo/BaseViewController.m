//
//  BaseViewController.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/13.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "BaseViewController.h"
#import "JCAlertView.h"
#import "AppDelegate.h"
#import "LoginVC.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [DooyaSDK dooyaUICallBackSelector:@selector(callback:) toTarget:self];
    
    _navIV = [[UIImageView alloc] init];
    [_navIV setUserInteractionEnabled:YES];
    [self.view addSubview:_navIV];
    
    WS(ws);
    [_navIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.height.equalTo(@64);
    }];
    _navIV.backgroundColor = self.view.backgroundColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [DooyaSDK dooyaUICallBackSelector:@selector(callback:) toTarget:self];
}

- (void)callback:(id)object
{
    Result* result = (Result*)object;
    
    switch (result.state)
    {
        case CALL_BACK_LOGIN_FAIL:
            
            break;
        case CALL_BACK_LOGIN_SUCCESS:
            
            break;
        case CALL_BACK_SYSTEM_RECONNECTING:
            [self dooyaUIShowProgressHUD:nil];
            break;
        case CALL_BACK_RECONNECT_SUCCESS:
            [self dooyaUIHiddenProgresHUD];
            break;
        case CALL_BACK_GETTING_DATA:
            [self dooyaUIShowProgressHUD:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:Getting_Data_Notify
                                                                object:nil];
            break;
        case CALL_BACK_GETTING_DATA_FAIL:
            [self dooyaUIGettingFail];
            [[NSNotificationCenter defaultCenter] postNotificationName:Get_Data_Fail_Notify
                                                                object:nil];
            break;
        case CALL_BACK_GETTING_DATA_SUCCESS:
            [self dooyaUIHiddenProgresHUD];
            [[NSNotificationCenter defaultCenter] postNotificationName:Get_Data_Success_Notify
                                                                object:nil];
            break;
        default:
            [self viewCallBack:result];
            break;
    }
}

-(void)viewCallBack:(Result*) result
{
    
}

- (void)dooyaUIGettingFail
{
    [JCAlertView showTwoButtonsWithTitle:NSLocalizedString(LOGIN_GETTING_DATA_FAILED, nil)
                                 Message:NSLocalizedString(LOGIN_LOGIN, nil)
                              ButtonType:JCAlertViewButtonTypeError
                             ButtonTitle:NSLocalizedString(SCENE_CANCEL, nil)
                                   Click:^{
                                       
                                   }
                              ButtonType:JCAlertViewButtonTypeError
                             ButtonTitle:NSLocalizedString(MESSAGE_OK, nil)
                                   Click:^{
                                       if([DooyaSDK dooyaUIGetLastLoginFlag])
                                       {
                                           [self dooyaUIShowProgressHUD:nil];
                                           [DooyaSDK dooyaUILoginSystem:[DooyaSDK dooyaUIGetLastLoginUserName]
                                                               PassWord:[DooyaSDK dooyaUIGetLastLoginUserPassword]
                                                             completion:^(NSError *error, id responseObject) {
                                                                 if (error.code == Open_Sdk_Success) {
                                                                     [self dooyaUIHiddenProgresHUD];
                                                                 }else {
                                                                     [self dooyaUIShowErrorAlertView:responseObject
                                                                                               title:NSLocalizedString(LOGIN_LOADING_FAILED, nil)
                                                                                          buttonType:JCAlertViewButtonTypeError];
                                                                 }
                                                             }];
                                       }else
                                       {
                                           [self dooyaUISkipToLoginView];
                                       }
                                   }];
}

-(void)dooyaUISkipToLoginView
{
    LoginVC* mLoginVC =[[LoginVC alloc] init];
    [self.navigationController pushViewController:mLoginVC animated:YES];
}

-(void)dooyaUIShowErrorAlertView:(NSString*) message
                           title:(NSString*) title
                      buttonType:(JCAlertViewButtonType) buttonType
{
    [JCAlertView showOneButtonWithTitle:title Message:message ButtonType:buttonType ButtonTitle:NSLocalizedString(MESSAGE_OK, nil) Click:^{
        
    }];
}

-(void)dooyaUIShowProgressHUD:(NSString*) title
{
    UIView *InView = (self.view.window==nil)?self.view:self.view.window;
    
    if (self.gMBProgressHUD == nil)
    {
        self.gMBProgressHUD = [[MBProgressHUD alloc] init];
    }
    [InView addSubview:self.gMBProgressHUD];
    [InView bringSubviewToFront:self.gMBProgressHUD];
    if (title)
    {
        self.gMBProgressHUD.labelText = title;
    }
    [self.tabBarController.tabBar setUserInteractionEnabled:NO];
    
    [self.gMBProgressHUD show:YES];
}

-(void)dooyaUIHiddenProgresHUD
{
    if (self.gMBProgressHUD)
    {
        [self.gMBProgressHUD removeFromSuperview];
    }
    [self.tabBarController.tabBar setUserInteractionEnabled:YES];
}

-(void)addleftBarButton:(NSString*)str
{
    WS(ws)
    if (self.gleftButton == nil)
    {
        self.gleftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, self.navIV.frame.size.height)];
        [self.gleftButton addTarget:self action:@selector(leftBarButtonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        [self.gleftButton setBackgroundColor:[UIColor clearColor]];
        [self.navIV addSubview:self.gleftButton];
        
        [self.gleftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(80, 44));
            make.left.equalTo(ws.navIV).with.offset(0);
            make.top.equalTo(ws.navIV).with.offset(20);
        }];
    }
    
    if (self.gLeftLabel == nil) {
        self.gLeftLabel = [[UILabel alloc] init];
        [self.gLeftLabel setTextAlignment:NSTextAlignmentLeft];
        [self.gLeftLabel setFont:[UIFont systemFontOfSize:15]];
        [self.gLeftLabel setTextColor:MAIN_COLOR];
        [self.gLeftLabel setText:str];
        [self.navIV addSubview:self.gLeftLabel];
        [self.gLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(200, 35));
            make.left.equalTo(ws.navIV).with.offset(16);
            make.top.equalTo(ws.navIV).with.offset(20+((64-55)/2.0f));
        }];
    }

}

-(void)leftBarButtonTouchUpInside
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addrightBarButton:(NSString*)str
{
    WS(ws);
    
    if (self.gRightButton == nil)
    {
        self.gRightButton = [[UIButton alloc] init];
        [self.gRightButton addTarget:self action:@selector(rightBarButtonTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        [self.navIV addSubview:self.gRightButton];
        
        [self.gRightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(80, 44));
            make.right.equalTo(ws.navIV).with.offset(0);
            make.bottom.equalTo(ws.navIV).with.offset(0);
        }];
    }
    
    self.gRightLabel = [[UILabel alloc] init];
    [self.gRightLabel setTextAlignment:NSTextAlignmentRight];
    [self.gRightLabel setFont:[UIFont systemFontOfSize:15]];
    [self.gRightLabel setTextColor:MAIN_COLOR];
    [self.gRightLabel setText:str];
    [self.navIV addSubview:self.gRightLabel];
    [self.gRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 35));
        make.right.equalTo(ws.navIV).with.offset(-16);
        make.top.equalTo(ws.navIV).with.offset(20+((64-55)/2.0f));
    }];
}

- (void)rightBarButtonTouchUpInside
{
    
}

@end
