//
//  OrderListViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/22.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "OrderListViewController.h"
#import "OrderListCell.h"
#import "OrderInfoViewController.h"

#define kOrderListCellIdentifier  @"OrderListCellIdentifier"

@interface OrderListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)  BaseGroupTableViewController *dataDelegate;
@end

@implementation OrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单列表";
    
    self.groupTable.delegate = self;
    self.groupTable.frame = CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    
    [self.groupTable registerClass: [OrderListCell class]forCellReuseIdentifier:kOrderListCellIdentifier];
    
    
    _dataDelegate = [[BaseGroupTableViewController alloc] initWithIdentifier:kOrderListCellIdentifier configureBlock:^(OrderListCell* cell, id model, NSIndexPath *indexPath) {
        
        
        [cell configureCellContent];
        
    
    }];
    
    
    
    NSArray * a = @[@"1",@"2"];
    
    
    [_dataDelegate addModels:a];
    
    self.groupTable.dataSource = _dataDelegate;
    
    
    [self.groupTable reloadData];
    
    // Do any additional setup after loading the view.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 104 ;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    OrderInfoViewController *orderinfo = [[OrderInfoViewController alloc]init];
    
    //airlineseat.obj = _dataDelegate.dataSource[indexPath.row];
    
    
   
    
    [self pushViewController:orderinfo];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
