//
//  AppMacro.h
//  TalkThings
//
//  Created by Sillen on 14-9-9.
//  Copyright (c) 2014年 Sillon. All rights reserved.
//

/*
 **
 设备信息等
 */



#import "GeneralMacro.h"
//#import "UtilsMacro.h"

#pragma mark - 定义versionId
#define GS_VERSION_ID   [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]

//定义statusbar navbar 高度
#define IOS_STATUSBAR_HEIGHT        20.f
#define IOS_NAVBAR_HEIGHT           44.f
#define IOS_TARBAR_HEIGHT           49.f
#define ANIMATE_DURATION            0.25f   //动画时间
#define LEFTMARGIN                  15   //左边距

#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS7_OR_LATER       ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define APPDELEGATE         (AppDelegate *)[UIApplication sharedApplication].delegate  //入口类
//获取设备名称
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)//获取屏幕分辨率
//获取屏幕宽高
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
// 屏幕高度判定手机
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define WIDTH_IPHONE_NORMAL     320.f  //正常屏幕宽
#define WIDTH_IPHONE6           375.f
#define WIDHT_IPHONE6P          414.f

//屏幕的宽高
#define KSCREENWIDTH           [[UIScreen mainScreen] bounds].size.width
#define KSCREENHEIGHT          [[UIScreen mainScreen] bounds].size.height
// 获取app信息
#define  APPALLINFO       [[[NSBundle mainBundle] infoDictionary] //app所有信息
#define kAPPVERSIONID          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] //当前版本
#define kAPPBUILDEVALUE        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] //获取的版本
 
#define kAPPName               [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"] // 当前app   文件名
#define KIPADDRESS                   [DeviceInfo IPAddress]  //ip地址
#define KgloballyUniqueString        [[NSProcessInfo processInfo] globallyUniqueString]  //全球唯一标示 （这个方法用来产生一个唯一的标示符，每次调用都会不一样，所以可以用当作一些临时缓存文件的名字）
#define KDeviceName                  [UIDevice currentDevice].name  //设备名 李四的 iPad、王五的 iPad .。。

#define KSystemName                  [UIDevice currentDevice].systemName  //系统的名称  iPhone OS

#define KSystemVersion               [UIDevice currentDevice].systemVersion  //设备系统的版本号  5.1.1、6.0

#define KDeviceModel                 [UIDevice currentDevice].model //设备的型号   iPad、iphone、ipod touch。。。
//#define KBatteryLevel                [DeviceInfo currentBatteryLevel]  //电池电量
#define KNetStatus                   [[Reachability reachabilityForInternetConnection] currentReachabilityStatus] //网络状况 0:无网络 1:2g/3g 2:wifi
#define KAppVersion             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] //app的版本 1.0，2.0