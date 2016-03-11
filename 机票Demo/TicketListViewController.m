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

#define kListCellIdentifier            @"ListCellIdentifier"
@interface TicketListViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
{
    
    
    ModalAnimation *_modalAnimationController;
    AirlineseatViewController *airlineseat;
    ScaleAnimation *_scaleAnimationController;
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
    _scaleAnimationController = [[ScaleAnimation alloc] initWithNavigationController:self.navigationController];
    [self requestTicketlistDatas];
    
    self.navigationController.delegate =self;
    self.groupTable.delegate = self;
    //self.groupTable.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    [self.groupTable registerClass:[ListTableViewCell class] forCellReuseIdentifier:kListCellIdentifier];
    
    
    
    _dataDelegate = [[BaseGroupTableViewController alloc] initWithIdentifier:kListCellIdentifier configureBlock:^(ListTableViewCell* cell, id model, NSIndexPath *indexPath) {
        
        [cell updateCarContent:model];
        
        
    }];
    
    self.groupTable.dataSource = _dataDelegate;
    
    __weak __typeof(self) weakSelf = self;
    self.groupTable.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
   
    
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
    
    
   
    
    airlineseat = [[AirlineseatViewController alloc]init];
    
    airlineseat.obj = _dataDelegate.dataSource[indexPath.row];
    
   _scaleAnimationController.viewForInteraction = airlineseat.view;
    
    //[self.navigationController pushViewController:airlineseat animated:YES];
    
    debugLog(@"数据===%ld",indexPath.row);
    [self pushViewController:airlineseat];
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGRect frame = cell.frame;
    frame.origin.y -= 100;
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        cell.frame = frame;
    } completion:nil];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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


#pragma mark - Navigation Controller Delegate

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    
    
    BaseAnimation *animationController;
   
       animationController = _scaleAnimationController;
    
//    else if ([[[NSUserDefaults standardUserDefaults] stringForKey:USER_DEFAULTS_NAVIGATION_TRANSITION] isEqualToString:USER_DEFAULTS_NAVIGATION_TRANSITION_FLIP]) {
//        animationController = _shuffleAnimationController;
//    } else if ([[[NSUserDefaults standardUserDefaults] stringForKey:USER_DEFAULTS_NAVIGATION_TRANSITION] isEqualToString:USER_DEFAULTS_NAVIGATION_TRANSITION_SCALE]) {
//        animationController = _scaleAnimationController;
//    }
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
