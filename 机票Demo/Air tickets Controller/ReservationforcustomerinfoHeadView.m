//
//  ReservationforcustomerinfoHeadView.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/9.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "ReservationforcustomerinfoHeadView.h"
#import "AppUtils.h"
#import "TicketListEntity.h"
#import "Ticketseat.h"
@interface ReservationforcustomerinfoHeadView()
@property (nonatomic,strong) UILabel         *HeadTitle;   //表头标题


@property (nonatomic,strong) UILabel         *ShippingspaceTitle;  //舱位标题

@property (nonatomic,strong)  UILabel        *InfoTitle;   //飞机基金燃油信息等
@property (nonatomic,strong)  UILabel        *EndorseTitle;  //改签标题
@property (nonatomic,strong)  UILabel        *PriceTitle; //价格

@end

@implementation ReservationforcustomerinfoHeadView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        
        
        _HeadTitle =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self];
        
        self.ShippingspaceTitle =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self];
        _InfoTitle = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self];

        self.EndorseTitle  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self];
        self.PriceTitle  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self];
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    [super layoutSubviews];
    
    
    _HeadTitle.frame = CGRectMake(15, 10, SCREEN_WIDTH-30, 30);
    
    _ShippingspaceTitle.frame = CGRectMake(15, _HeadTitle.bottom+10, (SCREEN_WIDTH-30)/2, 20);
    
    _InfoTitle.frame = CGRectMake(15,_ShippingspaceTitle.bottom+10 , SCREEN_WIDTH-30*2, 15);
    _EndorseTitle.frame = CGRectMake(15, _InfoTitle.bottom+10, SCREEN_WIDTH-30*2, 15);
    
    
    _PriceTitle.frame = CGRectMake(_ShippingspaceTitle.right+20, _ShippingspaceTitle.top, _ShippingspaceTitle.width-20, 20);
    
}

#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight
{
    return 150 ;
    
    
}
- (void)configureHeaderData:(id)obj configureshippingspaceHeadData:(id)sender
{
    TicketList * s = obj;
    
    _HeadTitle.text =[NSString stringWithFormat:@"%@ %@ %@机场%@-%@机场%@", s.dateinfo.adate,s.dateinfo.aweek,s.aportinfo.aportsname,s.aportinfo.bsname,s.dportinfo.aportsname,s.dportinfo.bsname];
    
    
    Ticketseatlist * ticketseat = sender;
    
    _ShippingspaceTitle.text =  ticketseat.title;
    
    _InfoTitle.text = @"票价￥1150民航基金￥50燃油￥0";  //暂无接口
    
    _EndorseTitle.text = ticketseat.subTitle;
    
    _PriceTitle.text =[ NSString stringWithFormat:@"￥%@",ticketseat.price] ;
    
}



@end
