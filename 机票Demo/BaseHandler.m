//
//  BaseHandler.m
//  zlydoc-iphone
//
//  Created by Ryan on 14-6-25.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import "BaseHandler.h"
#import "APIConfig.h"


#define  API_VERSION         @"1.20"
#define  SUCCESS_STRING      @"success"   //成功标识
#define  USERSESSION_EXPIRE  @"用户未登录！"

@implementation BaseHandler


+ (NSString *)requestUrlWithPath:(NSString *)path
{
    return [[@"http://" stringByAppendingString:[SERVER_HOST stringByAppendingString:API_VERSION]] stringByAppendingString:path];
   // NSLog(@"你大爷测试＝＝＝＝%@",path);
}

+ (BOOL)isHttpRequestSuccess:(NSString *)message {
    if ([message isEqualToString:SUCCESS_STRING]) return TRUE;
    else return FALSE;
}

+ (BOOL)isUserOtherDeviceLog:(NSString *)message {
    if ([message isEqualToString:USERSESSION_EXPIRE]) return TRUE;
    else return FALSE;
}

//+ (void)insertHttpBaseInfo:(NSMutableDictionary*)parameters {
//    NSString  *loginName = [DataManager getUserPhoneNumber];
//    NSString  *token = [DataManager getUserToken];
//    [parameters setObject:loginName forKey:@"loginName"];
//    [parameters setObject:token forKey:@"token"];
//    
//}

@end
