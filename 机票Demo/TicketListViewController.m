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
#import <MJRefresh.h>
#import "ModalAnimation.h"
#import "ScaleAnimation.h"
#import "Conversionofweek.h"
#define kListCellIdentifier            @"ListCellIdentifier"
@interface TicketListViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
{
    
    
    ModalAnimation *_modalAnimationController;
    AirlineseatViewController *airlineseat;
    ScaleAnimation *_scaleAnimationController;
    
    UILabel * Alabel;
    
    NSString * DefaultDate;
}

//@property (nonatomic,strong) PDTransitionAnimator *minToMaxAnimator;
@property (strong, nonatomic)  BaseGroupTableViewController *dataDelegate;

@end

@implementation TicketListViewController


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _scaleAnimationController.viewForInteraction = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.navigationItem.title = @"上海 - 天津";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView * backview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
    
    backview.backgroundColor =[UIColor colorWithHexString:HOMEPAGECOLOR_BOSS];
    [self.view addSubview:backview];
    
    UIButton * AButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, (SCREEN_WIDTH-30)/3, 20)];
    [AButton setTitle:@"< 前一天" forState:UIControlStateNormal];
    [AButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [AButton addTarget:self action:@selector(BeforeChick:) forControlEvents:UIControlEventTouchUpInside];
    [backview addSubview:AButton];
    
     Alabel = [[UILabel alloc]initWithFrame:CGRectMake(AButton.right, 10, (SCREEN_WIDTH-30)/3, 20)];
    Alabel.font =[UIFont systemFontOfSize:12];
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY.MM.dd"];
    DefaultDate = [dateFormatter stringFromDate:currentDate];
    
    NSString * date= [Conversionofweek weekdayStringFromDate:currentDate];
    
    //Alabel.text = DefaultDate;
    Alabel.text = [NSString stringWithFormat:@"%@  %@",
                   DefaultDate,date];
    
    //[Alabel setTitle:[NSString stringWithFormat:@"%@  %@",dateString,date]  forState: UIControlStateNormal];
    
   // Alabel.backgroundColor = [UIColor blackColor];
    
    [backview addSubview:Alabel];
    
    UIButton * BButton = [[UIButton alloc]initWithFrame:CGRectMake(Alabel.right, 10, (SCREEN_WIDTH-30)/3, 20)];
    [BButton setTitle:@"后一天 >" forState:UIControlStateNormal];
    [BButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [BButton addTarget:self action:@selector(AfterChick:) forControlEvents:UIControlEventTouchUpInside];
    [backview addSubview:BButton];
    
    UILabel  *label = [[UILabel alloc]initWithFrame:CGRectMake(0, backview.bottom-1, SCREEN_WIDTH, 1)];
    label.backgroundColor =[UIColor grayColor];
    
    [self.view addSubview:label];
    
    _scaleAnimationController = [[ScaleAnimation alloc] initWithNavigationController:self.navigationController];
    [self requestTicketlistDatas];
    
    self.navigationController.delegate =self;
    self.groupTable.delegate = self;
    
    self.groupTable.frame = CGRectMake(15, 45, SCREEN_WIDTH-30, SCREEN_HEIGHT-64);
    [self.groupTable registerClass:[ListTableViewCell class] forCellReuseIdentifier:kListCellIdentifier];
    
   
    //[_dataDelegate addModels:b];
    
    _dataDelegate = [[BaseGroupTableViewController alloc] initWithIdentifier:kListCellIdentifier configureBlock:^(ListTableViewCell* cell, id model, NSIndexPath *indexPath) {
        
        
        [cell updateCarContent:model];
        
        
    }];
    
    self.groupTable.dataSource = _dataDelegate;
    
    __weak __typeof(self) weakSelf = self;
    self.groupTable.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
   
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
   
    
    airlineseat = [[AirlineseatViewController alloc]init];
    
    airlineseat.obj = _dataDelegate.dataSource[indexPath.row];
    
    
    //  自定义转场动画效果
    
   _scaleAnimationController.viewForInteraction = airlineseat.view;
    
    [self pushViewController:airlineseat];
    
    
}

//  自定义cell动画效果
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGRect frame = cell.frame;
    frame.origin.y -= 100;
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        cell.frame = frame;
    } completion:nil];
}

//前一天
-(void)BeforeChick:(UIButton*)sender{
    
    //sender.tag++;
    NSInteger  index = sender.tag;
    
    debugLog(@"labee = %ld",sender.tag);
    NSString * dateString =   [Alabel.text substringToIndex:10];//截取掉下标7之后的字符串 Alabel.text;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
        [formatter setDateFormat:@"yyyy-MM-dd"];
    
        NSDate *date = [formatter dateFromString:dateString];
    
        NSDate *yesterday = [NSDate dateWithTimeInterval:-60  * 60 * 24 sinceDate:date];
    
       //NSDate *tomorrow = [NSDate dateWithTimeInterval:60 * index* 60 * 24 sinceDate:date];
    
    NSString * dates= [Conversionofweek weekdayStringFromDate:yesterday];
    
    Alabel.text = [NSString stringWithFormat:@"%@  %@",
                   [formatter stringFromDate:yesterday],dates];
    
    NSLog(@"yesterday %@    ",Alabel.text);
}

//前一天
-(void)AfterChick:(UIButton*)sender{
    
    
    NSInteger  index = sender.tag;
    
    debugLog(@"labee = %ld",index);
    NSString * dateString =   [Alabel.text substringToIndex:10];//截取掉下标7之后的字符串 Alabel.text;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [formatter dateFromString:dateString];
    
    
    NSDate *tomorrow = [NSDate dateWithTimeInterval:60 *  60 * 24 sinceDate:date];
    
    NSString * dates= [Conversionofweek weekdayStringFromDate:tomorrow];
    
    Alabel.text = [NSString stringWithFormat:@"%@  %@",
                   [formatter stringFromDate:tomorrow],dates];
    
    NSLog(@"yesterday %@    ",Alabel.text);
}



#pragma mark - /***     网络请求     ****/
- (void)requestTicketlistDatas
{
     __weak __typeof(self) weakSelf = self;
     NSMutableDictionary   *Ticketlist;
    Ticketlist  = [NSMutableDictionary dictionaryWithCapacity:0];
    
    [Publicrequest requestTicketlistWithParameters:Ticketlist success:^(id obj) {
        
       
        TicketListEntity  *buyEntity = (TicketListEntity *)obj;
        //weakSelf.dataSource = [NSMutableArray arrayWithArray:buyEntity.retData];
        
         [_dataDelegate addModels:buyEntity.retData];
        
        debugLog(@"model==%@",_dataDelegate.dataSource);
       //[weakSelf.dataSource addObject:buyEntity.retData];
        [weakSelf.groupTable reloadData];
        
    } fail:^(id obj) {
        
    } complete:^(id obj) {
        
    }];
    
    
}

#pragma mark -    处理刷新数据
- (void)loadNewData {
    
    self.currentPage = 1;
    self.isTableRefreshing = YES;
     __weak __typeof(self) weakSelf = self;
    NSMutableDictionary   *stockCar  = [NSMutableDictionary dictionaryWithCapacity:0];
    //[stockCar setObject:@(self.currentPage) forKey:@"currPage"];
    
    
    [Publicrequest requestTicketlistWithParameters:stockCar success:^(id obj) {
        
        weakSelf.isTableRefreshing = NO;
        TicketListEntity  *buyEntity = (TicketListEntity *)obj;
        //weakSelf.dataSource = [NSMutableArray arrayWithArray:buyEntity.retData];
        
        //[_dataDelegate addModels:weakSelf.dataSource];
        
        weakSelf.groupTable.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakSelf loadMoreData];
        }];
        [weakSelf.groupTable.header endRefreshing];
        [weakSelf.groupTable reloadData];
        
    } fail:^(id obj) {
        
    } complete:^(id obj) {
        
    }];



}
     
- (void)loadMoreData {
         
         self.currentPage = 1;
         self.isTableRefreshing = YES;
         __weak __typeof(self) weakSelf = self;
         NSMutableDictionary   *stockCar  = [NSMutableDictionary dictionaryWithCapacity:0];
         //[stockCar setObject:@(self.currentPage) forKey:@"currPage"];
         
         
         [Publicrequest requestTicketlistWithParameters:stockCar success:^(id obj) {
             
             weakSelf.isTableRefreshing = NO;
             TicketListEntity  *buyEntity = (TicketListEntity *)obj;
            // weakSelf.dataSource = [NSMutableArray arrayWithArray:buyEntity.retData];
             
             [_dataDelegate addModels:buyEntity.retData];
             
             [weakSelf.dataSource addObject:buyEntity.retData];
             [weakSelf.groupTable reloadData];
             [weakSelf.groupTable.footer endRefreshing];
             
                                           
            } fail:^(id obj) {
                                               
            } complete:^(id obj) {
                                               
            }];
             
             
             
         }


-(id)
animationControllerForPresentedController:(UIViewController
                                           *)presented presentingController:(UIViewController
                                                                             *)presenting sourceController:(UIViewController *)source {
    _modalAnimationController.type = AnimationTypePresent;
    return _modalAnimationController;
}
-(id)
animationControllerForDismissedController:(UIViewController
                                           *)dismissed { 
    _modalAnimationController.type = AnimationTypeDismiss;
    return _modalAnimationController;
}

//  自定义动画效果
#pragma mark - Navigation Controller Delegate

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    
    
    BaseAnimation *animationController;
   
       animationController = _scaleAnimationController;
    

    switch (operation) {
        case UINavigationControllerOperationPush:
            animationController.type = AnimationTypePresent;
            return  animationController;
        case UINavigationControllerOperationPop:
            animationController.type = AnimationTypeDismiss;
            return animationController;
        default: return nil;
    }
    
}


-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if ([animationController isKindOfClass:[ScaleAnimation class]]) {
        ScaleAnimation *controller = (ScaleAnimation *)animationController;
        if (controller.isInteractive) return controller;
        else return nil;
    } else return nil;
}

@end
