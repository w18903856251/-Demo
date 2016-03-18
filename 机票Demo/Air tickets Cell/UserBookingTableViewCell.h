//
//  UserBookingTableViewCell.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/9.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <UIKit/UIKit.h>
//  订票页面cell

/**
 *   普通  选择 或  输入
 */
typedef void (^TabkeViewCellBtnClickBlock)(id cell,NSUInteger index);
@interface UserBookingTableViewCell : UITableViewCell
@property (nonatomic,strong) UITextField *contentTextField;
//配置乘机人
- (void)configureUppassengersData;
- (void)configureCellContent:(NSArray *)array;
@end
/**
 *   普通保险勾选
 */

@interface UserInsuranceTableViewCell : UITableViewCell
@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;
@property (nonatomic,strong) UIButton *Insurancebutton;
//配置保险
- (void)configureUppassengersData;
- (void)configureCellContent:(NSArray *)array;
@end
/*
 **
 普通凭证勾选
 */
@interface UserReimbursementTableViewCell : UITableViewCell
@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;
@property (nonatomic,strong) UIButton *Insurancebutton;
//配置保险
- (void)configureReimbursementData;
- (void)configureCellContent:(NSArray *)array;
@end


/*
 **
 价格计算支付
 */
@interface UserPayMoneyTableViewCell : UITableViewCell
@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;
@property (nonatomic,strong) UIButton *Pay;
//配置信息
- (void)configureReimbursementData;
- (void)configureCellContent:(NSArray *)array;
@end



