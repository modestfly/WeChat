//
//  YDLoginDataModel.h
//  WeChat
//
//  Created by test on 2018/9/12.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
//登录后接口的数据存储
@interface YDLoginDataModel : JSONModel

@property(nonatomic,copy) NSString *access_token;

@property(nonatomic,copy) NSString *token_type;

@property(nonatomic,copy) NSString *refresh_token;

@property(nonatomic,copy) NSString *expires_in;

@property(nonatomic,copy) NSString *scope;

@property(nonatomic,copy) NSString *jti;

+(YDLoginDataModel *)shareYDLoginDataModel;

@end
