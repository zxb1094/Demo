//
//  EditHubVC.h
//  Demo
//
//  Created by 赵旭波 on 2017/4/13.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "BaseViewController.h"

@interface EditHubVC : BaseViewController
@property(nonatomic,strong) HubInfo* hubInfo;
@property(nonatomic,strong) NSString* hubAddress;
@property(nonatomic,assign) BOOL isAdd;
@end
