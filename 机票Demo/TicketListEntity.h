//
//  TicketListEntity.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol  BuyCar
@end
@interface  BuyCar: JSONModel

@property (nonatomic,strong)  NSString<Optional>     *aport;
@property (nonatomic,strong)  NSString<Optional>     *aportsname;
@property (nonatomic,strong)  NSString<Optional>     *cityname;
@end
//
@protocol  TicketList
@end

@interface  TicketList: JSONModel
@property (nonatomic,strong)  BuyCar<Optional>    *aportinfo;
@end
//
@protocol  TicketListEntity
@end

@interface TicketListEntity : JSONModel
@property (nonatomic,strong)  NSString           *retMsg;
@property (nonatomic,strong)  NSArray<TicketList,Optional>  *retData;
@end
