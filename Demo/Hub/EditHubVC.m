//
//  EditHubVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/13.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "EditHubVC.h"
#import "HubVC.h"

@interface EditHubVC ()
{
    NSString* nameStr;
}
@end

@implementation EditHubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addrightBarButton:NSLocalizedString(LOGIN_DONE, nil)];
    
    self.mTableView = [[UITableView alloc]init];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.frame = CGRectMake(0, 64, self.view.frame.size.width,100);
    [self.mTableView setEditing:NO];
    self.mTableView.scrollEnabled = NO;
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
        make.top.equalTo(ws.view).with.offset(200);
        make.centerX.equalTo(ws.view.mas_centerX);
        make.height.equalTo(@45);
        make.width.equalTo(@300);
    }];
    
    if (self.isAdd) {
        gDelBtn.hidden = YES;
        nameStr = self.hubAddress;
    }else {
        [self addleftBarButton:NSLocalizedString(LOGIN_BACK, nil)];
        gDelBtn.hidden = NO;
        nameStr = self.hubInfo.hubName;
    }
}

- (void)rightBarButtonTouchUpInside
{
    [self dooyaUIShowProgressHUD:nil];
    if (self.isAdd) {
        [DooyaSDK dooyaUIBindHubToCurrentAccount:-1
                                      macAddress:self.hubAddress
                                            name:nameStr
                                      completion:^(NSError *error, id responseObject) {
                                          
                                          [self dooyaUIHiddenProgresHUD];
                                          if (error.code == Open_Sdk_Success)
                                          {
                                              for (UIViewController* view in self.navigationController.viewControllers)
                                              {
                                                  if ([view isKindOfClass:[HubVC class]])
                                                  {
                                                      [self.navigationController popToViewController:view animated:NO];
                                                  }
                                              }
                                          }else
                                          {
                                              
                                              [JCAlertView showOneButtonWithTitle:NSLocalizedString(MESSAGE_ERROR, nil) Message:[NSString stringWithFormat:@"%@",error] ButtonType:JCAlertViewButtonTypeError ButtonTitle:NSLocalizedString(MESSAGE_OK, nil) Click:^{
                                                  
                                              }];
                                          }
                                          
                                      }];

    }else {
        [DooyaSDK dooyaUIEditHubNameWithLocationID:-1
                                            hubMac:self.hubInfo.hubMac
                                              name:nameStr
                                        completion:^(NSError *error, id responseObject){
                                            [self dooyaUIHiddenProgresHUD];
                                            [NSObject cancelPreviousPerformRequestsWithTarget:self];
                                            if (error.code == Open_Sdk_Success)
                                            {
                                                [self.navigationController popViewControllerAnimated:YES];
                                            }else
                                            {
                                                [JCAlertView showOneButtonWithTitle:NSLocalizedString(MESSAGE_ERROR, nil) Message:[NSString stringWithFormat:@"%@",error] ButtonType:JCAlertViewButtonTypeError ButtonTitle:NSLocalizedString(MESSAGE_OK, nil) Click:^{
                                                    
                                                }];
                                            }
                                        }];

    }
}

- (void)btnDelClick
{
    [self dooyaUIShowProgressHUD:nil];
    
    [DooyaSDK dooyaUIUnBindDeviceWithLocationID:-1
                                         hubMac:self.hubInfo.hubMac
                                         hubDid:self.hubInfo.hubDid
                                     completion:^(NSError *error, id responseObject) {
                                         
                                         [self dooyaUIHiddenProgresHUD];
                                         [NSObject cancelPreviousPerformRequestsWithTarget:self];
                                         
                                         if (error.code == Open_Sdk_Success)
                                         {
                                             [self.navigationController popViewControllerAnimated:YES];
                                         }else
                                         {
                                             [self dooyaUIShowErrorAlertView:responseObject
                                                                       title:NSLocalizedString(LOGIN_FAIL, nil)
                                                                  buttonType:JCAlertViewButtonTypeError];
                                         }
                                     }];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.backgroundView = nil;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    
    return 44;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    return 1;
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
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ : %@",NSLocalizedString(HUB_NAME, nil),nameStr];
    
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

    }
}


@end
