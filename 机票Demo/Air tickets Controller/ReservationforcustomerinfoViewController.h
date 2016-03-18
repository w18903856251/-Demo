//
//  ReservationforcustomerinfoViewController.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/9.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "BaseGroupTableViewController.h"
//  预订机票客户信息页面
@interface ReservationforcustomerinfoViewController : BaseGroupTableViewController
@property (nonatomic)  NSDictionary *objData;      //选择的时间以及城市
@property (nonatomic)  NSDictionary *spaceobjData; //舱位数据
@end
