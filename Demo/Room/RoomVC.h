//
//  RoomVC.h
//  Demo
//
//  Created by 赵旭波 on 2017/4/14.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "BaseViewController.h"
@protocol dooyaUISetDeviceRoomDelegate <NSObject>

-(void)dooyaUISetDeviceRoom:(RoomInfo*) room;

@end
@interface RoomVC : BaseViewController
@property(nonatomic,assign) BOOL isAdd;
@property(weak, nonatomic) id <dooyaUISetDeviceRoomDelegate> delegate;
@end
