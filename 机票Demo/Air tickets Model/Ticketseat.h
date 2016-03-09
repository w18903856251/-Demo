//
//  Ticketseat.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/7.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@protocol  Ticketseatlist
@end

@interface Ticketseatlist : JSONModel
@property (nonatomic,strong)  NSString           *classType; //类型
@property (nonatomic,strong)  NSString           *title;  //仓位标题

@property (nonatomic,strong)  NSString           *subTitle; //退改标题
@property (nonatomic,strong)  NSString           *info; //发票类型
@property (nonatomic,strong)  NSString           *price; //价格

@end


@protocol  Ticketseat
@end

@interface Ticketseat : JSONModel
@property (nonatomic,strong)  NSString           *retMsg;
@property (nonatomic,strong)  NSArray<Ticketseatlist,Optional>  *retData;
@end
