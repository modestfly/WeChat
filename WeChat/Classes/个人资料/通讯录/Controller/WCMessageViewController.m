//
//  WCMessageViewController.m
//  WeChat
//
//  Created by test on 2018/8/22.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "WCMessageViewController.h"
#import "WCMessageTableViewCell.h"
#import "WCSearchFriendsViewController.h"
@interface WCMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation WCMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"通讯录";
    [self creatBasicView];
    // Do any additional setup after loading the view.
}
#pragma mark 创建界面
-(void)creatBasicView{
    //创建导航栏的左侧按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 34, 16)];
    [button setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [button addTarget:self action:@selector(backForword) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backButton;
    //创建导航栏的右侧的按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 44, 16);
    rightButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightButton setTitle:@"添加好友" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:tableView];
}
#pragma mark UITableViewDataSource和UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WCMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell){
        cell = [[WCMessageTableViewCell alloc] init];
    }
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了吗");
}
#pragma mark 点击右侧导航栏按钮跳转的方法
-(void)rightButtonClick{
    
    WCSearchFriendsViewController *searchVC = [[WCSearchFriendsViewController alloc] init];
    
    [self.navigationController pushViewController:searchVC animated:YES];
    
}
-(void)backForword{
    [self.navigationController popViewControllerAnimated:YES];
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
