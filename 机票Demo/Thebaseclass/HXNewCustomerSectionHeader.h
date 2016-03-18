//
//  HXNewCustomerSectionHeader.h
//  chexin
//
//  Created by  hauxia on 15/4/24.
//  Copyright (c) 2015年 华夏二手车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXNewCustomerSectionHeader : UITableViewHeaderFooterView

#pragma mark - 计算header高度
+ (CGFloat)calculateHeaderHeight;
- (void)configureHeaderData:(NSArray *)array;
@end
