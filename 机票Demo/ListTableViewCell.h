//
//  ListTableViewCell.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell
- (void)updateCarContent:(id)obj;
@end

//机票座位表头
@interface TicketseatHeadCell: UITableViewCell
- (void)updateCarContent:(id)obj;
@end

typedef void (^TabkeViewCellBtnClickBlock)(id cell,NSUInteger index);
//机票座位
@interface TicketseatCell : UITableViewCell

@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;

@property (nonatomic,copy) void (^btn)();

- (void)updateCarContent:(id)obj;

@end
