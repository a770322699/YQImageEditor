//
//  MGCEditSelectImageView.m
//  maygolf
//
//  Created by maygolf on 15/9/11.
//  Copyright (c) 2015年 maygolf. All rights reserved.
//

#import "MGCEditSelectImageView.h"

@interface MGCEditSelectImageView ()

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) MGCEditSelectImageViewShapeStyle style;

@end

@implementation MGCEditSelectImageView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (self.superview) {
        CGContextAddRect(context, CGRectMake(-self.frame.origin.x - 1, -self.frame.origin.y - 1, self.superview.frame.size.width + 2, self.superview.frame.size.height + 2));
    }else{
        CGContextAddRect(context, self.bounds);
    }
    
    [self drawShapeContext:context];
    
    [[UIColor whiteColor] setStroke];
    [[[UIColor blackColor] colorWithAlphaComponent:0.6] setFill];
    CGContextDrawPath(context, kCGPathEOFillStroke);
    
}

#pragma mark - pravate
- (void)drawShapeContext:(CGContextRef)context
{
    if (self.width || self.height) {
        if (self.width <= 0 && self.height > 0) {
            self.width = self.height;
        }else if (self.height <= 0 && self.width > 0){
            self.height = self.width;
        }
        
        CGFloat x = (self.frame.size.width - self.width) / 2;
        CGFloat y = (self.frame.size.height - self.height) / 2;
        
        CGRect rect = CGRectMake(x, y, self.width, self.height);
        
        if (self.style == MGCEditSelectImageViewShapeStyle_rect) {
            CGContextAddRect(context, rect);
        }else if (self.style == MGCEditSelectImageViewShapeStyle_circle){
            CGContextAddEllipseInRect(context, rect);
        }
    }

}

#pragma mark - public
- (void)drawShapeWithWidth:(CGFloat)width height:(CGFloat)height shapeStyle:(MGCEditSelectImageViewShapeStyle)style
{
    self.width = width;
    self.height = height;
    self.style = style;
    
    [self setNeedsDisplay];
}

@end
