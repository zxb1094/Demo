//
//  BaseViewController.h
//  Demo
//
//  Created by 赵旭波 on 2017/4/13.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface BaseViewController : UIViewController
@property(nonatomic,strong) MBProgressHUD* gMBProgressHUD;
@property(nonatomic,strong) UIButton* gleftButton;
@property(nonatomic,strong) UIView *navIV;
@property(nonatomic,strong) UILabel* gLeftLabel;
@property(nonatomic,strong) UIButton* gRightButton;
@property(nonatomic,strong) UILabel* gRightLabel;
@property(nonatomic,strong) UITableView* mTableView;


-(void)viewCallBack:(Result*) result;

-(void)dooyaUIShowProgressHUD:(NSString*) title;

-(void)dooyaUIHiddenProgresHUD;
-(void)dooyaUIShowErrorAlertView:(NSString*) message
                           title:(NSString*) title
                      buttonType:(JCAlertViewButtonType) buttonType;

-(void)addleftBarButton:(NSString*)str;
-(void)leftBarButtonTouchUpInside;
-(void)addrightBarButton:(NSString*)str;
- (void)rightBarButtonTouchUpInside;
@end
