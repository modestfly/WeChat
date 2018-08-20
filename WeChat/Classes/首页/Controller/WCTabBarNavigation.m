//
//  WCTabBarNavigation.m
//  WeChat
//
//  Created by test on 2018/8/20.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "WCTabBarNavigation.h"
@interface WCTabBarNavigation ()

@end

@implementation WCTabBarNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark push的时候隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    if (self.viewControllers.count > 0) {
        NSMutableString *crashControllerDescription = [[NSMutableString alloc] init];
        for (UIViewController *VC in self.viewControllers) {
            [crashControllerDescription appendString:NSStringFromClass([VC class])];
            [crashControllerDescription appendString:@";"];
        }
        [crashControllerDescription appendString:NSStringFromClass([viewController class])];
    }
    
    [super pushViewController:viewController animated:animated];
    
}

#pragma mark pop操作
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    NSMutableString *crashControllerDescription = [[NSMutableString alloc] init];
    
    for (int i = 0; i < self.viewControllers.count-1; i++) {
        UIViewController *VC = self.viewControllers[i];
        [crashControllerDescription appendString:NSStringFromClass([VC class])];
        [crashControllerDescription appendString:@";"];
    }
    
    return [super popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    NSMutableString *crashControllerDescription = [[NSMutableString alloc] init];
    // 找出要跳转的控制器的序号
    NSUInteger VCIndex = [self.viewControllers indexOfObject:viewController];
    
    for (int i = 0; i <= VCIndex; i++) {
        UIViewController *VC = self.viewControllers[i];
        [crashControllerDescription appendString:NSStringFromClass([VC class])];
        [crashControllerDescription appendString:@";"];
    }
    return [super popToViewController:viewController animated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    return [super popToRootViewControllerAnimated:animated];
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
