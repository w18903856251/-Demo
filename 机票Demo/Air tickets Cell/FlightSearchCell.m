//
//  FlightSearchCell.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/17.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "FlightSearchCell.h"
#import "Conversionofweek.h"

@interface  FlightSearchCell ()<UIGestureRecognizerDelegate>





@property (nonatomic,strong)  UILabel         *StarLine;  //


@property (nonatomic,strong)  UILabel         *ReturnLine;   //

@property (nonatomic,strong)  UILabel        *Airportfinish;   //降落机场

@property (nonatomic,strong)  UIImageView    *Airlinesicon; //航空公司图标
@property (nonatomic,strong)  UILabel        *Airlinesinfo;

@property (nonatomic,strong)  UILabel        *Ticketprice; //机票价格

@property (nonatomic,assign)    BOOL           lastOne;
@end

@implementation FlightSearchCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        
        
        self.StarCityButton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
        _StarCityButton.tag = 0;
        [_StarCityButton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        self.ReturnCityButton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
        
        [_ReturnCityButton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        self.ChangeButton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
               //[btn.layer setMasksToBounds:YES];
        [_ChangeButton.layer setCornerRadius:20.0];
        [_ReturnCityButton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        self.StarLine  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        self.ReturnLine  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        _ReturnCityButton.tag =1;
        
        
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
    
    
    [_StarCityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(10);
    }];
    _StarCityButton.backgroundColor = [UIColor orangeColor];
    
    [_ChangeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(40);
        make.left.mas_equalTo(_StarCityButton.mas_right).offset(35);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(10);
    }];
    _ChangeButton.backgroundColor = [UIColor blueColor];
    
    [_ReturnCityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(100);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(10);
    }];
    _ReturnCityButton.backgroundColor = [UIColor orangeColor];
    
    [_StarLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(_StarCityButton.mas_width).offset(20);
        make.left.mas_equalTo(5);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_StarCityButton.mas_bottom).offset(3);
    }];
    _StarLine.backgroundColor =[UIColor grayColor];
    
    
    [_ReturnLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(_StarCityButton.mas_width).offset(20);
        make.right.mas_equalTo(-5);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_StarCityButton.mas_bottom).offset(3);
    }];
     _ReturnLine.backgroundColor =[UIColor grayColor];
    
    
    
    
    
    
}

- (void)configureData{
     [_StarCityButton setTitle:@"上海" forState:UIControlStateNormal];
    [_ReturnCityButton setTitle:@"天津" forState:UIControlStateNormal];
    
}

- (void)configureData:(id)obj{
    NSArray * array = obj;
    
    [_StarCityButton setTitle:array[0] forState:UIControlStateNormal];
    
    //[_ReturnCityButton setTitle:array[2] forState:UIControlStateNormal];
    
}



#pragma mark -  按钮 点击
- (void)cellBtnClicked:(UIButton *)btn
{
    //    if (btn) {
    //        self.btn();
    //    }
//    
    if (self.btnClickBlock){
        
        self.btnClickBlock(self,btn.tag);
    }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end

@interface  FlightSearchDataCell ()<UIGestureRecognizerDelegate>


@property (nonatomic,strong)  UILabel          *DownLine;  //下划线


@property (nonatomic,strong)  UILabel           *Datefininsh;  //到达时间

@property (nonatomic,strong)  UILabel        *Airportstar;   //起飞机场

@property (nonatomic,strong)  UILabel        *Airportfinish;   //降落机场

@property (nonatomic,strong)  UIImageView    *Airlinesicon; //航空公司图标
@property (nonatomic,strong)  UILabel        *Airlinesinfo;

@property (nonatomic,strong)  UILabel        *Ticketprice; //机票价格

@property (nonatomic,assign)    BOOL           lastOne;
@end

@implementation FlightSearchDataCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        //        self.Positions =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        //        self.Endorse  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        //        self.Votes  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        //
        //        self.SeatPrice  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
        self.StarData = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
        [_StarData addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        self.ReturnData = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
        [_ReturnData addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
         self.DownLine  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
        
        
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
    
    
    //_StarCityButton.frame = CGRectMake(15, 15, (SCREEN_WIDTH-30)/4 , 20);
    //    _Positions.backgroundColor = [UIColor yellowColor];
    //    _Endorse.frame = CGRectMake(_Positions.left, _Positions.bottom+10, _Positions.width, 20);
    //
    //    //_Votes.frame = CGRectMake(_Positions.right, _Positions.top, _Positions.width, 15);
    //
    //
    //    [_SeatPrice mas_makeConstraints:^(MASConstraintMaker *make) {
    //
    //        make.width.mas_equalTo(_Positions.width);
    //        make.right.mas_equalTo(-15);
    //        make.height.mas_equalTo(20);
    //        make.top.mas_equalTo(_Positions.top);
    //    }];
    //
    //    _SeatPrice.backgroundColor =[UIColor yellowColor];
    
    [_StarData mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(10);
    }];
    _StarData.backgroundColor = [UIColor orangeColor];
    
    
    
    [_ReturnData mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(100);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(10);
    }];
    _ReturnData.backgroundColor = [UIColor orangeColor];
    
    [_DownLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(self.width-10);
        make.left.mas_equalTo(5);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_StarData.mas_bottom).offset(3);
    }];
    _DownLine.backgroundColor =[UIColor grayColor];
    
    
}

- (void)configureDatas{
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM月dd日"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    NSString * date= [Conversionofweek weekdayStringFromDate:currentDate];
    
     [_StarData setTitle:[NSString stringWithFormat:@"%@  %@",dateString,date]  forState: UIControlStateNormal];
//    [_StarData setTitle:@"123" forState:UIControlStateNormal];
//    
//    [_ReturnData setTitle:@"345" forState:UIControlStateNormal];
    
}
- (void)configureDatas:(id)obj{
    NSArray * array = obj;
    
    [_StarData setTitle:array[0] forState:UIControlStateNormal];
    
    [_ReturnData setTitle:array[1] forState:UIControlStateNormal];
    
}



#pragma mark -  按钮 点击
- (void)cellBtnClicked:(UIButton *)btn
{
    if (self.btnClickBlock) self.btnClickBlock(self,btn.tag);
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end


@interface  FlightDoubleSearchDataCell ()<UIGestureRecognizerDelegate>


@property (nonatomic,strong)  UILabel          *DownLine;  //下划线


@property (nonatomic,strong)  UILabel           *Datefininsh;  //到达时间

@property (nonatomic,strong)  UILabel        *Airportstar;   //起飞机场

@property (nonatomic,strong)  UILabel        *Airportfinish;   //降落机场

@property (nonatomic,strong)  UIImageView    *Airlinesicon; //航空公司图标
@property (nonatomic,strong)  UILabel        *Airlinesinfo;

@property (nonatomic,strong)  UILabel        *Ticketprice; //机票价格

@property (nonatomic,assign)    BOOL           lastOne;
@end

@implementation FlightDoubleSearchDataCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        //        self.Positions =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        //        self.Endorse  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        //        self.Votes  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        //
        //        self.SeatPrice  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
        self.StarData = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
        [_StarData addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _StarData.tag = 0;
        self.ReturnData = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
        [_ReturnData addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _ReturnData.tag = 1;
        self.DownLine  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
        
        
        
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
    
    
    //_StarCityButton.frame = CGRectMake(15, 15, (SCREEN_WIDTH-30)/4 , 20);
    //    _Positions.backgroundColor = [UIColor yellowColor];
    //    _Endorse.frame = CGRectMake(_Positions.left, _Positions.bottom+10, _Positions.width, 20);
    //
    //    //_Votes.frame = CGRectMake(_Positions.right, _Positions.top, _Positions.width, 15);
    //
    //
    //    [_SeatPrice mas_makeConstraints:^(MASConstraintMaker *make) {
    //
    //        make.width.mas_equalTo(_Positions.width);
    //        make.right.mas_equalTo(-15);
    //        make.height.mas_equalTo(20);
    //        make.top.mas_equalTo(_Positions.top);
    //    }];
    //
    //    _SeatPrice.backgroundColor =[UIColor yellowColor];
    
    [_StarData mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(10);
    }];
    _StarData.backgroundColor = [UIColor orangeColor];
    
    
    [_ReturnData mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(100);
        make.right.mas_equalTo(1500);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(10);
    }];
    
    
    [UIView animateWithDuration:5 animations:^{
        CGRect frame = CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT);;
        //frame.size.height = 0;
        
        [_ReturnData mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.mas_equalTo(100);
            make.right.mas_equalTo(-15);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(10);
        }];
        
        
        //[self.GSDX setFrame:frame];
    } completion:^(BOOL finished){
        
    }];
    
    
    _ReturnData.backgroundColor = [UIColor orangeColor];
    
    [_DownLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(self.width-10);
        make.left.mas_equalTo(5);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_StarData.mas_bottom).offset(3);
    }];
    _DownLine.backgroundColor =[UIColor grayColor];
    
    
}

- (void)configureDatas{
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM月dd日"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    NSString * date= [Conversionofweek weekdayStringFromDate:currentDate];
    
    [_StarData setTitle:[NSString stringWithFormat:@"%@  %@",dateString,date]  forState: UIControlStateNormal];
    //    [_StarData setTitle:@"123" forState:UIControlStateNormal];
    //
    //    [_ReturnData setTitle:@"345" forState:UIControlStateNormal];
    
}
- (void)configureDatas:(id)obj{
    NSArray * array = obj;
    
    [_StarData setTitle:array[0] forState:UIControlStateNormal];
    
    [_ReturnData setTitle:array[1] forState:UIControlStateNormal];
    
}



#pragma mark -  按钮 点击
- (void)cellBtnClicked:(UIButton *)btn
{
    if (self.btnClickBlock) self.btnClickBlock(self,btn.tag);
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end


@interface  SearchCell ()<UIGestureRecognizerDelegate>




@end

@implementation SearchCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        
        
        self.Search = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
        [_Search addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
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
    
    
    [_Search mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(self.width-30);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(10);
    }];
     [_Search.layer setCornerRadius:10.0];
    _Search.backgroundColor = [UIColor orangeColor];
    
   
    
    
    
    
    
    
}

- (void)configureData{
    [_Search setTitle:@"搜索" forState:UIControlStateNormal];
   
    
}

//- (void)configureData:(id)obj{
//    NSArray * array = obj;
//    
//    [_StarCityButton setTitle:array[0] forState:UIControlStateNormal];
//    
//    //[_ReturnCityButton setTitle:array[2] forState:UIControlStateNormal];
//    
//}



#pragma mark -  按钮 点击
- (void)cellBtnClicked:(UIButton *)btn
{
    
        if (self.btnClickBlock){
    
            self.btnClickBlock(self,btn.tag);
        }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end




