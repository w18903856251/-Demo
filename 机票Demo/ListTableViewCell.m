//
//  ListTableViewCell.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "ListTableViewCell.h"
#import "TicketListEntity.h"
#import "AppUtils.h"
#import "UIView+frame.h"
#import "Ticketseat.h"
#import "Masonry.h"
#import "BaseGroupTableViewController.h"
@interface  ListTableViewCell ()<UIGestureRecognizerDelegate>



@property (nonatomic,strong) UILabel         *Datestar;  //起飞时间
@property (nonatomic,strong)  UILabel        *Divider;   //分割线
@property (nonatomic,strong)  UILabel        *Datefininsh;  //到达时间

@property (nonatomic,strong)  UILabel        *Airportstar;   //起飞机场

@property (nonatomic,strong)  UILabel        *Airportfinish;   //降落机场

@property (nonatomic,strong)  UIImageView    *Airlinesicon; //航空公司图标
@property (nonatomic,strong)  UILabel        *Airlinesinfo;

@property (nonatomic,strong)  UILabel        *Ticketprice; //机票价格

@property (nonatomic,assign)    BOOL           lastOne;
@end




@implementation ListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    UIColor * blackColor = [UIColor blackColor];
    UIFont  *font = [UIFont systemFontOfSize:14];
    self.Datestar =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
    self.Divider  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
    self.Datefininsh  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
    self.Airportstar  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
    self.Airportfinish  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
    self.Airlinesicon = [AppUtils creatNormalImageView:nil img:nil];
     
        [self.contentView addSubview:self.Airlinesicon];
    self.Airlinesinfo  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
    self.Ticketprice  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
     

        
    }
    return self;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UIView"]) {
        return NO;
    }
    return  YES;
}

-(void)event:(UITapGestureRecognizer *)sender{
    
       
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
   
        [super layoutSubviews];
        
    
        
        _Datestar.frame = CGRectMake(15, 5, (SCREEN_WIDTH-30)/4 , 20);
        
        _Divider.frame = CGRectMake(_Datestar.right, _Datestar.top, _Datestar.width, 20);
        _Datefininsh.frame = CGRectMake(_Divider.right, _Datestar.top, _Divider.width, 20);
    
    
    _Airportstar.frame = CGRectMake(15, _Datestar.bottom+10, _Datestar.width, _Datestar.height);
    
    _Airportfinish.frame = CGRectMake(_Divider.right, _Datefininsh.bottom+10, _Datefininsh.width, _Datefininsh.height);
    
    _Airlinesicon.frame = CGRectMake(_Datestar.left, _Airportstar.bottom+10, 30, 30);
    
    _Airlinesinfo.frame = CGRectMake(_Airlinesicon.right, _Airportstar.bottom+10, (SCREEN_WIDTH-30)-_Airlinesicon.width-(SCREEN_WIDTH-30)/4, _Airlinesicon.height);
    
    _Ticketprice.frame = CGRectMake(_Airportfinish.right+10, _Airportfinish.centerY, _Datestar.width-10, 50);
    
    
}


- (void)updateCarContent:(id)obj
{
    TicketList * s = obj;
   // Aportinfo * a = s.aportinfo;
    _Datestar.text = s.dateinfo.adate;
    
    _Divider.text = @"----------->";
    
    _Datefininsh.text = s.dateinfo.ddate;
    
    _Airportstar.text = [NSString stringWithFormat:@"%@机场%@",s.aportinfo.aportsname,s.aportinfo.bsname];
    
    _Airportfinish.text = [NSString stringWithFormat:@"%@机场%@",s.dportinfo.aportsname,s.dportinfo.bsname];
    
    [_Airlinesicon setImageWithURL:[NSURL URLWithString:s.basinfo.logourl]  placeholderImage:nil];
    _Airlinesinfo.text = [NSString stringWithFormat:@"%@%@",s.basinfo.airsname,s.basinfo.flgno];
    
    _Ticketprice.text = [NSString stringWithFormat:@"￥%@",s.policyinfo.tprice];
    
     debugLog(@"obj==%@",s.aportinfo.aportsname);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end



@interface  TicketseatHeadCell ()<UIGestureRecognizerDelegate>


@property (nonatomic,strong) UILabel        *Dateweek;   //起飞日期
@property (nonatomic,strong) UILabel         *Datestar;  //起飞时间
@property (nonatomic,strong)  UILabel        *Divider;   //分割线
@property (nonatomic,strong)  UILabel        *Datefininsh;  //到达时间

@property (nonatomic,strong)  UILabel        *Airportstar;   //起飞机场

@property (nonatomic,strong)  UILabel        *Airportfinish;   //降落机场

@property (nonatomic,strong)  UIImageView    *Airlinesicon; //航空公司图标
@property (nonatomic,strong)  UILabel        *Airlinesinfo;



@property (nonatomic,assign)    BOOL           lastOne;
@end




@implementation TicketseatHeadCell

- (void)awakeFromNib {
    // Initialization code
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        
        
        _Dateweek =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
        self.Datestar =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        self.Divider  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        self.Datefininsh  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
        self.Airportstar  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        self.Airportfinish  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        self.Airlinesicon = [AppUtils creatNormalImageView:nil img:nil];
        
        [self.contentView addSubview:self.Airlinesicon];
        self.Airlinesinfo  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
        
        
        
        
    }
    return self;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UIView"]) {
        return NO;
    }
    return  YES;
}

-(void)event:(UITapGestureRecognizer *)sender{
    
    
    
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


- (void)updateCarContent:(id)obj
{
    TicketList * s = obj;
    // Aportinfo * a = s.aportinfo;
    
    _Dateweek.text =[NSString stringWithFormat:@"%@ %@", s.dateinfo.adate,s.dateinfo.aweek] ;
    
    _Datestar.text = s.dateinfo.adate;
    
    _Divider.text = @"----------->";
    
    _Datefininsh.text = s.dateinfo.ddate;
    
    _Airportstar.text = [NSString stringWithFormat:@"%@机场",s.aportinfo.aportsname];
    
    _Airportfinish.text = [NSString stringWithFormat:@"%@机场",s.dportinfo.aportsname];
    [_Airlinesicon setImageWithURL:[NSURL URLWithString:s.basinfo.logourl]  placeholderImage:nil];
    _Airlinesinfo.text = [NSString stringWithFormat:@"%@%@",s.basinfo.airsname,s.basinfo.flgno];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end


@interface  TicketseatCell ()<UIGestureRecognizerDelegate>



@property (nonatomic,strong) UILabel         *Positions;  //舱位
@property (nonatomic,strong)  UILabel        *Endorse;   //改签
@property (nonatomic,strong)  UILabel        *Votes;  //票数

@property (nonatomic,strong)  UILabel        *SeatPrice;   //座位价格

@property (nonatomic,strong)  UIButton       *Bookingbutton; //预订按钮

@property (nonatomic,assign)    BOOL           lastOne;
@end




@implementation TicketseatCell

- (void)awakeFromNib {
    // Initialization code
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        self.Positions =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        self.Endorse  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        self.Votes  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
        self.SeatPrice  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
        self.Bookingbutton = [AppUtils createButton:@"预订" titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
        [_Bookingbutton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    return self;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UIView"]) {
        return NO;
    }
    return  YES;
}

-(void)event:(UITapGestureRecognizer *)sender{
    
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    _Positions.frame = CGRectMake(15, 15, (SCREEN_WIDTH-30)/4 , 20);
    _Positions.backgroundColor = [UIColor yellowColor];
    _Endorse.frame = CGRectMake(_Positions.left, _Positions.bottom+10, _Positions.width, 20);
    
    //_Votes.frame = CGRectMake(_Positions.right, _Positions.top, _Positions.width, 15);
    
    
    [_SeatPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(_Positions.width);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(_Positions.top);
    }];
    
    _SeatPrice.backgroundColor =[UIColor yellowColor];
    
    [_Bookingbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(_Positions.width);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(_SeatPrice.mas_bottom).offset(5);
    }];
    _Bookingbutton.backgroundColor = [UIColor orangeColor];
    
    [_Votes mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(_Positions.width-20);
        make.right.mas_equalTo(_Bookingbutton.mas_left);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(_SeatPrice.mas_centerY);
    }];
    
    
}


- (void)updateCarContent:(id)obj
{
    Ticketseatlist * s = obj;
    
    _Positions.text =  s.title;
    
    _Endorse.text = s.subTitle;
    
    _Votes.text = @"剩余4张";  //暂时没有票数参数
    
    _SeatPrice.text = s.price;
    
    
    [_Bookingbutton setTitle:@"预订" forState:UIControlStateNormal];
    
   
}

#pragma mark -  按钮 点击
- (void)cellBtnClicked:(UIButton *)btn
{
//    if (btn) {
//        self.btn();
//    }
    
    if (self.btnClickBlock){
        
        self.btnClickBlock(self,btn.tag);
    }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end



