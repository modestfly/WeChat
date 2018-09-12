//
//  UIToastView.h
//  WeChat
//
//  Created by test on 2018/9/11.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIToastView : NSObject
{
    UIImageView * toastView;
}

@property (nonatomic,strong) UIImageView * toastView;

#pragma mark - 便利方法，提示框有默认的Frame，默认的Frame是KTOASTLA

+ (void)showToastViewWithContent:(NSString *)content andTime:(float)time andObject:(UIViewController *)selfController;

#pragma mark - 完整的方法，没有默认的frame

+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController;

@end
