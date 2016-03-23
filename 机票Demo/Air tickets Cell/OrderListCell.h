//
//  OrderListCell.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/23.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListCell : UITableViewCell

- (void)configureData:(id)data;


#pragma mark - 配置单元格数据

// 模拟  自己创造的数据
- (void)configureCellContent;


@end
