//
//  BaseHandler.h
//  zlydoc-iphone
//  BaseHandler : Every subclass handler should extends
//  Created by Ryan on 14-6-25.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTHttpClient.h"


/**
 *  Handler处理完成后调用的Block
 */
typedef void (^CompleteBlock)();

/**
 *  Handler处理成功时调用的Block
 */
typedef void (^SuccessBlock)(id obj);

/**
 *  Handler处理失败时调用的Block
 */
typedef void (^FailedBlock)(id obj);

@interface BaseHandler : NSObject

/**
 *  获取请求URL
 *
 *  @param path
 *  @return 拼装好的URL
 */
+ (NSString *)requestUrlWithPath:(NSString *)path;

/**
 *  http 请求是否成功
 *
 *  @param message 节点 名称
 */
+ (BOOL)isHttpRequestSuccess:(NSString *)message;

/**
 *  用户其他设备登录
 *
 *  @param message 节点 名称
 */
+ (BOOL)isUserOtherDeviceLog:(NSString *)message;
/**
 *  http 用户token
 *
 *  @param parameters http参数
 */
//+ (void)insertHttpBaseInfo:(NSMutableDictionary*)parameters;
@end
