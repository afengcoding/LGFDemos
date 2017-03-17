//
//  LGFButton.m
//  LGFDemo
//
//  Created by qddios2 on 16/6/17.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFButton.h"

@interface LGFButton ()
@property (nonatomic, assign) CGRect titleRect;
@property (nonatomic, assign) CGRect imageRect;
@property (nonatomic, assign) CGRect contentRect;
@property (nonatomic, assign) CGRect newRect;

@end

@implementation LGFButton


- (CGRect)backgroundRectForBounds:(CGRect)bounds
{
    return bounds;
}

- (CGRect)contentRectForBounds:(CGRect)bounds
{

    self.contentRect = bounds;

    return bounds;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    self.titleRect = contentRect;
    CGRect rect;
    switch (_btype) {
        case ButtonTypeTopImage:
        {
            CGFloat x = self.imageRect.origin.x;
            CGFloat y = CGRectGetMaxY(self.imageRect) + self.titleEdgeInsets.top;
            CGFloat w = CGRectGetWidth(contentRect);
            CGFloat h = CGRectGetHeight(contentRect);
            rect = CGRectMake(x, y, w, h);
            self.titleRect = rect;
            CGRect newRect = CGRectMake(self.contentRect.origin.x, self.contentRect.origin.y, self.contentRect.size.width,CGRectGetMaxY(self.titleRect));
            [self contentRectForBounds:newRect];
            [self backgroundRectForBounds:newRect];
            self.newRect = newRect;
        
            break;}
        case ButtonTypeLeftImage:
        {
            break;}
        case ButtonTypeRightImage:
        {
            break;}
        case ButtonTypeBottomImage:
        {
            break;}
            
        default:
            break;
    }
    return rect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    self.imageRect = contentRect;
    CGRect rect;
    switch (_btype) {
        case ButtonTypeTopImage:
        {
            CGFloat x = contentRect.origin.x;
            CGFloat y = contentRect.origin.y;
            CGFloat w =self.currentImage.size.width;
            CGFloat h = self.currentImage.size.height;
            rect = CGRectMake(x, y, w, h);
            self.imageRect = rect;
            break;}
        case ButtonTypeLeftImage:
        {
            break;}
        case ButtonTypeRightImage:
        {
            break;}
        case ButtonTypeBottomImage:
        {
            break;}
            
        default:
            break;
    }
    return contentRect;
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = self.newRect;
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}


@end
