//
//  PayHeadView.h
//  
//
//  Created by 吴宇 on 16/3/21.
//
//

#import <UIKit/UIKit.h>

@interface PayHeadView : UIView
// 支付页面表头数据
#pragma mark - 计算cell高度
+ (CGFloat)calculateCellHeight;
#pragma mark - 配置表头数据
//- (void)configureHeaderData:(id)obj configureshippingspaceHeadData:(id)sender;
- (void)configureHeaderData:(id)obj;
@end
