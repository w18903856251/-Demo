//
//  TicketListViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "TicketListViewController.h"
#import "Publicrequest.h"
#import "TicketListEntity.h"
#import "ListTableViewCell.h"
#import "AirlineseatViewController.h"


#define kListCellIdentifier            @"ListCellIdentifier"
@interface TicketListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain)   NSMutableArray  *dataSources;
@property (nonatomic,strong)   UITableView *tableviewlist;
@property (strong, nonatomic)  BaseGroupTableViewController *dataDelegate;

@end

@implementation TicketListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataSources = [[NSMutableArray alloc]initWithCapacity:3];
    self.navigationItem.title = @"上海 - 天津";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self requestTicketlistDatas];
    
    
    self.groupTable.delegate = self;
    self.groupTable.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    [self.groupTable registerClass:[ListTableViewCell class] forCellReuseIdentifier:kListCellIdentifier];
    
    
    
//    self.tableviewlist = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-64)];
//    [self.tableviewlist registerClass:[ListTableViewCell class] forCellReuseIdentifier:kListCellIdentifier];
//    
//    [UIView animateWithDuration:.25f delay:.1f options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.tableviewlist.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
//        
//    } completion:^(BOOL finished) {
//        
//        //        [_nameTf becomeFirstResponder];
//    }];
//    self.tableviewlist.tableFooterView = [[UIView alloc]init];
//    //self.tableviewlist.dataSource =self;
//    self.tableviewlist.delegate = self;
//    [self.view addSubview:self.tableviewlist];
    
//    self.groupTable.frame = CGRectMake(0.f, 0.f, self.view.width, self.view.height);
//    
//    self.groupTable.delegate = self;
//    self.groupTable.dataSource = self;
//
//    [_dataDelegate addModels:@[@"a",@"b",@"c",@"d",@"10"]];
//    
//    [self.groupTable reloadData];
    
    
    _dataDelegate = [[BaseGroupTableViewController alloc] initWithIdentifier:kListCellIdentifier configureBlock:^(ListTableViewCell* cell, id model, NSIndexPath *indexPath) {
        
        
        [cell updateCarContent:model];
        //cell.textLabel.text = model;
        
    }];
    
    self.groupTable.dataSource = _dataDelegate;
   
    
}


//#pragma mark - Table view data source
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    // Return the number of sections.
//    return 2;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Return the number of rows in the section.
//    
//   
//    return self.dataSource.count;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    //__weak TicketListViewController   *buyCarCtrl = self;
//    ListTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:kListCellIdentifier forIndexPath:indexPath];
//    
////    cell.btnClickBlock = ^(id cell,NSUInteger index) {
////        [buyCarCtrl handleCellBtnClicked:cell index:index];
////    };
    //[cell updateCarContent:self.dataSource[indexPath.row]];
//    
//    return cell;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    return 100;
//    
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 15;
//    
//}
//
//
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AirlineseatViewController *airlineseat = [[AirlineseatViewController alloc]init];
    
    airlineseat.obj = self.dataSource[indexPath.row];
    
    [self pushViewController:airlineseat];
    
    
}



#pragma mark - /***     网络请求     ****/
- (void)requestTicketlistDatas
{
     __weak __typeof(self) weakSelf = self;
     NSMutableDictionary   *Ticketlist;
    Ticketlist  = [NSMutableDictionary dictionaryWithCapacity:0];
    
    [Publicrequest requestTicketlistWithParameters:Ticketlist success:^(id obj) {
        
       
        TicketListEntity  *buyEntity = (TicketListEntity *)obj;
        weakSelf.dataSource = [NSMutableArray arrayWithArray:buyEntity.retData];
        
         [_dataDelegate addModels:weakSelf.dataSource];
        
       
        [weakSelf.groupTable reloadData];
        
    } fail:^(id obj) {
        
    } complete:^(id obj) {
        
    }];
    
    
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
