//
//  WCLoginViewController.m
//  WeChat
//
//  Created by test on 2018/8/17.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "WCLoginViewController.h"
#import "Utilities.h"
#import <Masonry.h>
#import "WCFrogetPasswordViewController.h"
#import "WCQuestionViewController.h"
#import "WCTabBarController.h"
@interface WCLoginViewController ()<UITextFieldDelegate>

@end

@implementation WCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self createLoginView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 界面搭建
#pragma mark 布局登录界面
- (void)createLoginView
{
    self.navigationItem.title = @"登录";

    UIImageView *wechatImageView = [[UIImageView alloc]initWithFrame:(CGRectMake(SCREEN_WIDTH/2-20, NAVANDSTATUSHEIGHT + 40, 40, 40))];
    
    wechatImageView.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview: wechatImageView];
    //用户名
    self.userNameTextField = [[UITextField alloc]init];
    self.userNameTextField.placeholder = @"请输入手机号码";
    self.userNameTextField.font=[UIFont systemFontOfSize:14];
    self.userNameTextField.delegate = self;
    self.userNameTextField.textColor=[Utilities colorWithHexString:@"#888888"];
    self.userNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.userNameTextField];
    //密码
    self.passWordTextField = [[UITextField alloc]init];
    self.passWordTextField.placeholder = @"请输入密码";
    self.passWordTextField.font=[UIFont systemFontOfSize:14];
    self.passWordTextField.delegate = self;
    self.passWordTextField.textColor=[Utilities colorWithHexString:@"#888888"];
    self.passWordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.passWordTextField];
    //登录按钮
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.titleLabel.font=[UIFont systemFontOfSize:18];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"蓝色选框-圆角"] forState:UIControlStateNormal];
    [loginButton setTitle:@"确定" forState:UIControlStateNormal];
    [loginButton setTitleColor:[Utilities colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginBtClick) forControlEvents:UIControlEventTouchUpInside];
    loginButton.userInteractionEnabled=YES;
    [self.view addSubview:loginButton];
    //忘记密码
    UIButton *frogetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    frogetButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [frogetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [frogetButton setTitleColor:[Utilities colorWithHexString:@"#888888"] forState:UIControlStateNormal];
    [frogetButton addTarget:self action:@selector(frogetBtClick) forControlEvents:UIControlEventTouchUpInside];
    frogetButton.userInteractionEnabled = YES;
    [self.view addSubview:frogetButton];
    //问题反馈
    UIButton *questionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    questionButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [questionButton setTitle:@"问题反馈" forState:UIControlStateNormal];
    [questionButton setTitleColor:[Utilities colorWithHexString:@"#888888"] forState:UIControlStateNormal];
    [questionButton addTarget:self action:@selector(questionBtClick) forControlEvents:UIControlEventTouchUpInside];
    questionButton.userInteractionEnabled = YES;
    [self.view addSubview:questionButton];
    //手机注册
    UIButton *phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    phoneButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [phoneButton setTitle:@"手机注册" forState:UIControlStateNormal];
    [phoneButton setTitleColor:[Utilities colorWithHexString:@"#888888"] forState:UIControlStateNormal];
    [phoneButton addTarget:self action:@selector(phoneBtClick) forControlEvents:UIControlEventTouchUpInside];
    phoneButton.userInteractionEnabled = YES;
    [self.view addSubview:phoneButton];
    //微信登录
    UIButton *chatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    chatButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [chatButton setTitle:@"微信登录" forState:UIControlStateNormal];
    [chatButton setTitleColor:[Utilities colorWithHexString:@"#888888"] forState:UIControlStateNormal];
    [chatButton addTarget:self action:@selector(chatBtClick) forControlEvents:UIControlEventTouchUpInside];
    chatButton.userInteractionEnabled = YES;
    [self.view addSubview:chatButton];
    //QQ登录
    UIButton *qqButton = [UIButton buttonWithType:UIButtonTypeCustom];
    qqButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [qqButton setTitle:@"QQ登录" forState:UIControlStateNormal];
    [qqButton setTitleColor:[Utilities colorWithHexString:@"#888888"] forState:UIControlStateNormal];
    [qqButton addTarget:self action:@selector(qqBtClick) forControlEvents:UIControlEventTouchUpInside];
    qqButton.userInteractionEnabled = YES;
    [self.view addSubview:qqButton];
    
    
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(wechatImageView);
        make.top.equalTo(wechatImageView.mas_bottom).offset(30);
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(40);
    }];
    [self.passWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(wechatImageView);
        make.top.equalTo(self.userNameTextField.mas_bottom).offset(5);
        make.width.equalTo(self.userNameTextField);
        make.left.equalTo(self.userNameTextField);
        make.height.equalTo(self.userNameTextField);
    }];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(wechatImageView);
        make.top.equalTo(self.passWordTextField.mas_bottom).offset(10);
        make.width.equalTo(self.userNameTextField);
        make.left.equalTo(self.userNameTextField);
        make.height.equalTo(self.userNameTextField);
        
    }];
     [frogetButton mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(loginButton.mas_bottom).offset(10);
         make.height.mas_equalTo(15);
         make.width.mas_equalTo(60);
         make.right.mas_equalTo(-SCREEN_WIDTH/2);
    }];
    [questionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(frogetButton);
        make.width.equalTo(frogetButton);
        make.height.equalTo(frogetButton);
        make.left.equalTo(frogetButton.mas_right);
    }];
    [phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-40);
        make.width.equalTo(frogetButton);
        make.height.equalTo(frogetButton);
        make.left.equalTo(self.view).offset((SCREEN_WIDTH - 180)/4);
    }];
    [chatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneButton);
        make.height.equalTo(phoneButton);
        make.width.equalTo(phoneButton);
        make.left.equalTo(phoneButton.mas_right).offset((SCREEN_WIDTH - 180)/4);
    }];
    [qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneButton);
        make.right.equalTo(self.view).offset(-(SCREEN_WIDTH - 180)/4);
        make.height.equalTo(phoneButton);
        make.width.equalTo(phoneButton);
    }];
    
}
#pragma mark textField 协议方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
}

#pragma mark 点击背景后键盘隐藏
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.userNameTextField resignFirstResponder];
    [self.passWordTextField resignFirstResponder];
}
#pragma mark 登陆按钮点击事件
- (void)loginBtClick{
    [self.userNameTextField resignFirstResponder];
    [self.passWordTextField resignFirstResponder];
    [self goToMain];
}
#pragma mark 跳转到主界面
-(void)goToMain{
    
    WCTabBarController *tabCon = [[WCTabBarController alloc]init];
    [self.navigationController pushViewController:tabCon animated:YES];
}
#pragma mark 忘记密码点击按钮
-(void)frogetBtClick{
    
    
}
#pragma mark 问题反馈点击按钮
-(void)questionBtClick{
    
    
}
#pragma mark 手机注册
-(void)phoneBtClick{
    
}
#pragma mark 微信登录
-(void)chatBtClick{
    
}
#pragma mark QQ登录
-(void)qqBtClick{
    

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
