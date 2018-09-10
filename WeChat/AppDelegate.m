//
//  AppDelegate.m
//  WeChat
//
//  Created by test on 2018/8/17.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "AppDelegate.h"
#import "WCLoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //程序视图搭建开始
    [self setupRootViewController];
    // 设置外观代理
    [self setupWCappearence];
    
    return YES;
}

#pragma mark 设置根控制器
-(void) setupRootViewController{
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    WCLoginViewController *viewcontroller = [[WCLoginViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewcontroller];
    
    self.window.rootViewController = nav;
    
    self.rootnavCtrl = nav;
    
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self.window makeKeyAndVisible];
    
    
    
}
#pragma mark 设置外观及控制器的字体
- (void)setupWCappearence {
    //设置导航栏字体颜色与大小
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                                         NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
    
    [UINavigationBar appearance].backgroundColor = [UIColor blueColor];
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
