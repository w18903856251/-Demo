//
//  BaseAnimation.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/11.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "BaseAnimation.h"

@implementation BaseAnimation 

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSAssert(NO, @"animateTransition: should be handled by subclass of BaseAnimation");
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

-(void)handlePinch:(UIPinchGestureRecognizer *)pinch {
    NSAssert(NO, @"handlePinch: should be handled by a subclass of BaseAnimation");
}

@end
