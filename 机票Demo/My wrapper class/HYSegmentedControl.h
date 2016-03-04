//
//  HYSegmentedControl.h
//  CustomSegControlView
//
//  Created by sxzw on 14-6-12.
//  Copyright (c) 2014年 sxzw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYSegmentedControlDelegate <NSObject>

@required
//代理函数 获取当前下标
- (void)hySegmentedControlSelectAtIndex:(NSInteger)index;

@end

@interface HYSegmentedControl : UIView

@property (assign, nonatomic) id<HYSegmentedControlDelegate>delegate;
@property (nonatomic,assign)  NSInteger      selectIndex;
@property (nonatomic,assign) NSInteger   tableIndex;
@property (nonatomic,strong) UIColor *lineColor;
@property (strong, nonatomic)UIView *bottomLineView;
//初始化函数 
- (id)initWithOriginY:(CGFloat)y Titles:(NSArray *)titles delegate:(id)delegate;
- (id)initWithsOriginY:(CGFloat)y Titles:(NSArray *)titles delegate:(id)delegate;
//提供方法改变 index
- (void)changeSegmentedControlWithIndex:(NSInteger)index;

@end
