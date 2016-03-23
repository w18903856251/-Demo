//
//  OrderListCell.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/23.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "OrderListCell.h"

@interface OrderListCell ()

@property (nonatomic,strong) UILabel     *titleLabel;
@property (nonatomic,strong) UILabel     *datainfo;
@property (nonatomic,strong) UILabel     *starair;

@property (nonatomic)        UILabel     *returnair;

@property (nonatomic)        UILabel      *price;

@property  (nonatomic)       UILabel     *Ticketstatus;

@end




@implementation OrderListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor    *grayColor = [UIColor grayColor];
        UIColor    *blackColor = [UIColor blackColor];
        
        UIFont     *cellFont = [UIFont systemFontOfSize:13];
        
        self.titleLabel = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        
        self.datainfo = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        self.starair = [AppUtils creatNormalLabel:grayColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        
        
        self.returnair = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        
         self.price = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
         self.returnair = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        
        self.Ticketstatus = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:cellFont parent:self.contentView];
        
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
    
    _datainfo.frame = CGRectMake(15, _titleLabel.bottom+5, 60, 20);
    
    _starair.frame  = CGRectMake(15, _datainfo.bottom+5, 200, 20);
    _returnair.frame = CGRectMake(15, _starair.bottom+5, 200, 20);
    
    [_price mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(80);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(10);
        
    }];
    
    
    [_Ticketstatus mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(80);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(_price.mas_bottom).offset(10);
        
    }];

    
   
    
    
    //    _markLine.frame = CGRectMake(_titleLabel.right+10,_titleLabel.top,CELLLINEWIDTH,_titleLabel.height);
    //
    //    _contentTextField.frame = CGRectMake(_markLine.right+10,_markLine.top,self.width-_markLine.right-10*2,_markLine.height);
    
}

#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight
{
    //[self calculateCellHeight];
    
    return 84.f;
}


#pragma mark -模拟的数据
- (void)configureCellContent
{
    // assignment cell value
    
    
    _titleLabel.text = @"上海-北京 MU5555经济舱";
    
    _datainfo.text  = @"起飞时间: 2016-02-17";
    
    _starair.text   = @"浦东机场T1 7:30";

    _returnair.text = @"首都机场T2 7:30";
    
    _price.text  = @"￥1240";
    
    _Ticketstatus.text = @"已出票";
    
    
}




#pragma mark - 配置单元格数据
- (void)configureData:(id)data{
    
    
    
}





- (void)updateCellContent:(NSArray *)array
{
    //if (array)  _contentTextField.text = array[0];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
