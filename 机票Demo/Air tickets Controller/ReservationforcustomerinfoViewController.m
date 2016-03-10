//
//  ReservationforcustomerinfoViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/9.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "ReservationforcustomerinfoViewController.h"
#import "ReservationforcustomerinfoHeadView.h"


#import "UserBookingTableViewCell.h"
#define kUserBookingTableViewCellIdentifier     @"UserBookingTableViewCellIdentifier"

@interface ReservationforcustomerinfoViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic,strong) UITableView  *UserTableview;

@property (nonatomic,strong)  NSMutableArray           *sectionTitles;
@property (nonatomic,strong)  NSMutableArray           *dataSource;
@end

@implementation ReservationforcustomerinfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.UserTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, SCREEN_HEIGHT-64)];
    self.UserTableview.tag =1;
    [self.UserTableview registerClass:[UserBookingTableViewCell class] forCellReuseIdentifier:kUserBookingTableViewCellIdentifier];
    
    
    
//    [UIView animateWithDuration:.25f delay:.1f options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.UserTableview.frame = CGRectMake(0, 0, self.view.frame.size.width, SCREEN_HEIGHT-64);
//        
//    } completion:^(BOOL finished) {
//        
//        //        [_nameTf becomeFirstResponder];
//    }];
    
    //*
    ReservationforcustomerinfoHeadView  *customerHeader = [[ReservationforcustomerinfoHeadView alloc] initWithFrame:CGRectMake(0.f,0.f,self.view.width,[ReservationforcustomerinfoHeadView calculateCellHeight])];
    customerHeader.backgroundColor =[UIColor grayColor];
    self.UserTableview.tableHeaderView = customerHeader;
    
    [customerHeader configureHeaderData:_objData configureshippingspaceHeadData:_spaceobjData];
   
    self.UserTableview.tableFooterView = [[UIView alloc]init];
    self.UserTableview.dataSource =self;
    self.UserTableview.delegate = self;
    [self.view addSubview:self.UserTableview];
    
    [self configureDataSource];

    
}


#pragma mark -  配置基本数据
- (void)configureDataSource
{
    @autoreleasepool {
        self.dataSource = [NSMutableArray arrayWithCapacity:0];
        self.sectionTitles = [NSMutableArray arrayWithCapacity:0];
        NSArray  *customerInfo;
       
                       // 配置  添加客户
            customerInfo  =
            @[@{@"cellType":@"0",@"eventType":@"input",@"info":@[@"姓名",@"与乘机证件一致"],@"keyboard":@"default",@"limit":@"0",@"inputKey":@"name"},@{@"cellType":@"0",@"eventType":@"Document",@"info":@[@"证件类型",@"身份证"],@"limit":@"0",@"DocumentKey":@"Document"},@{@"cellType":@"0",@"eventType":@"input",@"info":@[@"证件号码",@"与乘机证件一致"],@"keyboard":@"default",@"limit":@"0",@"inputKey":@"name"},];
        
        
        
        [self.dataSource addObject:customerInfo];
        [self.sectionTitles addObject:@[@"客户信息"]];
        
        
//        NSArray * customerInfos = @[
//                                    @{@"cellType":@"6",@"eventType":@"input",@"info":@[@"联系人",@"联系人姓名"],@"keyboard":@"default",@"limit":@"0",@"inputKey":@"name"},
//                                    @{@"cellType":@"0",@"eventType":@"input",@"info":@[@"联系电话",@"请输入联系号码"],@"keyboard":@"phone",@"limit":@"0",@"inputKey":@"phone"},
//                                    @{@"cellType":@"0",@"eventType":@"input",@"info":@[@"微信号",@"请输入微信号码"],@"keyboard":@"default",@"limit":@"0",@"inputKey":@"weixin"},
//                                    @{@"cellType":@"0",@"eventType":@"city",@"info":@[@"销售归属",@"归属人名称"],@"limit":@"0",@"cityKey":@"city"}];
//        
//        [self.dataSource addObject:customerInfos];
//        [self.sectionTitles addObject:@[@"123"]];
        
    }
}




#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    
    return [self.dataSource count];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataSource[section] count];

    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSDictionary  *cellInfoDict = self.dataSource[indexPath.section][indexPath.row];
    
    __weak   ReservationforcustomerinfoViewController  *ctrl = self;
    NSString  *key = nil; //values 中键的名称
    
    UserBookingTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:kUserBookingTableViewCellIdentifier forIndexPath:indexPath];
    
    
     [cell configureCellContent:cellInfoDict[@"info"]];
    
    
    //输入框 状态
    if ([cellInfoDict[@"eventType"] isEqualToString:@"input"]) {
        cell.contentTextField.userInteractionEnabled = YES;
        cell.contentTextField.delegate = self;
        
        [self  resetKeyBoardType:cell.contentTextField type:cellInfoDict[@"keyboard"]];
    }
    
//    __weak AirlineseatViewController   *sellCtrl = self;
//    cell.btnClickBlock = ^(id cell,NSUInteger index) {
//        [sellCtrl handleCellClickedEvent:cell index:index];
//    };
//    
//    [cell updateCarContent:self.dataSource[indexPath.section]];
    
    
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 44;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary  *cellInfoDict = self.dataSource[indexPath.section][indexPath.row];
    if ([cellInfoDict[@"eventType"] isEqualToString:@"input"]) {
//        if ([cellInfoDict[@"cellType"] integerValue]==5 && [[_interacts valueForKey:cellInfoDict[@"inputKey"]] boolValue]== YES){
//            return;
//        }
        //单行输入 只在当前页面 输入
        //        [self navToInputControll:cell infoDict:cellInfoDict];
    }
    
}


#pragma mark - 键盘类型  default phone number decimal  ascii
- (void)resetKeyBoardType:(UITextField *)textfield type:(NSString *)boardType {
    
    if ([boardType isEqualToString:@"default"]) {
        textfield.keyboardType =  UIKeyboardTypeDefault;
    }else if ([boardType isEqualToString:@"phone"]) {
        textfield.keyboardType =  UIKeyboardTypeNumberPad;
    }else if ([boardType isEqualToString:@"number"]) {
        textfield.keyboardType =  UIKeyboardTypeNumberPad;
    }else if ([boardType isEqualToString:@"decimal"]) {
        textfield.keyboardType =  UIKeyboardTypeDecimalPad;
    }else {
        textfield.keyboardType =  UIKeyboardTypeASCIICapable;
    }
}



#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //    if (_intentionTradeWay==HXIntentionTradeWayBuy) {
    //        debugLog(@"height = %lf",keyboardHeight);
    //        self.cameraTable.contentInset = UIEdgeInsetsMake(keyboardHeight-NORMALCELLHEIGHT,0.f,NORMALCELLHEIGHT,0.f);
    //    }else {
    //        self.cameraTable.contentInset = UIEdgeInsetsMake(keyboardHeight-NORMALCELLHEIGHT+self.unitView.height,0.f,NORMALCELLHEIGHT,0.f);
    //    }
    
    NSIndexPath  *indexPath =  [self tableViewCellIndexPathForTextField:textField];
    [self tableViewScrollCurrentIndexPath:indexPath];
    return YES;
}



#pragma mark - 滚动到 文本输入区
- (NSIndexPath*)tableViewCellIndexPathForTextField:(UITextField *)textField {
    UserBookingTableViewCell  *cell;
//    if (IS_OS_8_OR_LATER) {
//        cell = (NormalCarCell *)textField.superview.superview;
//    }else {
        cell = (UserBookingTableViewCell *)textField.superview.superview.superview;
    //}
    
    NSIndexPath  *indexPath = [self.UserTableview indexPathForCell:cell];
    return indexPath;
}

-(void)tableViewScrollCurrentIndexPath:(NSIndexPath *)indexPath
{
    [self.UserTableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
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
