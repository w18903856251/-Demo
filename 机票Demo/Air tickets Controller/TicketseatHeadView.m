//
//  TicketseatHeadView.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/7.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "TicketseatHeadView.h"
#import "AppUtils.h"
#import "TicketListEntity.h"
@interface TicketseatHeadView()
@property (nonatomic,strong) UILabel        *Dateweek;   //起飞日期
@property (nonatomic,strong) UILabel         *Datestar;  //起飞时间
@property (nonatomic,strong)  UILabel        *Divider;   //分割线
@property (nonatomic,strong)  UILabel        *Datefininsh;  //到达时间

@property (nonatomic,strong)  UILabel        *Airportstar;   //起飞机场

@property (nonatomic,strong)  UILabel        *Airportfinish;   //降落机场

@property (nonatomic,strong)  UIImageView    *Airlinesicon; //航空公司图标
@property (nonatomic,strong)  UILabel        *Airlinesinfo;

@end
@implementation TicketseatHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        
        
        _Dateweek =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self];
        
        self.Datestar =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self];
        self.Divider  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self];
        self.Datefininsh  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self];
        
        self.Airportstar  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self];
        self.Airportfinish  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self];
        self.Airlinesicon = [AppUtils creatNormalImageView:nil img:nil];
        
        [self addSubview:self.Airlinesicon];
        self.Airlinesinfo  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self];

        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    [super layoutSubviews];
    
    
    _Dateweek.frame = CGRectMake(15, 10, SCREEN_WIDTH/2, 30);
    _Datestar.frame = CGRectMake(15, _Dateweek.bottom+10, (SCREEN_WIDTH-30)/3 , 20);
    //
    _Divider.frame = CGRectMake(_Datestar.right, _Datestar.top, _Datestar.width, 20);
    _Datefininsh.frame = CGRectMake(_Divider.right, _Datestar.top, _Divider.width, 15);
    //
    //
    _Airportstar.frame = CGRectMake(15, _Datestar.bottom+10, _Datestar.width, _Datestar.height);
    
    _Airportfinish.frame = CGRectMake(_Divider.right, _Datefininsh.bottom+10, _Datefininsh.width, _Datefininsh.height);
    
    _Airlinesicon.frame = CGRectMake(_Datestar.left, _Airportstar.bottom+10, 30, 30);
    
    _Airlinesinfo.frame = CGRectMake(_Airlinesicon.right, _Airportstar.bottom+10, (SCREEN_WIDTH-30)-_Airlinesicon.width-(SCREEN_WIDTH-30)/4, _Airlinesicon.height);
    
    
    
    
}

#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight
{
    return 150 ;
    
    
}
- (void)configureHeaderData:(id)obj
{
    TicketList * s = obj;
    // Aportinfo * a = s.aportinfo;
    
    _Dateweek.text =[NSString stringWithFormat:@"%@ %@", s.dateinfo.adate,s.dateinfo.aweek] ;
    
    _Datestar.text = s.dateinfo.adate;
    
    _Divider.text = @"----------->";
    
    _Datefininsh.text = s.dateinfo.ddate;
    
    _Airportstar.text = [NSString stringWithFormat:@"%@机场%@",s.aportinfo.aportsname,s.aportinfo.bsname];
    
    _Airportfinish.text = [NSString stringWithFormat:@"%@机场%@",s.dportinfo.aportsname,s.dportinfo.bsname];
    
    [_Airlinesicon setImageWithURL:[NSURL URLWithString:s.basinfo.logourl]  placeholderImage:nil];
    _Airlinesinfo.text = [NSString stringWithFormat:@"%@%@",s.basinfo.airsname,s.basinfo.flgno];
    
}



@end
