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

@interface UserBookingTableViewCell : UITableViewCell
@property (nonatomic,strong) UITextField *contentTextField;
//配置乘机人
- (void)configureUppassengersData;
- (void)configureCellContent:(NSArray *)array;
@end
