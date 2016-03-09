//
//  TicketseatHeadView.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/7.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <UIKit/UIKit.h>
// 舱位列表表头
@interface TicketseatHeadView : UIView
#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight;
#pragma mark - 配置表头数据
- (void)configureHeaderData:(id)obj;
@end
