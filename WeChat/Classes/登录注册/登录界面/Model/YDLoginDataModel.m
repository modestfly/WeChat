//
//  YDLoginDataModel.m
//  WeChat
//
//  Created by test on 2018/9/12.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "YDLoginDataModel.h"

static YDLoginDataModel *_ydLoginDataModel = nil;

@implementation YDLoginDataModel

+(YDLoginDataModel *)shareYDLoginDataModel{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
  
        _ydLoginDataModel = [[YDLoginDataModel alloc]init];
        
    });
    
    return _ydLoginDataModel;
}
-(instancetype)init{
    
    self = [super init];
    if (self) {
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        self.access_token = [userDefault objectForKey:@""];
        self.token_type = [userDefault objectForKey:@""];
        self.refresh_token = [userDefault objectForKey:@""];
        self.expires_in = [userDefault objectForKey:@""];
        self.scope = [userDefault objectForKey:@""];
        self.jti = [userDefault objectForKey:@""];
        [userDefault synchronize];
        return self;
    }
    
    return nil;
    
}
@end

