//
//  RTHttpClient.h
//  ZLYDoc
//  HTTP网络请求
//  Created by Ryan on 14-4-10.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;
//HTTP REQUEST METHOD TYPE
typedef NS_ENUM(NSInteger, RTHttpRequestType) {
    RTHttpRequestGet,
    RTHttpRequestPost,
    RTHttpRequestDelete,
    RTHttpRequestPut,
};

/**
 *  请求开始前预处理Block
 */
typedef void(^PrepareExecuteBlock)(void);

/****************   RTHttpClient   ****************/
@interface RTHttpClient : NSObject

+ (RTHttpClient *)defaultClient;

/**
 *  HTTP请求（GET、POST、DELETE、PUT）
 *
 *  @param path       请求路径网址
 *  @param method     RESTFul请求类型
 *  @param parameters 请求参数
 *  @param prepare    请求前预处理块
 *  @param success    请求成功处理块
 *  @param failure    请求失败处理块
 */

- (void)requestWithPath:(NSString *)path
                method:(NSInteger)method
            parameters:(id)parameters
        prepareExecute:(PrepareExecuteBlock) prepare
               success:(void (^)(AFHTTPRequestOperation *task, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure;

/**
 *  HTTP请求（HEAD）
 *
 *  @param path
 *  @param parameters
 *  @param success
 *  @param failure
 */
- (void)requestWithPathInHEAD:(NSString *)url
                  parameters:(NSDictionary *)parameters
                     success:(void (^)(AFHTTPRequestOperation *task))success
                     failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure;

//判断当前网络状态
- (BOOL)isConnectionAvailable;

//取消operation
- (void)cancelHttpRequest:(NSString *)path;
@end
