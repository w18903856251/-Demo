//
//  OrderHeadView.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/23.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "OrderHeadView.h"

@interface OrderHeadView()
@property (nonatomic,strong) UILabel         *HeadTitle;   //表头标题


@property (nonatomic,strong) UILabel         *Airport;  //起降机场

@property (nonatomic,strong)  UILabel        *Time;   //起飞时间
@property (nonatomic,strong)  UILabel        *ShouldMoney;  //应付钱


@end



@implementation OrderHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        
        
        _HeadTitle =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self];
        
        _Airport =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self];
        _Time = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self];
        
        _ShouldMoney  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self];
        
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    [super layoutSubviews];
    
    
    _HeadTitle.frame = CGRectMake(15, 10, SCREEN_WIDTH-30, 30);
    
    _Airport.frame = CGRectMake(15, _HeadTitle.bottom+10, (SCREEN_WIDTH-30), 20);
    
    _Time.frame = CGRectMake(15,_Airport.bottom+10 , SCREEN_WIDTH-30*2, 15);
    _ShouldMoney.frame = CGRectMake(15, _Time.bottom+10, SCREEN_WIDTH-30*2, 15);
    
}
#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight
{
    return 150 ;
    
    
}

- (void)configureHeaderData{
    
    
    _HeadTitle.text = @"订单号:2321411212";
    
    _Airport.text =@"预定时间: 2016-02-15";
    _Time.text = @"总价: ￥1240";
    
    _ShouldMoney.text = @"订单状态: 已出票";
    
    
    
}

//- (void)configureHeaderData:(id)obj configureshippingspaceHeadData:(id)sender
//{
//    TicketList * s = obj;
//
//    _HeadTitle.text =[NSString stringWithFormat:@"%@ %@ %@机场%@-%@机场%@", s.dateinfo.adate,s.dateinfo.aweek,s.aportinfo.aportsname,s.aportinfo.bsname,s.dportinfo.aportsname,s.dportinfo.bsname];
//
//
//    Ticketseatlist * ticketseat = sender;
//
//    _ShippingspaceTitle.text =  ticketseat.title;
//
//    _InfoTitle.text = @"票价￥1150民航基金￥50燃油￥0";  //暂无接口
//
//    _EndorseTitle.text = ticketseat.subTitle;
//
//    _PriceTitle.text =[ NSString stringWithFormat:@"￥%@",ticketseat.price] ;
//
//}


@end
