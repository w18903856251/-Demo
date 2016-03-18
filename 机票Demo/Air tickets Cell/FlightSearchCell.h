//
//  FlightSearchCell.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/17.
//  Copyright © 2016年 吴宇. All rights reserved.
//
/*
 **
 机票搜索Cell
 */

#import <UIKit/UIKit.h>
typedef void (^TabkeViewCellBtnClickBlock)(id cell,NSUInteger index);

@interface FlightSearchCell : UITableViewCell

@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;
@property (nonatomic,strong)  UIButton        *StarCityButton;  //起飞城市
@property (nonatomic,strong)  UIButton        *ChangeButton;    //交换按钮
@property (nonatomic,strong)  UIButton        *ReturnCityButton;   //目的地城市
- (void)configureData;
//配置初始信息
- (void)configureData:(id)obj;
@end

@interface FlightSearchDataCell : UITableViewCell
@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;

@property (nonatomic)  UIButton        *StarData;  //起飞时间
@property (nonatomic,strong)  UIButton        *ReturnData;   //返程时间
- (void)configureDatas;
//配置初始信息
- (void)configureDatas:(id)obj;
@end

@interface FlightDoubleSearchDataCell : UITableViewCell
@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;

@property (nonatomic)  UIButton        *StarData;  //起飞时间
@property (nonatomic,strong)  UIButton        *ReturnData;   //返程时间
- (void)configureDatas;
//配置初始信息
- (void)configureDatas:(id)obj;
@end

@interface SearchCell : UITableViewCell
@property (nonatomic,copy) TabkeViewCellBtnClickBlock    btnClickBlock;

@property (nonatomic)  UIButton        *Search;  //搜索按钮
- (void)configureData;
//配置初始信息
- (void)configureData:(id)obj;
@end



