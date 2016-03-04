//
//  Publicrequest.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "Publicrequest.h"
#import "TicketListEntity.h"
#import "BaseHandler.h"
@implementation Publicrequest
+ (void)requestTicketlistWithParameters:(NSMutableDictionary *)parameter success:(void(^)(id obj))SuccessBlock fail:(void (^)(id obj))FailedBlock complete:(void (^)(id obj))CompleteBlock
{
    
    [[RTHttpClient defaultClient] requestWithPath:@"http://jp.b2mp.cn/getlist" method:RTHttpRequestGet parameters:parameter prepareExecute:nil success:^(AFHTTPRequestOperation *task, id responseObject) {
        
        //debugLog(@"responseObject:%@",responseObject);
        //NSDictionary * dic = [responseObject objectForKey:@"retData"];
       
        
        //debugLog(@"buyCarEntity:%@",ticklistEntity);
        if ([BaseHandler isHttpRequestSuccess:responseObject[@"retMsg"]]) {
            NSError  * error = nil;
             TicketListEntity   *ticklistEntity = [[TicketListEntity alloc] initWithDictionary:responseObject error:&error];
//            
//            //debugLog(@"entity:%@",stockEntity);
            if (ticklistEntity){
                SuccessBlock(ticklistEntity);
            }else{
                SuccessBlock(nil);
            }
        }else
            FailedBlock(responseObject[@"message"]);
    } failure:^(AFHTTPRequestOperation *task, NSError *error) {
        if (error.code!=-999) {
            CompleteBlock(error);
        }
    }];
}

@end
