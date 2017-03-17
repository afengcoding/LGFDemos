//
//  LGFSingleTouchRotationGesture.m
//  LGFDemo
//
//  Created by qddios2 on 16/9/8.
//  Copyright © 2016年 lvguifeng. All rights reserved.
//

#import "LGFSingleTouchRotationGesture.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
@implementation LGFSingleTouchRotationGesture


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if ([[event touchesForGestureRecognizer:self] count] > 1) {
        [self setState:UIGestureRecognizerStateFailed];
    } else {
        [self setState:UIGestureRecognizerStateBegan];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self resetGestureState];
    [self setState:UIGestureRecognizerStateEnded];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [super touchesMoved:touches withEvent:event];
    UIView *view = [self view];
    UITouch *touch = [touches anyObject];
    CGPoint center = CGPointMake(CGRectGetMidX([view bounds]), CGRectGetMidY([view bounds]));
    CGPoint currentTouchPoint = [touch locationInView:view];
    CGPoint previousTouchPoint = [touch previousLocationInView:view];
    
    CGFloat angleInRadians = atan2f(currentTouchPoint.y - center.y, currentTouchPoint.x - center.x) - atan2f(previousTouchPoint.y - center.y, previousTouchPoint.x - center.x);
    
    [self setRotation:angleInRadians];
    [self setState:UIGestureRecognizerStateChanged];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self resetGestureState];
    [self setState:UIGestureRecognizerStateCancelled];
}


- (void)resetGestureState
{
    if (self.state == UIGestureRecognizerStatePossible) {
        [self setState:UIGestureRecognizerStateFailed];
    }
}

@end
