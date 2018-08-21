//
//  WCSocketConnect.h
//  WeChat
//
//  Created by test on 2018/8/20.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCSocketConnect : NSObject

//单例的一个方法
+(instancetype)shareinstance;
//连接
-(void)connect;
//断开连接
-(void)disconnect;
//发送消息
-(void)sendMsg:(NSString *)msg;

@end
