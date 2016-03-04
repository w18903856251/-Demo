//
//  UIColor+HexString.h
//  OakWealth
//
//  Created by Maoqian0903 on 14-7-14.
//  Copyright (c) 2014年 杭州阿拉丁. All rights reserved.
//
#define  HexColor_molv         @"5D7A7C"   //墨绿 颜色
#define  HexColor_shenlv       @"4DA60D"   //深绿
#define  HexColor_gestureNav   @"292929"
#define  HexColor_gestureView  @"2E3337"
#import <UIKit/UIKit.h>

@interface UIColor (HexString)

#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *) colorWithHexString: (NSString *)color;

@end
