//
//  BaseAnimation.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/11.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <Foundation/Foundation.h>
// 动画基类
typedef enum {
    AnimationTypePresent,
    AnimationTypeDismiss
} AnimationType;
@interface BaseAnimation : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) AnimationType type;
@end
