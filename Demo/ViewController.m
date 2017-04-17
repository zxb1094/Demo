//
//  ViewController.m
//  Demo
//
//  Created by 赵旭波 on 2017/4/13.
//  Copyright © 2017年 赵旭波. All rights reserved.
//

#import "ViewController.h"
#import "LoginVC.h"
@interface ViewController ()
{
    UINavigationController *mRootNavigationController;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    if (mRootNavigationController == nil)
    {
        LoginVC* mLoginVC = [[LoginVC alloc] init];
        mRootNavigationController = [[UINavigationController alloc] initWithRootViewController:mLoginVC];
        [mRootNavigationController setNavigationBarHidden:YES];
        
    }
    mRootNavigationController.view.frame = self.view.frame;
    
    [self.view addSubview:mRootNavigationController.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
