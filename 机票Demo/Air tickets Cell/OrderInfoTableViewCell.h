//
//  OrderInfoTableViewCell.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/23.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TabkeViewCellBtnClickBlock)(id cell,NSUInteger index);
@interface OrderInfoTableViewCell : UITableViewCell
@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;
@property (nonatomic,strong) UIButton *Refundbutton;
@property (nonatomic)        UIButton *Changebutton;

- (void)configureUppassengersData;
@end


@interface OrderCustomerInfoTableViewCell : UITableViewCell
@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;
@property (nonatomic,strong) UIButton *Refundbutton;
@property (nonatomic)        UIButton *Changebutton;

- (void)configureUppassengersData;
@end
