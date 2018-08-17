//
//  Utilities.h
//  WeChat
//
//  Created by test on 2018/8/17.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import <Foundation/Foundation.h>

//屏幕宽度
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
//导航栏+状态栏的高度
#define NAVANDSTATUSHEIGHT self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height
//toast位置
#define KTOASTLA CGRectMake((SCREEN_WIDTH - 200)/2.0, SCREEN_HEIGHT/2-50-NAVIGATIONBAR_HEIGHT, 200, 50)
@interface Utilities : NSObject

@end
