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
