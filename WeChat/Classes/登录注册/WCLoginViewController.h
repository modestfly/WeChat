//
//  WCLoginViewController.h
//  WeChat
//
//  Created by test on 2018/8/17.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "WCBaseViewController.h"

@interface WCLoginViewController : WCBaseViewController
/**
 *  用户名输入框
 */
@property(nonatomic,strong) UITextField * userNameTextField;

/**
 *  密码输入框
 */
@property(nonatomic,strong) UITextField * passWordTextField;

@end
