//
//  Publicrequest.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RTHttpClient.h"
@interface Publicrequest : NSObject
//  机票列表
+ (void)requestTicketlistWithParameters:(NSMutableDictionary *)parameter success:(void(^)(id obj))SuccessBlock fail:(void (^)(id obj))FailedBlock complete:(void (^)(id obj))CompleteBlock;

// 座位
+ (void)requestTicketseatWithParameters:(NSMutableDictionary *)parameter success:(void(^)(id obj))SuccessBlock fail:(void (^)(id obj))FailedBlock complete:(void (^)(id obj))CompleteBlock;
@end
