//
//  HubVC.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/13.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "HubVC.h"
#import "EditHubVC.h"
#import "AddHubVC.h"

@interface HubVC ()
{
    NSMutableArray *hubArray;
}
@end

@implementation HubVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addleftBarButton:NSLocalizedString(LOGIN_BACK, nil)];
    [self addrightBarButton:NSLocalizedString(MAIN_ADD, nil)];
    
    self.mTableView = [[UITableView alloc]init];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.frame = CGRectMake(0, 76, self.view.frame.size.width,self.view.frame.size.height - 64);
    
    
    [self.view addSubview:self.mTableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    hubArray = [DooyaSDK dooyaUIGetHostList:-1];
    [self.mTableView reloadData];
}

- (void)rightBarButtonTouchUpInside
{
    AddHubVC* mAddHubVC = [[AddHubVC alloc] init];
    [self.navigationController pushViewController:mAddHubVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.backgroundView = nil;
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    
    return 44;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (hubArray.count == 0) {
        tableView.alpha = 0.0f;
    }else {
        tableView.alpha = 1.0f;
    }
    tableView.opaque = NO;
    tableView.separatorStyle = NO;
    return hubArray.count;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.editing) {
        return UITableViewCellEditingStyleDelete;
    }
    
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
    
    HubInfo *hostInfo = [[HubInfo alloc]init];
    hostInfo  = [hubArray objectAtIndex:indexPath.row];
    if (!hostInfo.isOnline) {
        cell.textLabel.textColor = [UIColor lightGrayColor];
    }
    cell.textLabel.text = hostInfo.hubName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    HubInfo* hub = [hubArray objectAtIndex:indexPath.row];
    EditHubVC* mEditHubVC = [[EditHubVC alloc] init];
    mEditHubVC.hubInfo = hub;
    mEditHubVC.isAdd = NO;
    [self.navigationController pushViewController:mEditHubVC animated:YES];
}



@end
