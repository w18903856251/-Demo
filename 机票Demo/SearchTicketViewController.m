//
//  SearchTicketViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/4.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "SearchTicketViewController.h"
#import "Masonry.h"
#import "HYSegmentedControl.h"
#define  HeadHigh     64.f
#define  Leftdistance     15.f  //  居左距离
#define  Topdistance    25.f  // 居上距离
#import "Conversionofweek.h"
#import "TicketListViewController.h"
#import "CalendarHomeViewController.h"
#import "CalendarViewController.h"
//#import "CalendarDayModel.h"
#import "Color.h"
#import "FlightSearchCell.h"

#define kFlightSearchCellIdentifier   @"FlightSearchCellIdentifier"
#define kFlightSearchDataCellsIdentifier  @"FlightSearchDataCellsIdentifier"

#define kFlightDoubleSearchDataCellsIdentifier  @"FlightDoubleSearchDataCellsIdentifier"
#define kSearchCellIdentifier @"SearchCellIdentifier"

#import "CityViewController.h"

@interface SearchTicketViewController ()<HYSegmentedControlDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)  BaseGroupTableViewController *dataDelegate;

@property (nonatomic) Conversionofweek         *conversionofweek;
@property (nonatomic) UINavigationController   *navController;
@property (nonatomic) UILabel                  *label;
@property (nonatomic) UIView                   *headview;   //表头视图
@property (nonatomic) UIView                   *backview;
@property (nonatomic) UIButton                 *Upbutton;   //收起表头按钮

@property (nonatomic) UILabel                  *headtitlelabel;
@property (nonatomic) UILabel                  *line;
@property (nonatomic) UIImageView              *loginview;  // 登录
@property (nonatomic) UIImageView              *registview; // 注册
@property (nonatomic) UIImageView              *myorder;    // 订单



@property (nonatomic) UIButton                 *originatingcity; //始发城市
@property (nonatomic) UIButton                 *destinationcity; //目的城市
@property (nonatomic) UIButton                 *changebutton;    //交换城市
@property (nonatomic,strong) HYSegmentedControl *segmentedControl;

@property (nonatomic) UIButton                 *Dateoneway;  //单程
@property (nonatomic) UIButton                 *Datebackandforth;  //往返

@property (nonatomic,strong)  CalendarHomeViewController * chvc;

@property (nonatomic) UIButton                 *searchbutton; //搜索按钮




@property (nonatomic)  NSMutableArray   *dataSourceArray;
@property (nonatomic)  UITableView      *backtableview;

@end

@implementation SearchTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"国内/国际机票";
    
    _dataSourceArray = [[NSMutableArray alloc]initWithCapacity:3];
    
    //[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    
//    UIBarButtonItem *leftButton = [[ UIBarButtonItem alloc ] initWithBarButtonSystemItem : UIBarButtonSystemItemAction target : self action : @selector (selectLeftAction:)];
//    
//    leftButton. title = @"123" ;
//    
//    self. navigationItem . leftBarButtonItem = leftButton;
//
//    UIBarButtonItem *rightButton = [[ UIBarButtonItem alloc ] initWithBarButtonSystemItem : UIBarButtonSystemItemAdd   target : self action : @selector (selectRightAction:)];
//    
//    self. navigationItem . rightBarButtonItem = rightButton;
    
    //self.navigationItem.title = @"国内机票";
    // Do any additional setup after loading the view.
    
//    self.backview = [[UIView alloc]initWithFrame:CGRectMake(0, HeadHigh, SCREEN_WIDTH, SCREEN_HEIGHT-HeadHigh)];
//    self.backview.backgroundColor =[UIColor grayColor];
//    [self.view addSubview:self.backview];
    
//    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 1 , self.view.frame.size.width, 30)];
//    self.label.backgroundColor = [UIColor colorWithHexString:@"#FFFFCC"];
//    self.label.text = @"微信订机票，价格更优惠";
//    self.label.textAlignment =  NSTextAlignmentCenter ;
//    [self.backview addSubview:self.label];
//
    
    
    _segmentedControl  = [[HYSegmentedControl alloc] initWithOriginY:64+LEFTMARGIN  Titles:@[@"单程",@"往返"] delegate:self];
    
      _segmentedControl.bottomLineView.frame= CGRectMake(19.0f, 44-2.f, (SCREEN_WIDTH-30-10-4)/2, 2.0f);
    
//    if (_sellIndex!=nil) {
//        _segmentedControl.tableIndex = [_sellIndex intValue];
//        
    
//    [self.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH-40)/2, 40));
//        
//        make.top.equalTo(self.label.mas_bottom).offset(10);
//        
//        make.left.mas_equalTo(15);
//        
//    }];
//    
    
        //_segmentedControl.bottomLineView.frame= CGRectMake(SCREEN_WIDTH/5*_segmentedControl.tableIndex+5.0f, self.label.mas_bottom, SCREEN_WIDTH/5 -10.0f, 2.0f);
        
   // }
    
    [self.view addSubview:_segmentedControl];
    
   
    _backtableview = [[UITableView alloc]initWithFrame:CGRectMake(19, _segmentedControl.bottom+10, _segmentedControl.width+4, 300)];
    _backtableview.delegate =self;
    _backtableview.dataSource = self;
    [self.view addSubview:_backtableview];
//    self.groupTable.frame = CGRectMake(19.f,_segmentedControl.bottom+10,_segmentedControl.width+4,300);
    _backtableview.layer.borderWidth = 1;
   _backtableview.layer.borderColor = [[UIColor grayColor] CGColor];

//    
    //self.groupTable.delegate = self;
    
    
    [_backtableview registerClass:[FlightSearchCell class] forCellReuseIdentifier:kFlightSearchCellIdentifier];
    
    [_backtableview registerClass:[FlightSearchDataCell class] forCellReuseIdentifier:kFlightSearchDataCellsIdentifier];
    
    [_backtableview registerClass:[FlightDoubleSearchDataCell class] forCellReuseIdentifier:kFlightDoubleSearchDataCellsIdentifier];
    
    [_backtableview registerClass:[SearchCell class] forCellReuseIdentifier:kSearchCellIdentifier];
    
    
   

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 60;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row==0) {
        FlightSearchCell *cell  = [tableView dequeueReusableCellWithIdentifier:kFlightSearchCellIdentifier forIndexPath:indexPath];
        
        [cell configureData];
        
        cell.btnClickBlock = ^(id celll,NSUInteger index){
            
            [self CitySelect:cell index:index];
            
        };
        
        return cell;
    }else if (indexPath.row==1){
        
        if (_segmentedControl.tableIndex==0){
        
        FlightSearchDataCell *cell  = [tableView dequeueReusableCellWithIdentifier:kFlightSearchDataCellsIdentifier  forIndexPath:indexPath];
        
        
        [cell configureDatas];
        cell.ReturnData.hidden  = YES;
        
        cell.btnClickBlock = ^(id cell,NSUInteger index){
            
            [self Datechick:cell index:index];
            
        };

            return cell;
        }else{
            FlightDoubleSearchDataCell *cell  = [tableView dequeueReusableCellWithIdentifier:kFlightDoubleSearchDataCellsIdentifier  forIndexPath:indexPath];
            
            
            [cell configureDatas];
            
            
            cell.btnClickBlock = ^(id cell,NSUInteger index){
                
                //if (index==0) {
                    [self Datechick:cell index:index];
//                }else if (index==1){
//                    [self Datechick:cell index:index];
//                }
                
                
            };
            
            return cell;
            
        }
        
    }else{
        
        SearchCell * seachcell = [tableView dequeueReusableCellWithIdentifier:kSearchCellIdentifier  forIndexPath:indexPath];
        [seachcell configureData];
        seachcell.btnClickBlock = ^(id cell,NSUInteger index){
            
           
            [self searchChick:seachcell];
            
            
            
        };
        
        return seachcell;

        
    }
    
    
}

#pragma mark - HYSegmentedControlDelegate method
- (void)hySegmentedControlSelectAtIndex:(NSInteger)index
{
   
    
   
    _segmentedControl.tableIndex = index;
    
    if (index==0) {
        

        [_backtableview reloadData];
        
    }
    else if (index==1) {
        

        [_backtableview reloadData];
    }
    
}




-(void)ChangCityChick:(UIButton*)sender{
    
    sender.tag ++;
    debugLog(@"sender.tag==%ld",sender.tag);
    if (sender.tag%2==1) {
        [self.originatingcity setTitle:@"天津" forState:UIControlStateNormal];
        
        [self.destinationcity setTitle:@"上海" forState:UIControlStateNormal];
    }else if (sender.tag%2==0){
        [self.originatingcity setTitle:@"上海" forState:UIControlStateNormal];
        
        [self.destinationcity setTitle:@"天津" forState:UIControlStateNormal];
    }
    
   
}
// 日期选择

-(void)Datechick:(id)cell index:(NSUInteger)btnIndex{
    
    
    
    if (!_chvc) {
        _chvc = [[CalendarHomeViewController alloc]init];
        
        
        _chvc.calendartitle = @"飞机";
        
        [_chvc setAirPlaneToDay:365 ToDateforString:nil];//飞机初始化方法
        
        
    }
    
    
    
    
    _chvc.calendarblock = ^(CalendarDayModel *model){
        
//        NSLog(@"\n---------------------------");
//        NSLog(@"1星期 %@",[model getWeek]);
//        NSLog(@"2字符串 %@",[model toString]);
//        NSLog(@"3节日  %@",model.holiday);
        

        FlightSearchDataCell *normalCell = (FlightSearchDataCell *)cell;
        if (btnIndex==0) {
            [normalCell.StarData setTitle:[NSString stringWithFormat:@"%@ %@",[model toString],[model getWeek]] forState:UIControlStateNormal];
        }
        
        FlightDoubleSearchDataCell *DoubleCell = (FlightDoubleSearchDataCell *)cell;
        
        if (btnIndex==0) {
            [DoubleCell.StarData setTitle:[NSString stringWithFormat:@"%@ %@",[model toString],[model getWeek]] forState:UIControlStateNormal];
        }else if (btnIndex==1){
             [DoubleCell.ReturnData setTitle:[NSString stringWithFormat:@"%@ %@",[model toString],[model getWeek]] forState:UIControlStateNormal];
            
        }

        
        
    };
    
    [self.navigationController pushViewController:_chvc animated:YES];


}

//城市选择
-(void)CitySelect:(id)cell index:(NSUInteger)btnIndex{
    
    FlightSearchCell * flightsearchcell = (FlightSearchCell*)cell;
   
    
    CityViewController *controller = [[CityViewController alloc] init];
    controller.currentCityString = @"杭州";
    controller.selectString = ^(NSString *string){
        if (btnIndex==0) {
           [flightsearchcell.StarCityButton setTitle:string forState:UIControlStateNormal] ;
        }else if (btnIndex==1){
            [flightsearchcell.ReturnCityButton setTitle:string forState:UIControlStateNormal] ;
        }
        
    };
    [self presentViewController:controller animated:YES completion:nil];
    
}


// 搜索按钮点击事件
-(void)searchChick:(id)cell {
    
   
    
    TicketListViewController * ticketlistvc = [[TicketListViewController alloc]init];
    
    [self pushViewController:ticketlistvc];
    
}

@end
