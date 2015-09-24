//
//  UIImage+addition.m
//  YQImageEditerDome
//
//  Created by maygolf on 15/9/15.
//  Copyright (c) 2015年 maygolf. All rights reserved.
//

#import "UIImage+addition.h"

@implementation UIImage (addition)

//  裁剪图片
- (UIImage *)cutFromRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width, self.size.height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, rect);
    CGContextClip(context);
    
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(rect.size);
    context = UIGraphicsGetCurrentContext();
    [newImage drawInRect:CGRectMake(-rect.origin.x, -rect.origin.y, self.size.width, self.size.height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
