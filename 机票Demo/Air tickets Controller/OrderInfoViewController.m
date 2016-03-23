//
//  OrderInfoViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/23.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "OrderInfoViewController.h"
#import "OrderHeadView.h"
#import "OrderInfoTableViewCell.h"
#import "RefundTicketViewController.h"
#import "ChangeTicketViewController.h"


#define kOrderInfoTableViewCellIdentifier @"OrderInfoTableViewCellIdentifie"
#define kOrderCustomerInfoTableViewCellIdentifier  @"OrderCustomerInfoTableViewCellIdentifier"
#define kUITableViewCellIdentifier  @"UITableViewCellIdentifier"

@interface OrderInfoViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation OrderInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    
    self.groupTable.delegate = self;
    self.groupTable.dataSource = self;
    self.groupTable.frame = CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    
     [self.groupTable registerClass: [OrderInfoTableViewCell class]forCellReuseIdentifier:kOrderInfoTableViewCellIdentifier];
    
    [self.groupTable registerClass: [OrderCustomerInfoTableViewCell class]forCellReuseIdentifier:kOrderCustomerInfoTableViewCellIdentifier];
    
    
    [self.groupTable registerClass: [UITableViewCell class]forCellReuseIdentifier:kUITableViewCellIdentifier];
    
    
    OrderHeadView *customerHeader = [[OrderHeadView alloc] initWithFrame:CGRectMake(0.f,0.f,self.view.width,[OrderHeadView calculateCellHeight])];
    
    self.groupTable.tableHeaderView = customerHeader;
    
    UIView * aview = [[UIView alloc] initWithFrame:CGRectMake(10.f,0.f,self.view.width-10*2,[OrderHeadView calculateCellHeight]-20)];
    //添加边框
    CALayer * layer = [aview layer];
    layer.borderColor = [
                         [UIColor blackColor] CGColor];
    layer.borderWidth = 1.0f;
    
    [customerHeader configureHeaderData];
    //[customerHeader configureHeaderData:_obj configureshippingspaceHeadData:_spaceobjData];
    
    [customerHeader addSubview:aview];

    
    
    
    // Do any additional setup after loading the view.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section==0) {
        return 1;
    }else{
        return 2;
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section==0) {
        OrderInfoTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:kOrderInfoTableViewCellIdentifier  forIndexPath:indexPath];
        
        [cell configureUppassengersData];
        
            cell.btnClickBlock = ^(id cell, NSUInteger index){
        
                
                
                debugLog(@"index==%ld",index);
                //index = indexPath.row;
              [self Selectchick:cell index:index];
        
        
                
            };
        
        return cell;
    }else if (indexPath.section==1){
        
        OrderCustomerInfoTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:kOrderCustomerInfoTableViewCellIdentifier  forIndexPath:indexPath];
        
        [cell configureUppassengersData];
        
        //    cell.btnClickBlock = ^(id cell, NSUInteger index){
        //
        //        index = indexPath.row;
        //        [self Selectchick:cell index:indexPath.row];
        //
        //
        //
        //    };
        
        return cell;
        
    }else{
        
        
        UITableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:kUITableViewCellIdentifier  forIndexPath:indexPath];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row==0) {
            cell.textLabel.text = @"预订接送机服务";
        }else{
            cell.textLabel.text = @"购买机票返程服务";
        }
        
        return cell;
        
    }


    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2) {
        return 44;
    }else{
       return  120;
    }
}

-(void)Selectchick:(OrderInfoTableViewCell*)cell index:(NSUInteger)btnindex{
    
    
    if (btnindex==0) {
        
        RefundTicketViewController * tick = [[RefundTicketViewController alloc]init];
        
        [ self pushViewController:tick];
    }else{
        ChangeTicketViewController * changeticket = [[ChangeTicketViewController alloc]init];
        
        [self pushViewController:changeticket];
        
        
    }
    
    
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
