//
//  SelectPayCell.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/21.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "SelectPayCell.h"

@interface  SelectPayCell ()

@property (nonatomic) UIImageView  *backimageview;
@end


@implementation SelectPayCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
        
        _backimageview = [[UIImageView alloc]init];
        
        _backimageview.backgroundColor =[UIColor clearColor];
        [self.contentView addSubview:_backimageview];
        
        _PayTitleLabel  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentLeft font:font parent:self.backimageview];
        
        
        _SelectWeiXinPayButton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:[UIImage imageNamed:@"checkbox"] bg:nil parent:self.contentView];
       
        [_SelectWeiXinPayButton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _SelectZhiFuBaoButton = [AppUtils createButton:nil titleColor:[UIColor blackColor] img:[UIImage imageNamed:@"checkbox"] bg:nil parent:self.contentView];
        _SelectZhiFuBaoButton.tag=1;
        [_SelectZhiFuBaoButton addTarget:self action:@selector(cellBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _backimageview.frame = CGRectMake(15, 0, SCREEN_WIDTH-30, 50);
    _backimageview.layer.borderWidth = 1;
    _backimageview.layer.borderColor = [[UIColor grayColor] CGColor];

    
    _PayTitleLabel.frame = CGRectMake(15, 10, SCREEN_WIDTH-30-50, 30);
    
    [_SelectWeiXinPayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(30);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(10);
        
    }];
    
//    [_SelectZhiFuBaoButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.width.mas_equalTo(30);
//        make.right.mas_equalTo(-15);
//        make.height.mas_equalTo(30);
//        make.top.mas_equalTo(10);
//        
//    }];
    

}

- (void)configureData:(id)data{
    
     debugLog(@"debug===%@",data);
    
}


#pragma mark -  按钮 点击
- (void)cellBtnClicked:(UIButton *)btn
{
    
    
    
   
    if (self.btnClickBlock){
        
        self.btnClickBlock(self,btn.tag);
        
        //[btn setImage:[UIImage imageNamed:@"checkboxons"] forState:UIControlStateNormal];
        
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
