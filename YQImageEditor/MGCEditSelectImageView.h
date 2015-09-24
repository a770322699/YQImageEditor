//
//  MGCEditSelectImageView.h
//  maygolf
//
//  Created by maygolf on 15/9/11.
//  Copyright (c) 2015年 maygolf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MGCEditSelectImageViewShapeStyle) {
    MGCEditSelectImageViewShapeStyle_rect,
    MGCEditSelectImageViewShapeStyle_circle,
};

@interface MGCEditSelectImageView : UIView

@property (nonatomic, readonly) CGFloat width;
@property (nonatomic, readonly) CGFloat height;

@property (nonatomic, readonly) MGCEditSelectImageViewShapeStyle style;

/**
 *  画形状
 *
 *  @param width  宽度、长半径
 *  @param height 高度、短半径
 *  @param style  形状类型，当画矩形时，若width或者height中的一个为0，那么画正方形，当画椭圆时，若width或者height为0时，画圆
 */
- (void)drawShapeWithWidth:(CGFloat)width height:(CGFloat)height shapeStyle:(MGCEditSelectImageViewShapeStyle)style;

@end
