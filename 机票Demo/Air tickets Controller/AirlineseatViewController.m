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

//    //  可以用表头实现也可以两个tableview
//    
//    self.Tickettableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, SCREEN_HEIGHT-64)];
//    self.Tickettableview.tag =1;
//    [self.Tickettableview registerClass:[TicketseatCell class] forCellReuseIdentifier:kTicketCellIdentifier];
//    
//    
//    
//    [UIView animateWithDuration:.25f delay:.1f options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.Tickettableview.frame = CGRectMake(0, 0, self.view.frame.size.width, SCREEN_HEIGHT-64);
//        
//    } completion:^(BOOL finished) {
//        
//        //        [_nameTf becomeFirstResponder];
//    }];
    
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
//    homeHeader.delegate = self;
//    
//    
//    HXHomePageHeaderBoss  *bossHeader = (HXHomePageHeaderBoss *)self.groupTable.tableHeaderView;
//    [bossHeader configureHeaderData];
//    self.Tickettableview.tableFooterView = [[UIView alloc]init];
//    self.Tickettableview.dataSource =self;
//    self.Tickettableview.delegate = self;
//    [self.view addSubview:self.Tickettableview];
    
    
   
    
    _dataDelegate = [[BaseGroupTableViewController alloc] initWithIdentifier:kTicketCellIdentifier configureBlock:^(TicketseatCell* cell, id model, NSIndexPath *indexPath) {
        
        
        [cell updateCarContent:model];
        
        __weak AirlineseatViewController   *sellCtrl = self;
        
        
        cell.btnClickBlock = ^(id cell,NSUInteger index) {
            
            [sellCtrl handleCellClickedEvent:cell index:index];
            
                };
        //cell.textLabel.text = model;
        
    }];
    
    self.groupTable.dataSource = _dataDelegate;
    
    
    
    // Do any additional setup after loading the view.
}

//- (UIView *)tableView:(UITableView *)tableView
//viewForHeaderInSection:(NSInteger)section{
//
//    UIView *_headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];//创建一个视图
//    
//    
//    return _headerView;
//
//}
//#pragma mark - Table view data source
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    // Return the number of sections.
//    
//    
//       return self.dataSource.count;
//   
//    
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//    return 1;
//    
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//   
       // TicketseatCell *cell =  [tableView dequeueReusableCellWithIdentifier:kTicketCellIdentifier forIndexPath:indexPath];
//    
   // __weak AirlineseatViewController   *sellCtrl = self;
    //cell.btnClickBlock = ^(id cell,NSUInteger index) {
//        [sellCtrl handleCellClickedEvent:cell index:index];
//    };
//    
//        [cell updateCarContent:self.dataSource[indexPath.section]];
//        
//        
//        
//        return cell;
// 
//   }
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    return 80;
//    
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 15;
//    
//}
//


#pragma mark - 处理按钮点击 事件
- (void)handleCellClickedEvent:(TicketseatCell *)cell index:(NSUInteger)btnIndex
{
    NSIndexPath   *indexPath = [self.Tickettableview indexPathForCell:cell];
    
    debugLog(@"++++++%ld",indexPath.row);
    
    ReservationforcustomerinfoViewController * reservation = [[ReservationforcustomerinfoViewController alloc]init];
    
    reservation.objData = _obj;
    
    reservation.spaceobjData = self.dataSource[indexPath.section];
    
    [self pushViewController:reservation];
    
//    switch (btnIndex) {
//        case 0:
//            debugLog(@"哈哈");
//            break;
//        case 1:
//        
//            break;
//        case 2:
//                    break;
//        case 3:
//        
//            break;
//        default:
//            break;
//    }
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
