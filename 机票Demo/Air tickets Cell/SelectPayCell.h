//
//  SelectPayCell.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/21.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TabkeViewCellBtnClickBlock)(id cell,NSUInteger index);
@interface SelectPayCell : UITableViewCell

@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;
@property (nonatomic) UILabel * PayTitleLabel;
@property (nonatomic,strong)  UIButton        *SelectWeiXinPayButton;  // 选择支付方式
@property  (nonatomic,strong) UIButton   *SelectZhiFuBaoButton;
@property  (nonatomic,strong) UIButton   *SelectYinHangKa;
- (void)configureData:(id)data;
@end
