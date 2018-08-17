//
//  WCLoginViewController.m
//  WeChat
//
//  Created by test on 2018/8/17.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "WCLoginViewController.h"
#import "Utilities.h"
#import <Masonry.h>
@interface WCLoginViewController ()

@end

@implementation WCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLoginView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 界面搭建
#pragma mark 布局登录界面
- (void)createLoginView
{
    self.navigationItem.title = @"登录";
    UIImageView *wechatImageView = [[UIImageView alloc]initWithFrame:(CGRectMake(SCREEN_WIDTH/2-20, NAVANDSTATUSHEIGHT + 40, 40, 40))];
    
    wechatImageView.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview: wechatImageView];
    
    
                                                                     
                                                                     
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
