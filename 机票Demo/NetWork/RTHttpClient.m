//
//  RTHttpClient.m
//  ZLYDoc
//
//  Created by Ryan on 14-4-10.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import "RTHttpClient.h"
#import <Reachability.h>
#import "APIConfig.h"
#import <netinet/in.h>
#import <AFNetworking.h>

//#if DEBUG
//#define TIME_OUT_INTERVAL   30.f
//#else
#define TIME_OUT_INTERVAL   60.f
//#endif

#define MAX_CONCURRENTOPERATION 3

@interface RTHttpClient()
//@property(nonatomic,strong) AFHTTPSessionManager *manager;
@property (nonatomic,strong) AFHTTPRequestOperationManager  *manager;
@end

@implementation RTHttpClient

- (id)init{
    if (self = [super init]){
//        self.manager = [AFHTTPSessionManager manager];
        self.manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        //请求参数序列化类型
        self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        //响应结果序列化类型
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer]; //AFJSONResponseSerializer
//        [self.manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        self.manager.operationQueue.maxConcurrentOperationCount = MAX_CONCURRENTOPERATION;
        self.manager.requestSerializer.timeoutInterval = TIME_OUT_INTERVAL;
         
    }
    return self;
}

+ (RTHttpClient *)defaultClient
{
    static RTHttpClient *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark - 指定路径下 数据加密
-(BOOL)pathNeedSign:(NSString*)path
{
    return NO;
}

- (void)requestWithPath:(NSString *)path
                 method:(NSInteger)method
             parameters:(id)parameters prepareExecute:(PrepareExecuteBlock)prepareExecute
                success:(void (^)(AFHTTPRequestOperation *, id))success
                failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    //请求的URL
    //debugLog(@"Request path:%@",parameters);
    
    //判断网络状况（有链接：执行请求；无链接:弹出提示）
//    if ([self isConnectionAvailable]) {
    
        if (prepareExecute) {
            prepareExecute();
        }
        
        switch (method) {
            case RTHttpRequestGet:
            {
                [self.manager GET:path parameters:parameters success:success failure:failure];
                
            }
                break;
            case RTHttpRequestPost:
            {    
                 [self.manager POST:path parameters:parameters success:success failure:failure];
            }
                break;
            case RTHttpRequestDelete:
            {
                [self.manager DELETE:path parameters:parameters success:success failure:failure];
            }
                break;
            case RTHttpRequestPut:
            {
                [self.manager PUT:path parameters:parameters success:success failure:false];
            }
                break;
            default:
                break;
        }
//    }else{
//        //网络错误咯
////        [self showExceptionDialog];
//        //发出网络异常通知广播
////        [[NSNotificationCenter defaultCenter] postNotificationName:@"k_NOTI_NETWORK_ERROR" object:nil];
//    }

}

- (void)requestWithPathInHEAD:(NSString *)url
                   parameters:(NSDictionary *)parameters
                      success:(void (^)(AFHTTPRequestOperation *task))success
                      failure:(void (^)(AFHTTPRequestOperation *task, NSError *error))failure
{
    if ([self isConnectionAvailable]) {
        [self.manager HEAD:url parameters:parameters success:success failure:failure];
    }else{
        [self showExceptionDialog];
    }
}

//看看网络是不是给力
- (BOOL)isConnectionAvailable{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        debugLog(@"Error. Could not recover network reachability flags");
        return NO;
    }
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}

//弹出网络错误提示框
- (void)showExceptionDialog
{
    [[[UIAlertView alloc] initWithTitle:@"提示"
                                message:@"网络异常，请检查网络连接"
                               delegate:self
                      cancelButtonTitle:@"好的"
                      otherButtonTitles:nil, nil] show];
}

- (void)cancelHttpRequest:(NSString *)path {
    NSArray *operations =  [_manager.operationQueue  operations];
    if (operations && operations.count > 0) {
        for (NSOperation  *operation in operations) {
            AFHTTPRequestOperation  *httpOperation = (AFHTTPRequestOperation *)operation;
//            debugLog(@"url path:%@",[httpOperation request].URL.absoluteString);
            if ([[httpOperation request].URL.absoluteString rangeOfString:path].location != NSNotFound) {
                debugLog(@"match URL:%@",[httpOperation request].URL.absoluteString);
                [operation cancel];
            }
        }
    }
}


#pragma mark - http error
/**
 *    NSURLErrorUnknown = -1,
      NSURLErrorCancelled = -999,
      NSURLErrorBadURL = -1000,
      NSURLErrorTimedOut = -1001, //超时,或服务器关闭(502 bad)
      NSURLErrorNotConnectedToInternet  = -1009 // 无网络
      NSURLErrorDomain Code=-1003  -1003  未能找到使用指定主机名的服务器
 */


@end
