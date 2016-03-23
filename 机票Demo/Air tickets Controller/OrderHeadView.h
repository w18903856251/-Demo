//
//  OrderHeadView.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/23.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderHeadView : UIView
+ (CGFloat)calculateCellHeight;
#pragma mark - 配置表头数据
//- (void)configureHeaderData:(id)obj configureshippingspaceHeadData:(id)sender;
- (void)configureHeaderData;
@end
