//
//  APIConfig.h
//  ZLYDoc
//  API信息
//  Created by Ryan on 14-4-14.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import <Foundation/Foundation.h>
/***************SERVER HOST***************/

#define SERVER_HOST @""

/***************SERVER API***************/
#define TEST @"http://jp.b2mp.cn/"                  //测试环境1
#define TEST1 @"http://test.2schome.net"                  //预发布环境
#define TEST2 @"http://app.local.bolext.cn/"             //测试环境2
#define FINAL @"http://www.hx2car.com"    //生产环境
#define PICURL @"http://122.224.150.247"              //图片上传的UR
// 服务器地址
#if DEBUG
    #define    BASE_URL          TEST
#else
    #define    BASE_URL         FINAL
#endif

// 格式化
#define VARIABLE                  @"/mobile/carman/"
#define URLFORMATE(variable,url)  [NSString stringWithFormat:@"%@%@",variable,url]


// 接口定义(业务)
#define        LOGINURL              URLFORMATE(VARIABLE,@"login.json")
#define        UPLOADURL             URLFORMATE(@"mobile/",@"uploadhead.htm")                     //mobile/upload.htm 上传
#define        UPPHOTOURL            URLFORMATE(@"mobile/",@"upload.htm")                         //上传普通相片
#define        CARSERIAL             URLFORMATE(@"/mobile/",@"getCarSerialByParentIdJson.json")
#define        CARTYPE               URLFORMATE(@"/mobile/",@"getCarTypeByParentIdJson.json")
#define        ADDCUSTOMER           URLFORMATE(VARIABLE,@"addcustomer.json")

#define        ChangeCUSTOMER           URLFORMATE(VARIABLE,@"customeredit.json")
#define        CUSTOMERINFO           URLFORMATE(VARIABLE,@"customerdet.json")
#define        SAVECARC          URLFORMATE(VARIABLE,@"savecar.json")

#define        SAVECUSTOMER          URLFORMATE(VARIABLE,@"saverequire.json")
#define        UPDATECUSTOMER        URLFORMATE(VARIABLE,@"updatesellman.json")
#define        SELLCARURL            URLFORMATE(VARIABLE,@"getsellmans.json")
#define        SELLCARDEALURL        URLFORMATE(VARIABLE,@"sellcardeal.json")
#define        HANDLERSELLCARURL     URLFORMATE(VARIABLE,@"sellcarsure.json")
#define        BUYCARURL             URLFORMATE(VARIABLE,@"getbuymans.json")
#define        BUYCARYiXiangURL             URLFORMATE(VARIABLE,@"getintentionmans.json")

#define        PLANBUYCARURL         URLFORMATE(VARIABLE,@"suresellcars.json")
#define        APPOINTEVALUATECARURL URLFORMATE(VARIABLE,@"yuyuesellcars.json")
#define        EVALUATECARURL        URLFORMATE(VARIABLE,@"assesssellcars.json")
#define        PAYEDCARURL           URLFORMATE(VARIABLE,@"successsellcars.json")

#define        PAYEDCARTRANSFERURL   URLFORMATE(VARIABLE,@"sellcartran.json")
#define        STOCKCARURL           URLFORMATE(VARIABLE,@"storecars.json")
#define        STOCKCOSTSTATISTICURL URLFORMATE(VARIABLE,@"storecarcost.json")
#define        STOCKMODIFYINFOURL    URLFORMATE(VARIABLE,@"carrenewbase.json")
#define        DEALCARURL            URLFORMATE(VARIABLE,@"dealcars.json")
#define        DEALTRANSGERCARURL    URLFORMATE(VARIABLE,@"buycartran.json")
#define        ORDERTIMEURL          URLFORMATE(VARIABLE,@"yuyueassess.json")
#define        STOCKDETAILURL        URLFORMATE(VARIABLE,@"storecardet.json")
#define        PLANBUYDETAILURL      URLFORMATE(VARIABLE,@"sellmandetaile.json")
#define        EVALUATEDDETAILURL    URLFORMATE(VARIABLE,@"assessdetaile.json")
#define        SELLMANDETAILURL      URLFORMATE(VARIABLE,@"sellmandetaile.json")
#define        ACCESSCARLURL         URLFORMATE(VARIABLE,@"assess.json")
#define        MATCHCUSTOMERURL      URLFORMATE(VARIABLE,@"getintentionmans.json")
#define        MATCHCARURL           URLFORMATE(VARIABLE,@"getmatchcars.json")
#define        MATCHDETAILURL        URLFORMATE(VARIABLE,@"matchcardetaile.json")
#define        FOLLOWLOGURL          URLFORMATE(VARIABLE,@"getfollows.json")
#define        ADDFOLLOWLOGURL       URLFORMATE(VARIABLE,@"addfollow.json")
#define        BUYCARDEALURL         URLFORMATE(VARIABLE,@"buycardeal.json")
#define        GETMESSAGEURL         URLFORMATE(VARIABLE,@"getmsg.json")
#define        UPLOADCOSTURL         URLFORMATE(VARIABLE,@"assesscostup.json")
#define        CARREPAIRURL          URLFORMATE(VARIABLE,@"sellcarrepair.json")
#define        BASICSDATA            URLFORMATE(VARIABLE,@"getbasicsdata.json")
#define        DAYDATA               URLFORMATE(VARIABLE,@"getdaydata.json")
#define        SALERANK              URLFORMATE(VARIABLE,@"getsellmandata.json")
#define        CLIENTSTRUCTURE       URLFORMATE(VARIABLE,@"getcustdata.json")
#define        TRENDANALYSIS         URLFORMATE(VARIABLE,@"gettrenddata.json")
#define        EMPLOYEEBASICSDATA    URLFORMATE(VARIABLE,@"getsmbasicsdata.json")
#define        EMPLOYEEDAYDATA       URLFORMATE(VARIABLE,@"getsmdaydata.json")
#define        EARNESTMONEYPAY       URLFORMATE(VARIABLE,@"djpaystate.json")//已付定金
#define        ADDRECEPTION          URLFORMATE(VARIABLE,@"addcustjd.json")//添加接待
#define        AUCTIRESTATE          URLFORMATE(VARIABLE,@"auctirestate.json")//拍卖状态
#define        RESERVATIONCAR   URLFORMATE(VARIABLE,@"carreserve.json")


// 接口定义(用户)
#define        EMPLOYEECARURL        URLFORMATE(VARIABLE,@"getemployees.json")

#define        MainNUMURL URLFORMATE(VARIABLE,@"getNum.json")

#define        ASSIGNSALESURL        URLFORMATE(VARIABLE,@"zdconsultant.json")
#define        ASSIGNASSESSMANURL    URLFORMATE(VARIABLE,@"toassessman.json")
#define        PUSHSWITHURL          URLFORMATE(VARIABLE,@"pushswitch.json")
#define        HXCARSSWITHURL        URLFORMATE(VARIABLE,@"hxcarswitch.json")
#define        UPDATEMSGSTATUSURL    URLFORMATE(VARIABLE,@"readmsg.json")
#define        MODIFYPASSWORDSURL    URLFORMATE(VARIABLE,@"updateuserpwd.json")
#define        DELETEEMPLOYEEURL     URLFORMATE(VARIABLE,@"delemployee.json")
#define        ADDEMPLOYEEURL        URLFORMATE(VARIABLE,@"addemployee.json")
#define        UPLOADPORTRAITURL     URLFORMATE(VARIABLE,@"updateuserphoto.json")


//相关数字 接口
#define        POTENTIALCUSTOMERURL URLFORMATE(VARIABLE,@"getNum.json")
#define        UNREADERMSGURL       URLFORMATE(VARIABLE,@"getmsgnum.json")