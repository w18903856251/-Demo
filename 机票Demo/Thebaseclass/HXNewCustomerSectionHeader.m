//
//  HXNewCustomerSectionHeader.m
//  chexin
//
//  Created by  hauxia on 15/4/24.
//  Copyright (c) 2015年 华夏二手车. All rights reserved.
//

#import "HXNewCustomerSectionHeader.h"
#import "AppUtils.h"
#import "UIColor+HexString.h"
#import "UIView+frame.h"
//#define HOMEPAGECOLOR_BOSS         @"#059ca7"
//#define  FONT_SIZE_CELL        15.F
@interface  HXNewCustomerSectionHeader ()

@property (nonatomic,strong)  UILabel      *titleLabel;
@end

@implementation HXNewCustomerSectionHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        UIColor  *headerColor = [UIColor colorWithHexString:HOMEPAGECOLOR_BOSS];
        UIFont   *headerFont = [UIFont systemFontOfSize:FONT_SIZE_CELL];
        
        self.titleLabel = [AppUtils creatNormalLabel:headerColor align:NSTextAlignmentLeft font:headerFont parent:self];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleLabel.frame = CGRectMake(10,0.f,self.width-10*2,self.height);
    }

#pragma mark - 计算header高度
+ (CGFloat)calculateHeaderHeight
{
    return  25.f;
}

- (void)configureHeaderData:(NSArray *)array
{
    if ([array count]>0) _titleLabel.text = array[0];
}

@end
