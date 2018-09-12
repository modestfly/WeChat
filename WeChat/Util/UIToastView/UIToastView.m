//
//  UIToastView.m
//  WeChat
//
//  Created by test on 2018/9/11.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "UIToastView.h"
#import <QuartzCore/QuartzCore.h>
#import "Utilities.h"
@implementation UIToastView
@synthesize toastView;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}
#pragma mark - 便利方法，提示框有默认的Frame，默认的Frame是KTOASTLA

+ (void)showToastViewWithContent:(NSString *)content andTime:(float)time andObject:(UIViewController *)selfController
{
    [UIToastView showToastViewWithContent:content andRect:KTOASTLA andTime:time andObject:selfController];
}


#pragma mark - 完整的方法，没有默认的frame

+ (void)showToastViewWithContent:(NSString *)content andRect:(CGRect)rect andTime:(float)time andObject:(UIViewController *)selfController
{
    if ([selfController.view viewWithTag:1234554321]) {
        UIView * tView = [selfController.view viewWithTag:1234554321];
        [tView removeFromSuperview];
    }
    
    UIView * toastView = nil;
    toastView = [[UIView alloc] initWithFrame:rect];
    toastView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
    [toastView.layer setCornerRadius:8.0f];
    [toastView.layer setMasksToBounds:YES];
    [toastView setTag:1234554321];
    [selfController.view addSubview:toastView];
    
    CGSize labelSize = [content sizeWithFont:[UIFont systemFontOfSize:17.0f]
                           constrainedToSize: CGSizeMake( rect.size.width ,MAXFLOAT)
                               lineBreakMode: NSLineBreakByWordWrapping];
    if (labelSize.height > rect.size.height) {
        [toastView setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, labelSize.height)];
    }
    UILabel * contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, toastView.frame.size.width - 20, toastView.frame.size.height)];
    [contentLabel setText:content];
    [contentLabel setTextColor:[UIColor whiteColor]];
    [contentLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [contentLabel setTextAlignment:NSTextAlignmentCenter];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [contentLabel setNumberOfLines:0];
    [contentLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [toastView addSubview:contentLabel];
    
    if (time>0.01) {
        [self performSelector:@selector(removeToastView:) withObject:selfController afterDelay:time];
    }
}

+ (void)removeToastView:(id)sender
{
    UIViewController * selfController = (UIViewController *)sender;
    UIView * toastView = [selfController.view viewWithTag:1234554321];
    [toastView removeFromSuperview];
    toastView = nil;
}

@end
