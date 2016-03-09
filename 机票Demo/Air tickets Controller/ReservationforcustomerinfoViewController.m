//
//  ReservationforcustomerinfoViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/9.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "ReservationforcustomerinfoViewController.h"
#import "ReservationforcustomerinfoHeadView.h"


#import "ListTableViewCell.h"
#define kTicketCellIdentifier      @"TicketCellIdentifier"

@interface ReservationforcustomerinfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView  *UserTableview;
@end

@implementation ReservationforcustomerinfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.UserTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, SCREEN_HEIGHT-64)];
    self.UserTableview.tag =1;
    [self.UserTableview registerClass:[TicketseatCell class] forCellReuseIdentifier:kTicketCellIdentifier];
    
    
    
    [UIView animateWithDuration:.25f delay:.1f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.UserTableview.frame = CGRectMake(0, 0, self.view.frame.size.width, SCREEN_HEIGHT-64);
        
    } completion:^(BOOL finished) {
        
        //        [_nameTf becomeFirstResponder];
    }];
    
    //*
    ReservationforcustomerinfoHeadView  *customerHeader = [[ReservationforcustomerinfoHeadView alloc] initWithFrame:CGRectMake(0.f,0.f,self.view.width,[ReservationforcustomerinfoHeadView calculateCellHeight])];
    customerHeader.backgroundColor =[UIColor grayColor];
    self.UserTableview.tableHeaderView = customerHeader;
    
    [customerHeader configureHeaderData:_objData configureshippingspaceHeadData:_spaceobjData];
   
    self.UserTableview.tableFooterView = [[UIView alloc]init];
    self.UserTableview.dataSource =self;
    self.UserTableview.delegate = self;
    [self.view addSubview:self.UserTableview];

    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    
    return 4;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    TicketseatCell *cell =  [tableView dequeueReusableCellWithIdentifier:kTicketCellIdentifier forIndexPath:indexPath];
    
//    __weak AirlineseatViewController   *sellCtrl = self;
//    cell.btnClickBlock = ^(id cell,NSUInteger index) {
//        [sellCtrl handleCellClickedEvent:cell index:index];
//    };
//    
//    [cell updateCarContent:self.dataSource[indexPath.section]];
    
    
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 80;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
    
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
