//
//  WCTabBarController.m
//  WeChat
//
//  Created by test on 2018/8/20.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "WCTabBarController.h"
#import "WCTabBarNavigation.h"
#import "WCMainViewController.h"
#import "WCChatListViewController.h"
#import "WCMyDetailViewController.h"
#import "WCSearchListViewController.h"
#import "AppDelegate.h"
@interface WCTabBarController ()<UITabBarControllerDelegate>

@end
@implementation WCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];

    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.tabBarCtrl = self;
}

#pragma mark 添加子控制器
-(void)addChildViewControllers{
    
    WCMainViewController *mainVC = [[WCMainViewController alloc]init];
    [self setupChildViewController:mainVC title:@"首页" normalName:@"" selectedName:@""];
    
    WCSearchListViewController *searchVC = [[WCSearchListViewController alloc]init];
    [self setupChildViewController:searchVC title:@"探索" normalName:@"" selectedName:@""];
    
    WCChatListViewController *chatVC = [[WCChatListViewController alloc]init];
    [self setupChildViewController:chatVC title:@"消息" normalName:@"" selectedName:@""];
    
    WCMyDetailViewController *myDetailVC = [[WCMyDetailViewController alloc]init];
    [self setupChildViewController:myDetailVC title:@"我的" normalName:@"" selectedName:@""];
    
    
    
}

#pragma mark 设置控制器
- (void)setupChildViewController:(UIViewController *)childViewController title:(NSString *)title normalName:(NSString *)normalName selectedName:(NSString *)selectedName {
    
    // 设置子控制器的标题
    childViewController.title = title;
    
    // 设置标签按钮
    // 普通按钮
    UIImage *normalImage = [UIImage imageNamed:normalName];
    UIImage *selectedImage = [UIImage imageNamed:selectedName];
    
    // 选中样式被系统重新渲染，需要设置选中样式不要被渲染(图片本身样式显示，不要渲染)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage];
    
    // 创建导航栏控制器
    WCTabBarNavigation *nav = [[WCTabBarNavigation alloc] initWithRootViewController:childViewController];
    

    
    // 添加子控制器
    [self addChildViewController:nav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
