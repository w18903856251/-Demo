//
//  BaseGroupTableViewController.h
//  机票Demo
//
//  Created by 吴宇 on 16/3/10.
//  Copyright © 2016年 吴宇. All rights reserved.
//

/*
 **
 */
//  封装基类TableViewController


#import "BaseViewController.h"

//声明block
typedef void (^CellConfigureBefore)(id cell, id model, NSIndexPath * indexPath);

@interface BaseGroupTableViewController : BaseViewController

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before;

@property (nonatomic, copy) CellConfigureBefore cellConfigureBefore;

@property (nonatomic,strong) UITableView    *groupTable;
@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic, strong)  NSString *cellIdentifier;
//---------Public

- (void)addModels:(NSArray *)models;

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;


@end
