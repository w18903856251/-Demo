//
//  OrderInfoTableViewCell.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/23.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "OrderInfoTableViewCell.h"


@interface OrderInfoTableViewCell ()

@property (nonatomic,strong) UILabel     *titleLabel;
@property (nonatomic,strong) UILabel     *titleInfo;
@property (nonatomic,strong) UILabel     *priceLabel;

@property (nonatomic)        UILabel     *downline;
@end

@implementation OrderInfoTableViewCell

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
        
        
        _Refundbutton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
//
        _Refundbutton.tag = 0;
        [_Refundbutton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        _Changebutton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
        //
        _Changebutton.tag = 1;
        [_Changebutton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
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
    
   
    
    _titleInfo.frame  = CGRectMake(15, _titleLabel.bottom+5, 200, 20);
    
     _priceLabel.frame = CGRectMake(15, _titleInfo.bottom+5, 200, 20);
    
    //_downline.frame = CGRectMake(15, _titleInfo.bottom+3, SCREEN_WIDTH-30, 1);
    
    [_Refundbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo((SCREEN_WIDTH-30)/2);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(_priceLabel.mas_bottom).offset(5);
        
    }];
    
    
    
    [_Changebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo((SCREEN_WIDTH-30)/2);
        make.left.mas_equalTo(_Refundbutton.mas_right);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(_priceLabel.mas_bottom).offset(5);
        
    }];

    
//    _Insurancebutton.backgroundColor =[UIColor yellowColor];
    
    
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
- (void)configureUppassengersData
{
    // assignment cell value
    
    _titleLabel.text = @"2016-02-17 周三";
    
    _titleInfo.text  = @"上海-北京 MU5555 经济舱";
    
    _priceLabel.text = @"06:50     -------->    09:05";
    
    
    [_Refundbutton setTitle:@"申请退票" forState:UIControlStateNormal];
    
    [_Changebutton setTitle:@"申请改签" forState:UIControlStateNormal];
    
    
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


@interface OrderCustomerInfoTableViewCell ()

@property (nonatomic,strong) UILabel     *titleLabel;
@property (nonatomic,strong) UILabel     *titleInfo;
@property (nonatomic,strong) UILabel     *priceLabel;

@property (nonatomic)        UILabel     *downline;
@end

@implementation OrderCustomerInfoTableViewCell

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
        
        
        //        _Insurancebutton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:[UIImage imageNamed:@"checkbox"] bg:nil parent:self.contentView];
        //
        //        [_Insurancebutton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
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
    
   
    
    _titleInfo.frame  = CGRectMake(15, _titleLabel.bottom+5, 200, 20);
    
    _downline.frame = CGRectMake(15, _titleLabel.bottom+3, SCREEN_WIDTH-30, 1);
    
     _titleInfo.frame = CGRectMake(15, _downline.bottom+5, 200, 20);
    
    
    _priceLabel.frame = CGRectMake(15, _titleInfo.bottom+5, 200, 20);
    
    
    
    //    [_Insurancebutton mas_makeConstraints:^(MASConstraintMaker *make) {
    //
    //        make.width.mas_equalTo(20);
    //        make.right.mas_equalTo(-15);
    //        make.height.mas_equalTo(20);
    //        make.top.mas_equalTo(10);
    //
    //    }];
    //    _Insurancebutton.backgroundColor =[UIColor yellowColor];
    
    
    //    _markLine.frame = CGRectMake(_titleLabel.right+10,_titleLabel.top,CELLLINEWIDTH,_titleLabel.height);
    //
    //    _contentTextField.frame = CGRectMake(_markLine.right+10,_markLine.top,self.width-_markLine.right-10*2,_markLine.height);
    
}

#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight
{
    //[self calculateCellHeight];
    
    return 120.f;
}


#pragma mark - 配置单元格数据
- (void)configureUppassengersData
{
    // assignment cell value
    
    _titleLabel.text = @"乘机人";
    
    _titleInfo.text  = @"身份证";
    
    _priceLabel.text = @"票号：11111";
    
    
    
    
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



