//
//  UserBookingTableViewCell.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/9.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "UserBookingTableViewCell.h"
#import "AppUtils.h"
#define CELLLINEWIDTH          2.F
#define PLACELABELWIDTH        20.F
#define DEFAULTTITLELABELWIDTH 60.f
#define DEFAULTGRAYCOLOR           @"#f5f5f5"   //默认灰色
@interface UserBookingTableViewCell ()

@property (nonatomic,strong) UILabel     *titleLabel;
@property (nonatomic,strong) UILabel     *markLine;
@end
@implementation UserBookingTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor    *grayColor = [UIColor grayColor];
        UIColor    *blackColor = [UIColor blackColor];
        
        UIFont     *cellFont = [UIFont systemFontOfSize:13];
        
        self.titleLabel = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        
        self.markLine= [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        _markLine.backgroundColor = [UIColor  colorWithHexString:DEFAULTGRAYCOLOR];
        
        self.contentTextField = [AppUtils creatNormalTextField:nil color:blackColor align:NSTextAlignmentLeft parent:self.contentView];
        _contentTextField.font = cellFont;
        _contentTextField.userInteractionEnabled = NO;
        //[_contentTextField addToolBar];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_titleLabel sizeToFit];
    _titleLabel.frame = CGRectMake(15,10,(_titleLabel.width<DEFAULTTITLELABELWIDTH)?DEFAULTTITLELABELWIDTH:_titleLabel.width,self.height-10*2);
    
    _markLine.frame = CGRectMake(_titleLabel.right+10,_titleLabel.top,CELLLINEWIDTH,_titleLabel.height);
    
    _contentTextField.frame = CGRectMake(_markLine.right+10,_markLine.top,self.width-_markLine.right-10*2,_markLine.height);
    
}

#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight
{
    //[self calculateCellHeight];
    
    return 44.f;
}


#pragma mark - 配置单元格数据
- (void)configureCellContent:(NSArray *)array
{
    // assignment cell value
    
    _titleLabel.text = array[0];
    _contentTextField.placeholder = array[1];
    _contentTextField.text = nil;
}

- (void)updateCellContent:(NSArray *)array
{
    if (array)  _contentTextField.text = array[0];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


@interface UserInsuranceTableViewCell ()

@property (nonatomic,strong) UILabel     *titleLabel;
@property (nonatomic,strong) UILabel     *titleInfo;
@property (nonatomic,strong) UILabel     *priceLabel;

@property (nonatomic)        UILabel     *downline;
@end
@implementation UserInsuranceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor    *grayColor = [UIColor grayColor];
        UIColor    *blackColor = [UIColor blackColor];
        
        UIFont     *cellFont = [UIFont systemFontOfSize:13];
        
        self.titleLabel = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        
         self.titleInfo = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
         self.priceLabel = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        
        
        self.downline = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        _downline.backgroundColor =[UIColor grayColor];
        
        
        _Insurancebutton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:[UIImage imageNamed:@"checkbox"] bg:nil parent:self.contentView];
        
         [_Insurancebutton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
//        self.markLine= [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
//        _markLine.backgroundColor = [UIColor  colorWithHexString:DEFAULTGRAYCOLOR];
        
//        self.contentTextField = [AppUtils creatNormalTextField:nil color:blackColor align:NSTextAlignmentLeft parent:self.contentView];
//        _contentTextField.font = cellFont;
//        _contentTextField.userInteractionEnabled = NO;
        //[_contentTextField addToolBar];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_titleLabel sizeToFit];
    _titleLabel.frame = CGRectMake(15,5,200,20);
    
    _priceLabel.frame = CGRectMake(_titleLabel.right+5, 15, 60, 20);
    
    _titleInfo.frame  = CGRectMake(15, _titleLabel.bottom+5, 200, 20);
    _downline.frame = CGRectMake(15, _titleInfo.bottom+3, SCREEN_WIDTH-30, 1);
   
    [_Insurancebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(20);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(10);
        
    }];
    _Insurancebutton.backgroundColor =[UIColor yellowColor];
    
    
//    _markLine.frame = CGRectMake(_titleLabel.right+10,_titleLabel.top,CELLLINEWIDTH,_titleLabel.height);
//    
//    _contentTextField.frame = CGRectMake(_markLine.right+10,_markLine.top,self.width-_markLine.right-10*2,_markLine.height);
    
}

#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight
{
    //[self calculateCellHeight];
    
    return 44.f;
}


#pragma mark - 配置单元格数据
- (void)configureCellContent:(NSArray *)array
{
    // assignment cell value
    
    _titleLabel.text = array[0];
    
    _titleInfo.text  = array[1];
    
    _priceLabel.text = array[2];
    
//    _contentTextField.placeholder = array[1];
//    _contentTextField.text = nil;
}

- (void)updateCellContent:(NSArray *)array
{
    //if (array)  _contentTextField.text = array[0];
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


@interface UserReimbursementTableViewCell ()

@property (nonatomic,strong) UILabel     *titleLabel;

@end
@implementation UserReimbursementTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor    *grayColor = [UIColor grayColor];
        UIColor    *blackColor = [UIColor blackColor];
        
        UIFont     *cellFont = [UIFont systemFontOfSize:13];
        
        self.titleLabel = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        
        
        
        
        _Insurancebutton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:[UIImage imageNamed:@"checkbox"] bg:nil parent:self.contentView];
        
        [_Insurancebutton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        //        self.markLine= [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        //        _markLine.backgroundColor = [UIColor  colorWithHexString:DEFAULTGRAYCOLOR];
        
        //        self.contentTextField = [AppUtils creatNormalTextField:nil color:blackColor align:NSTextAlignmentLeft parent:self.contentView];
        //        _contentTextField.font = cellFont;
        //        _contentTextField.userInteractionEnabled = NO;
        //[_contentTextField addToolBar];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_titleLabel sizeToFit];
    _titleLabel.frame = CGRectMake(15,10,200,20);
    
    
    [_Insurancebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(20);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(10);
        
    }];
    _Insurancebutton.backgroundColor =[UIColor yellowColor];
    
    
    //    _markLine.frame = CGRectMake(_titleLabel.right+10,_titleLabel.top,CELLLINEWIDTH,_titleLabel.height);
    //
    //    _contentTextField.frame = CGRectMake(_markLine.right+10,_markLine.top,self.width-_markLine.right-10*2,_markLine.height);
    
}

#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight
{
    //[self calculateCellHeight];
    
    return 44.f;
}


#pragma mark - 配置单元格数据
- (void)configureCellContent:(NSArray *)array
{
    // assignment cell value
    
    _titleLabel.text = array[0];
    
   
    
    //    _contentTextField.placeholder = array[1];
    //    _contentTextField.text = nil;
}

- (void)updateCellContent:(NSArray *)array
{
    //if (array)  _contentTextField.text = array[0];
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


@interface UserPayMoneyTableViewCell ()

@property (nonatomic,strong) UILabel     *titleoneLabel;
@property (nonatomic)        UILabel     *titletwoLabel;
@property (nonatomic)        UILabel     *titlethreeLabel;
@property (nonatomic)        UILabel     *priceLabel;

@end
@implementation UserPayMoneyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor    *grayColor = [UIColor grayColor];
        UIColor    *orangeColor = [UIColor orangeColor];
        
        UIFont     *cellFont = [UIFont systemFontOfSize:13];
        
        self.titleoneLabel = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        self.titletwoLabel = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        self.titlethreeLabel = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        self.priceLabel = [AppUtils creatNormalLabel:orangeColor align:NSTextAlignmentCenter font:cellFont parent:self.contentView];
        
        
        
        
        _Pay = [AppUtils createButton:@"支付" titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
        _Pay.backgroundColor =[UIColor orangeColor];
        [_Pay.layer setCornerRadius:10.0];
        [_Pay addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        //        self.markLine= [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        //        _markLine.backgroundColor = [UIColor  colorWithHexString:DEFAULTGRAYCOLOR];
        
        //        self.contentTextField = [AppUtils creatNormalTextField:nil color:blackColor align:NSTextAlignmentLeft parent:self.contentView];
        //        _contentTextField.font = cellFont;
        //        _contentTextField.userInteractionEnabled = NO;
        //[_contentTextField addToolBar];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_titleoneLabel sizeToFit];
    _titleoneLabel.frame = CGRectMake(15,10,200,20);
    _titletwoLabel.frame = CGRectMake(15,_titleoneLabel.bottom+3,200,20);
    _titlethreeLabel.frame = CGRectMake(15,_titletwoLabel.bottom+3,200,20);
    _Pay.frame = CGRectMake(15,_titlethreeLabel.bottom+5,SCREEN_WIDTH-30,40);
    
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(100);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(20);
        
    }];
    
    
    //    _markLine.frame = CGRectMake(_titleLabel.right+10,_titleLabel.top,CELLLINEWIDTH,_titleLabel.height);
    //
    //    _contentTextField.frame = CGRectMake(_markLine.right+10,_markLine.top,self.width-_markLine.right-10*2,_markLine.height);
    
}

#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight
{
    //[self calculateCellHeight];
    
    return 44.f;
}


#pragma mark - 配置单元格数据
- (void)configureCellContent:(NSArray *)array
{
    // assignment cell value
    
    _titleoneLabel.text = array[0];
    
    _titletwoLabel.text = array[1];
    
    _titlethreeLabel.text = array[2];
    
    _priceLabel.text = array[3];
    
    //    _contentTextField.placeholder = array[1];
    //    _contentTextField.text = nil;
}

- (void)updateCellContent:(NSArray *)array
{
    //if (array)  _contentTextField.text = array[0];
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






