//
//  AppDelegate.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "AppDelegate.h"
#import "HomepageViewController.h"
#import "PaySucessViewController.h"
//#import <AlipaySDK/AlipaySDK.h>
@interface AppDelegate ()<WXApiDelegate>
@property (nonatomic) UINavigationController *navigation;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
   HomepageViewController *vc = [[HomepageViewController alloc]init];
    _navigation = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = _navigation;
    
    //微信测试APPID  :wxb4ba3c02aa476ea1
    // 1:导入微信支付SDK
    // 2:设置微信APPID为 URL Schemes
    // 3:发起支付,调起微信支付
    // 4:处理支付结果
    
   [WXApi registerApp:@"wxb4ba3c02aa476ea1" withDescription:@"demo 2.0"];
    
    
    
    // Override point for customization after application launch.
    return YES;
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp {

    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        NSString *strMsg,*strTitle = [NSString stringWithFormat:@"支付结果"];
        
        switch (resp.errCode) {
            case WXSuccess:
                strMsg = @"支付结果：成功！";
                NSLog(@"支付成功－PaySuccess，retcode = %d", resp.errCode);
                break;
                
            default:
                strMsg = [NSString stringWithFormat:@"支付结果：失败！retcode = %d, retstr = %@", resp.errCode,resp.errStr];
                NSLog(@"错误，retcode = %d, retstr = %@", resp.errCode,resp.errStr);
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alert.delegate =self;
        [alert show];
        
    }


}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex//点击弹窗按钮后
{
    NSLog(@"buttonIndex:%ld",(long)buttonIndex);
    
    if (buttonIndex == 0) {//取消
        
        PaySucessViewController *payCtr = [[PaySucessViewController alloc] init];
       
        [_navigation pushViewController:payCtr animated:YES];
        
        NSLog(@"取消");
    }else if (buttonIndex == 1){//确定
        
        NSLog(@"确定");
    }
}


//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
//    
//    NSLog(@"url1=%@",url);
//    
//    //return [WXApi handleOpenURL:url delegate:self];
//    
//}
//
////返回
//
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSLog(@"URL=%@",url);
    
    return [WXApi handleOpenURL:url delegate:self];
    //跳转支付宝钱包进行支付，处理支付结果
//    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
//        NSLog(@"result = %@",resultDic);
//    }];

    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
