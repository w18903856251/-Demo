//
//  RefundTableViewCell.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/23.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "RefundTableViewCell.h"

@interface RefundTableViewCell ()<UIGestureRecognizerDelegate>





@property (nonatomic,strong)  UILabel         *StarLine;  //


@property (nonatomic,strong)  UILabel         *ReturnLine;   //

@property (nonatomic,strong)  UILabel        *Airportfinish;   //降落机场



@property (nonatomic,assign)    BOOL           lastOne;
@end



@implementation RefundTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        
        
       
        
        self.StarLine  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self.contentView];
        self.ReturnLine  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self.contentView];
       
        self.Airportfinish = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self.contentView];
        
        
        _Selectbutton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:[UIImage imageNamed:@"checkbox"] bg:nil parent:self.contentView];
        
        [_Selectbutton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
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
    
    
    
    
    [_StarLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(SCREEN_WIDTH-30);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(5);
    }];
    //_StarLine.backgroundColor =[UIColor grayColor];
    
    
    [_ReturnLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(SCREEN_WIDTH-30);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(_StarLine.mas_bottom).offset(3);
    }];
    _ReturnLine.backgroundColor =[UIColor grayColor];
    
    [_Airportfinish mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(_ReturnLine.mas_bottom).offset(3);
    }];
    
    
    [_Selectbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(50);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(_ReturnLine.mas_bottom).offset(3);
    }];

    
    
    
    
}

- (void)configureDatas{
    
    _StarLine.text = @"选择乘机人";
    _Airportfinish.text = @"XXX成人";
    
    
    
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


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
