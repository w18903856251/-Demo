//
//  AppUtils.h
//  zlydoc+iphone
//
//  Created by Ryan on 14+5+23.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIColor+HexString.h"

@class SWFrameButton;
@class HXTextField;
@interface AppUtils : NSObject

/********************** System Utils ***********************/
//关闭键盘
+ (void)closeKeyboard;
//获取MD5加密后字符串
+ (NSString *)md5FromString:(NSString *)str;

/******* UITableView & UINavigationController Utils *******/
//返回View覆盖多余的tableview cell线条
+ (UIView *)tableViewsFooterView;
//返回UILabel作为UITableView的header
+ (UILabel *)tableViewsHeaderLabelWithMessage:(NSString *)message;

/********************** NSDate Utils ***********************/
//根据指定格式将NSDate转换为NSString
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter;
//根据指定格式将NSString转换为NSDate
+ (NSDate *)dateFromString:(NSString *)dateString formatter:(NSString *)formatter;
// 获取 年份 月份
+ (NSArray *)dateInfoFromString:(NSString *)dateString;
// 格式化 服务器返回时间
+ (NSString *)formatterServerTime:(long long)time;
+ (long long)getNowTimeMillonSeconds;

/********************* Category Utils **********************/
//根据颜色码取得颜色对象
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

/********************* Call Phone **********************/
//打电话
+ (void)callPhone:(NSString *)phoneNumber controller:(UIViewController *)viewController;


+ (void)setPathDoNotBackUp:(NSString *)path;

// 根据颜色生成图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color;

#pragma mark - 获取文本高度
+ (CGFloat)textHeightWithWidth:(NSString *)text  width:(CGFloat)textWidth font:(UIFont *)textFont;

#pragma mark - 新增ui生成 方法
//返回 通用label
+ (UILabel  *)creatNormalLabel:(UIColor *)textColor align:(NSTextAlignment)textAlignment font:(UIFont *)textFont parent:(UIView *)superView;
//返回 通用imageView
+ (UIImageView *)creatNormalImageView:(UIView *)superView img:(NSString *)imgName;
//返回 可拉伸 markImageView
+ (UIImageView *)creatMarkImageViewInCell:(UIView *)superView;
//返回 分割线 label
+ (UILabel *)creatTableSeparatorLine:(BOOL)borderLine parent:(UIView *)superView;
//返回 textview
+ (UITextView *)creatTextView:(UIColor *)textColor align:(NSTextAlignment)textAlignment font:(UIFont *)textFont parent:(UIView *)superView;

//返回 uibutton
+ (UIButton *)createNormalButtonWithImage:(NSString *)imgName parent:(UIView *)superView;
+ (UIButton *)createButton:(NSString *)title titleColor:(UIColor *)tlColor img:(UIImage *)img bg:(UIImage *)bgImg parent:(UIView *)superView;
+ (UIButton *)createButtons:(NSString *)title titleColor:(UIColor *)tlColor img:(UIImage *)img bg:(UIImage *)bgImg parent:(UIView *)superView;
+ (UIButton *)createButton:(NSString *)title titleColor:(UIColor *)titleColor selectedColor:(UIColor *)selected bg:(UIColor *)bgColor parent:(UIView *)superView;
+ (SWFrameButton *)createSWButton:(NSString *)title color:(UIColor *)tintColor font:(UIFont *)titleFont parent:(UIView *)superView;

//返回 uitextfield
+ (UITextField *)creatNormalTextField:(NSString *)palceholder color:(UIColor *)textColor align:(NSTextAlignment)textAlignment parent:(UIView *)superView;

//返回 hxtextfield
+ (HXTextField *)creatHXTextField:(NSString *)palceholder color:(UIColor *)textColor align:(NSTextAlignment)textAlignment parent:(UIView *)superView;

//返回 hxtextfield
//+ (HXPlaceHolderTextView *)creatHXPlaceHolderTextField:(NSString *)palceholder color:(UIColor *)textColor align:(NSTextAlignment)textAlignment parent:(UIView *)superView;

//返回 barbuttonitem
+ (UIBarButtonItem*)barButtonItemWithTitle:(NSString*)title target:(id)target action:(SEL)action;
+ (UIBarButtonItem*)barButtonItemWithTitle:(NSString*)title color:(UIColor *)tintColor target:(id)target action:(SEL)action;
@end