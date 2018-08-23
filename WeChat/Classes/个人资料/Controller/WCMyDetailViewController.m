//
//  WCMyDetailViewController.m
//  WeChat
//
//  Created by test on 2018/8/20.
//  Copyright © 2018年 SkyFly. All rights reserved.
//

#import "WCMyDetailViewController.h"

@interface WCMyDetailViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@end

@implementation WCMyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navigationItem.title = @"我的";
    UIButton *zhibo = [UIButton buttonWithType:UIButtonTypeCustom];
    zhibo.frame = CGRectMake(100, 100, 100, 100);
    zhibo.backgroundColor = [UIColor purpleColor];
    [zhibo setTitle:@"头像" forState:UIControlStateNormal];
    [zhibo addTarget:self action:@selector(zhiboAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zhibo];

    // Do any additional setup after loading the view.
}
-(void)zhiboAction{
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了相册");
        [self uploadImageFromPhotoAlbum];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了相机");
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    [self presentViewController:actionSheet animated:YES completion:^{
        
    }];
    
}
//访问相册
-(void)uploadImageFromPhotoAlbum{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.delegate = self;
        imagePicker.sourceType = sourceType;
        imagePicker.allowsEditing = YES;
    
        [self presentViewController:imagePicker animated:YES completion:nil];
    
    } else {
        NSLog(@"相册不管用啊");
    }
}
#pragma mark -－ UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];
        NSLog(@"%@",image);
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

//访问摄像头
-(void)uploadImageFromCamera{
    
    
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
