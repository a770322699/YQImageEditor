//
//  ViewController.m
//  Demo
//
//  Created by maygolf on 15/9/16.
//  Copyright (c) 2015年 maygolf. All rights reserved.
//

#import "ViewController.h"
#import "MGCEditImageViewController.h"

@interface ViewController ()<MGCEditImageViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)editImage:(id)sender {
    
    MGCEditImageViewController *controller = [[MGCEditImageViewController alloc] init];
    controller.editStyle = MGCEditSelectImageViewShapeStyle_circle;
    controller.ratioW_Y = 1;
    controller.suitableWidth = 100;
    controller.delegate = self;
    controller.image = [UIImage imageNamed:@"girl.jpg"];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - MGCEditImageViewControllerDelegate
// 编辑完成
- (void)editDidFinsh:(MGCEditImageViewController *)controller originalImage:(UIImage *)originalImage editImage:(UIImage *)editImage
{
    [UIImageJPEGRepresentation(editImage, 1) writeToFile:@"/Users/yanghy/Desktop/editImgae.jpg" atomically:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
// 编辑取消
- (void)editCancel:(MGCEditImageViewController *)controller origiinalImage:(UIImage *)originalImage
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
