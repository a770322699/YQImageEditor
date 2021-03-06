//
//  YQEditImageViewController.h
//  maygolf
//
//  Created by maygolf on 15/9/11.
//  Copyright (c) 2015年 maygolf. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YQEditSelectImageView.h"

@class YQEditImageViewController;

@protocol MGCEditImageViewControllerDelegate <NSObject>

// 编辑完成
- (void)editDidFinsh:(YQEditImageViewController *)controller originalImage:(UIImage *)originalImage editImage:(UIImage *)editImage;
// 编辑取消
- (void)editCancel:(YQEditImageViewController *)controller origiinalImage:(UIImage *)originalImage;

@end

@interface YQEditImageViewController : UIViewController

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) MGCEditSelectImageViewShapeStyle editStyle;      //
@property (nonatomic, assign) CGFloat ratioW_Y;                 // 宽高比      // 默认为1
@property (nonatomic, assign) CGFloat suitableWidth;            // 最适合的宽度，或者直径

@property (nonatomic, weak) id<MGCEditImageViewControllerDelegate>delegate;

@end
