//
//  RoomVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/14.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "RoomVC.h"
#import "EditRoomVC.h"

@interface RoomVC ()
{
    NSMutableArray* roomArray;
}
@end

@implementation RoomVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addleftBarButton:NSLocalizedString(LOGIN_BACK, nil)];
    if (!self.isAdd) {
        [self addrightBarButton:NSLocalizedString(MAIN_ADD, nil)];
    }
    
    self.mTableView = [[UITableView alloc]init];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.frame = CGRectMake(0, 76, self.view.frame.size.width,self.view.frame.size.height-64);
    [self.mTableView setEditing:NO];
    [self.view addSubview:self.mTableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    roomArray = [DooyaSDK dooyaUIGetRoomList];
    [self.mTableView reloadData];
}

- (void)rightBarButtonTouchUpInside
{
    EditRoomVC* mEditRoomVC = [[EditRoomVC alloc] init];
    mEditRoomVC.isAdd = YES;
    [self.navigationController pushViewController:mEditRoomVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.backgroundView = nil;
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    
    return 44;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (roomArray.count == 0) {
        tableView.alpha = 0.0f;
    }else {
        tableView.alpha = 1.0f;
    }
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    return roomArray.count;
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
    
    RoomInfo *room = [[RoomInfo alloc]init];
    room  = [roomArray objectAtIndex:indexPath.row];
    cell.textLabel.text = room.roomName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    if (self.isAdd) {
        if (self.delegate)
        {
            [self.delegate dooyaUISetDeviceRoom:[roomArray objectAtIndex:indexPath.row]];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        EditRoomVC* mEditRoomVC = [[EditRoomVC alloc] init];
        mEditRoomVC.isAdd = NO;
        mEditRoomVC.room = [roomArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:mEditRoomVC animated:YES];
    }
    
}

@end
