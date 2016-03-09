//
//  TicketListEntity.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol  Aportinfo
@end



// 
@interface  Aportinfo: JSONModel

@property (nonatomic,strong)  NSString<Optional>     *aport;
@property (nonatomic,strong)  NSString<Optional>     *bsname;
@property (nonatomic,strong)  NSString<Optional>     *aportsname; //出发机场
@property (nonatomic,strong)  NSString<Optional>     *cityname; //出发城市
@end


@protocol  Basinfo
@end


@interface  Basinfo: JSONModel

@property (nonatomic,strong)  NSString<Optional>     *aircode;
@property (nonatomic,strong)  NSString<Optional>     *airsname;
@property (nonatomic,strong)  NSString<Optional>     *flgno; //
@property (nonatomic,strong)  NSString<Optional>     *logourl; //航空公司图标
@end
//  飞机介绍信息
@interface  Craftinfo: JSONModel

@property (nonatomic,strong)  NSString<Optional>     *cname;
@property (nonatomic,strong)  NSString<Optional>     *craft;
@property (nonatomic,strong)  NSString<Optional>     *kind; //
@property (nonatomic,strong)  NSString<Optional>     *level; //
@property (nonatomic,strong)  NSString<Optional>     *max; //
@property (nonatomic,strong)  NSString<Optional>     *min; //

@end


@protocol  Dateinfo
@end



@interface  Dateinfo: JSONModel

@property (nonatomic,strong)  NSString<Optional>     *adate; //起飞日期和时间
@property (nonatomic,strong)  NSString<Optional>     *aweek; //起飞周几
@property (nonatomic,strong)  NSString<Optional>     *ddate; // 到达时间
@property (nonatomic,strong)  NSString<Optional>     *dweek; //到达周几
@property (nonatomic,strong)  NSString<Optional>     *isfly; //
@property (nonatomic,strong)  NSString<Optional>     *jtime; //
@property (nonatomic,strong)  NSString<Optional>     *pdtime; //
@property (nonatomic,strong)  NSString<Optional>     *prate;
@property (nonatomic,strong)  NSString<Optional>     *status;

@end


@protocol  Dportinfo
@end



@interface  Dportinfo: JSONModel

@property (nonatomic,strong)  NSString<Optional>     *aport; //
@property (nonatomic,strong)  NSString<Optional>     *aportsname; //
@property (nonatomic,strong)  NSString<Optional>     *bsname; //
@property (nonatomic,strong)  NSString<Optional>     *city; //
@property (nonatomic,strong)  NSString<Optional>     *cityname; //

@end


@protocol  Policyinfo
@end



@interface Policyinfo: JSONModel

@property (nonatomic,strong)  NSString<Optional>     *tprice; // 价格


@end

//
@protocol  TicketList
@end

@interface  TicketList: JSONModel
@property (nonatomic,strong)  Aportinfo<Optional>    *aportinfo;
@property (nonatomic,strong)  Basinfo<Optional>      *basinfo;
@property (nonatomic,strong)  Craftinfo<Optional>    *craftinfo;
@property (nonatomic,strong)  Dateinfo<Optional>     *dateinfo;
@property (nonatomic,strong)  Dportinfo<Optional>    *dportinfo;
@property (nonatomic,strong)  Policyinfo<Optional>   *policyinfo;


@end
//
@protocol  TicketListEntity
@end

@interface TicketListEntity : JSONModel
@property (nonatomic,strong)  NSString           *retMsg;
@property (nonatomic,strong)  NSArray<TicketList,Optional>  *retData;
@end
