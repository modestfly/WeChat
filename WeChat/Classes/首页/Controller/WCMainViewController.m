//
//  WCMainViewController.m
//  WeChat
//
//  Created by test on 2018/8/20.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "WCMainViewController.h"
#import "Utilities.h"
#import "YDProductListViewController.h"
#import "YDSendListViewController.h"
@interface WCMainViewController ()

@property(nonatomic,strong)UIScrollView *mainScrollView;

@property(nonatomic,strong)UIScrollView *bottomScrollView;
@end

@implementation WCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationItem.title = @"";

    //[[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    //基本的tableview的界面布局
    [self creatBasicView];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationItem setHidesBackButton:YES];
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor blueColor]];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}
#pragma mark 创建界面
-(void)creatBasicView{
    
    self.mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.mainScrollView.backgroundColor = [UIColor  whiteColor];
    self.mainScrollView.userInteractionEnabled = YES;
    self.mainScrollView.showsVerticalScrollIndicator = YES;
    self.mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 1.2);
    [self.view addSubview:self.mainScrollView];
    
    NSArray *labelArray = [[NSArray alloc]initWithObjects:@"信息刷新",@"未读信息",@"查看",@"测试",@"兑换券",@"交通查询",@"办公服务",@"快递",@"打印",@"通讯录",@"日记本",@"订阅", nil];
    
    NSArray *imageArray = [[NSArray alloc]initWithObjects:@"展示刷新",@"消息盒子",@"我的应标",@"客源兑换",@"派单管理",@"签约审核",@"实时工地",@"抢客户",@"客户预约",@"工人认证",@"工地管理",@"案例管理", nil];
    
    
    for (NSUInteger i = 0; i < 12; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 10000 + i;
        button.frame = CGRectMake((i + 1 )%4 * SCREEN_WIDTH/4, i / 4 * SCREEN_WIDTH/4-22, SCREEN_WIDTH/4, SCREEN_WIDTH/4);
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainScrollView addSubview:button];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/8 -17, SCREEN_WIDTH/8 -17, 34, 34)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[i]]];
        [button addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH/4 -22, SCREEN_WIDTH/4, 20)];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor lightGrayColor];
        label.text = [NSString stringWithFormat:@"%@",labelArray[i]];
        label.textAlignment = NSTextAlignmentCenter;
        [button addSubview:label];
        
    }
    self.bottomScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*3/4-22, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_WIDTH*3/4)];
    self.bottomScrollView.backgroundColor = [UIColor lightGrayColor];
    self.bottomScrollView.userInteractionEnabled = YES;
    self.bottomScrollView.showsVerticalScrollIndicator = YES;
    self.bottomScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, (SCREEN_HEIGHT-SCREEN_WIDTH*3/4) *1.1);
    [self.mainScrollView addSubview:self.bottomScrollView];
}

-(void)buttonAction:(UIButton *)sender{
    //跳转界面
    if (sender.tag == 10003) {
        YDProductListViewController *productVC = [[YDProductListViewController alloc] init];
         [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:productVC animated:YES];
        
    }
    //跳转界面
    else if (sender.tag == 10000){
        YDSendListViewController *sendVC = [[YDSendListViewController alloc] init];
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        [self.navigationController pushViewController:sendVC animated:YES];
        
    }
    //先暂不处理
    else{
        
        
    }
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
