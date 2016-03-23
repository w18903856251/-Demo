//
//  RefundTableViewCell.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/23.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TabkeViewCellBtnClickBlock)(id cell,NSUInteger index);

@interface RefundTableViewCell : UITableViewCell

@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;

@property (nonatomic)  UIButton        *Selectbutton;  //起飞时间

- (void)configureDatas;


@end
