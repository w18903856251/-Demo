//
//  AirlineseatViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/7.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "AirlineseatViewController.h"
#import "ListTableViewCell.h"
#import "Publicrequest.h"
#import "Ticketseat.h"
#import "TicketseatHeadView.h"
#import "ReservationforcustomerinfoViewController.h"
#define kTicketCellIdentifier      @"TicketCellIdentifier"
@interface AirlineseatViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView  *Tickettableview;

@property (nonatomic,strong) UITableView  *Tickinfotableview;


@property (strong, nonatomic)  BaseGroupTableViewController *dataDelegate;

@end

@implementation AirlineseatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self requestTicketseatDatas];

    
    self.groupTable.delegate = self;
    self.groupTable.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    [self.groupTable registerClass:[TicketseatCell class] forCellReuseIdentifier:kTicketCellIdentifier];
    
   
    //*
    TicketseatHeadView  *SeatHeader = [[TicketseatHeadView alloc] initWithFrame:CGRectMake(0.f,0.f,self.view.width,[TicketseatHeadView calculateCellHeight])];
     self.groupTable.tableHeaderView = SeatHeader;
   
    UIView * aview = [[UIView alloc] initWithFrame:CGRectMake(10.f,10.f,self.view.width-10*2,[TicketseatHeadView calculateCellHeight]-20)];
    //添加边框
    CALayer * layer = [aview layer];
    layer.borderColor = [
                         [UIColor blackColor] CGColor];
    layer.borderWidth = 1.0f;
    
    [SeatHeader configureHeaderData:_obj];
    
    [SeatHeader addSubview:aview];
    
    _dataDelegate = [[BaseGroupTableViewController alloc] initWithIdentifier:kTicketCellIdentifier configureBlock:^(TicketseatCell* cell, id model, NSIndexPath *indexPath) {
        
        
        [cell updateCarContent:model];
        
        __weak AirlineseatViewController   *sellCtrl = self;
        
        
        cell.btnClickBlock = ^(id cell,NSUInteger index) {
            
            index = indexPath.row;
            [sellCtrl handleCellClickedEvent:cell index:index];
            
                };
        //cell.textLabel.text = model;
        
    }];
    
    self.groupTable.dataSource = _dataDelegate;
    
    
    
    // Do any additional setup after loading the view.
}



#pragma mark - 处理按钮点击 事件
- (void)handleCellClickedEvent:(TicketseatCell *)cell index:(NSUInteger)btnIndex
{
   // NSIndexPath   *indexPaths = [self.Tickettableview indexPathForCell:cell];
    
   
    ReservationforcustomerinfoViewController * reservation = [[ReservationforcustomerinfoViewController alloc]init];
    
    reservation.objData = _obj;
    
    reservation.spaceobjData = self.dataSource[btnIndex];
    
    //  设为空  默认系统效果
     self.navigationController.delegate = nil;
    
    
    
    [self pushViewController:reservation];
    
}



#pragma mark---网络请求------
- (void)requestTicketseatDatas
{
    __weak __typeof(self) weakSelf = self;
    NSMutableDictionary   *Ticketseatlist;
    Ticketseatlist  = [NSMutableDictionary dictionaryWithCapacity:0];
    
    [Publicrequest requestTicketseatWithParameters:Ticketseatlist success:^(id obj) {
        
        
        Ticketseat  *ticketEntity = (Ticketseat *)obj;
        weakSelf.dataSource = [NSMutableArray arrayWithArray:ticketEntity.retData];
         [_dataDelegate addModels:weakSelf.dataSource];
        
        
        [weakSelf.groupTable reloadData];
        
    } fail:^(id obj) {
        
    } complete:^(id obj) {
        
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
