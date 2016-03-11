//
//  BaseViewController.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/10.
//  Copyright © 2016年 吴宇. All rights reserved.
//

/*
 **
 */
//  封装基类ViewController
#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic,assign) NSUInteger                     currentPage;
@property (nonatomic,assign) NSUInteger                     maxPage;
@property (nonatomic,assign) BOOL                           isTableRefreshing;


// 控制器入栈
- (void)pushViewController:(UIViewController *)viewController;

#pragma mark - 键盘取消方法
- (void)keyBoardDown;

#pragma mark - 添加tapGesture
- (void)addTapGesture;

#pragma mark - 延迟.25s pop
- (void)navDelayToPop;

#pragma mark - 立即 pop
- (void)navImmediateToPop;

#pragma mark - 添加无网络 view
- (void)showNoNetworkView ;
- (void)hideNoNetworkView ;
- (void)reloadNetworkData;
#pragma mark - 添加无数据 view
- (void)showNoDataView;
- (void)hideNoDataView;

#pragma mark - 格式化意向级别
- (NSString *)formatterIntentionLevel:(NSString *)level;
- (NSString *)formatterTradeWay:(NSString *)level;
- (NSString *)formatterHttpErrorMessage:(NSInteger)error_code;

#pragma mark - 取消网络操作
- (void)cancelViewControllerHttp ;
@end
