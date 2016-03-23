//
//  ReservationforcustomerinfoViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/9.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "ReservationforcustomerinfoViewController.h"
#import "ReservationforcustomerinfoHeadView.h"
#import "PayMoneyViewController.h"

#import "UserBookingTableViewCell.h"
#define kUserBookingTableViewCellIdentifier     @"UserBookingTableViewCellIdentifier"

#define  kNewCustomerSectionHeaderIdentifier @"NewCustomerSectionHeaderIdentifier"

#define kUserInsuranceTableViewCellIdentifier @"UserInsuranceTableViewCellIdentifier"
#define kUserReimbursementTableViewCellIdentifier @"UserReimbursementTableViewCellIdentifier"
#define kUserPayMoneyTableViewCellIdentifier @"UserPayMoneyTableViewCellIdentifier"

#import "HXNewCustomerSectionHeader.h"
@interface ReservationforcustomerinfoViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic,strong) UITableView  *UserTableview;

@property (nonatomic,strong)  NSMutableArray           *sectionTitles;
@property (nonatomic,strong)  NSMutableArray           *dataSource;

@property (strong, nonatomic)  BaseGroupTableViewController *dataDelegate;
@end

@implementation ReservationforcustomerinfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    self.groupTable.delegate = self;
    self.groupTable.dataSource =self;
    self.groupTable.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    [self.groupTable registerClass:[UserBookingTableViewCell class] forCellReuseIdentifier:kUserBookingTableViewCellIdentifier];
    [self.groupTable registerClass:[HXNewCustomerSectionHeader class] forHeaderFooterViewReuseIdentifier:kNewCustomerSectionHeaderIdentifier];
    [self.groupTable registerClass:[UserInsuranceTableViewCell class] forCellReuseIdentifier:kUserInsuranceTableViewCellIdentifier];
     [self.groupTable registerClass:[UserReimbursementTableViewCell class] forCellReuseIdentifier:kUserReimbursementTableViewCellIdentifier];
    
    [self.groupTable registerClass:[UserPayMoneyTableViewCell class] forCellReuseIdentifier:kUserPayMoneyTableViewCellIdentifier];
    

    
    //*
//    TicketseatHeadView  *SeatHeader = [[TicketseatHeadView alloc] initWithFrame:CGRectMake(0.f,0.f,self.view.width,[TicketseatHeadView calculateCellHeight])];
//    self.groupTable.tableHeaderView = SeatHeader;
    
    //*
    ReservationforcustomerinfoHeadView  *customerHeader = [[ReservationforcustomerinfoHeadView alloc] initWithFrame:CGRectMake(0.f,0.f,self.view.width,[ReservationforcustomerinfoHeadView calculateCellHeight])];
    
    self.groupTable.tableHeaderView = customerHeader;
    
    
    UIView * aview = [[UIView alloc] initWithFrame:CGRectMake(10.f,10.f,self.view.width-10*2,[ReservationforcustomerinfoHeadView calculateCellHeight]-20)];
    //添加边框
    CALayer * layer = [aview layer];
    layer.borderColor = [
                         [UIColor blackColor] CGColor];
    layer.borderWidth = 1.0f;
    
    [customerHeader configureHeaderData:_objData configureshippingspaceHeadData:_spaceobjData];
    
    [customerHeader addSubview:aview];

    
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
            @[@{@"cellType":@"0",@"eventType":@"input",@"info":@[@"姓名",@"与乘机证件一致"],@"keyboard":@"default",@"limit":@"0",@"inputKey":@"name"},@{@"cellType":@"0",@"eventType":@"Document",@"info":@[@"证件类型",@"身份证"],@"limit":@"0",@"DocumentKey":@"Document"},@{@"cellType":@"0",@"eventType":@"input",@"info":@[@"证件号码",@"与乘机证件一致"],@"keyboard":@"default",@"limit":@"0",@"inputKey":@"certificatenum"},];
        
       // [_dataDelegate addModels:customerInfo];
        
        [self.dataSource addObject:customerInfo];
        [self.sectionTitles addObject:@[@"乘机人"]];
        
        
        NSArray  *TelephonecustomerInfo;
        
        // 配置  联系人
        TelephonecustomerInfo  =
        @[@{@"cellType":@"0",@"eventType":@"input",@"info":@[@"姓名",@"请填写联系人姓名"],@"keyboard":@"default",@"limit":@"0",@"inputKey":@"name"},@{@"cellType":@"0",@"eventType":@"input",@"info":@[@"手机",@"请填写联系人手机"],@"keyboard":@"default",@"limit":@"0",@"inputKey":@"telephone"}];
        
        [self.dataSource addObject:TelephonecustomerInfo];
        [self.sectionTitles addObject:@[@"联系人"]];
        
        
        NSArray  *InsuranceInfo;
        
        // 配置  保险
        InsuranceInfo  =
        @[@{@"cellType":@"1",@"eventType":@"input",@"info":@[@"航空意外险",@"最高保额￥320万,放心出行",@"￥20/份"]},@{@"cellType":@"1",@"eventType":@"input",@"info":@[@"航空延误险",@"最高保额￥320万,放心出行",@"￥20/份"]}];
        
        [self.dataSource addObject:InsuranceInfo];
        [self.sectionTitles addObject:@[@"航空保险"]];
        
        
        NSArray  *ReimbursementInfo;
        
        // 配置 报销凭证
        ReimbursementInfo  =
        @[@{@"cellType":@"2",@"eventType":@"input",@"info":@[@"是否报销凭证",@"123"]}];
        
        [self.dataSource addObject:ReimbursementInfo];
        [self.sectionTitles addObject:@[@"报销凭证"]];
        
        NSArray  *PayMoney;
        
        PayMoney  =
        @[@{@"cellType":@"3",@"eventType":@"input",@"info":@[@"成人票:￥1150X1",@"机建+燃油:50X1",@"保险: (￥20 + ￥20) X1",@"1240"]}];
        
        [self.dataSource addObject:PayMoney];
        [self.sectionTitles addObject:@[@"须知。。。。"]];
        
        
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
    
    if ([cellInfoDict[@"cellType"] integerValue] == 0) {
        
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
    }else  if ([cellInfoDict[@"cellType"] integerValue] == 1) {
        
        UserInsuranceTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:kUserInsuranceTableViewCellIdentifier  forIndexPath:indexPath];
        
        [cell configureCellContent:cellInfoDict[@"info"]];
        
        cell.btnClickBlock = ^(id cell, NSUInteger index){
            
            index = indexPath.row;
            [self Selectchick:cell index:indexPath.row];
            
            
            
        };
        
        return cell;

       
    }else if([cellInfoDict[@"cellType"] integerValue] == 2) {
        
        UserReimbursementTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:kUserReimbursementTableViewCellIdentifier forIndexPath:indexPath];
        
        [cell configureCellContent: cellInfoDict[@"info"]];
        
        cell.btnClickBlock = ^(id cell, NSUInteger index){
            
            index = indexPath.row;
            [self Selectchick:cell index:indexPath.row];
            
            
            
        };
        return cell;
    }else{
        UserPayMoneyTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:kUserPayMoneyTableViewCellIdentifier forIndexPath:indexPath];
        
        [cell configureCellContent: cellInfoDict[@"info"]];
        
        cell.btnClickBlock = ^(id cell, NSUInteger index){
            
            index = indexPath.row;
            
            [self PayMoneyVC];
            
            
        };
        return cell;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (indexPath.section==2) {
        return 64;
    }else if (indexPath.section==4){
        return 144;
    }
    else{
        
        return 44;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary  *cellInfoDict = self.dataSource[indexPath.section][indexPath.row];
    if ([cellInfoDict[@"eventType"] isEqualToString:@"input"]) {
        //单行输入 只在当前页面 输入
        //        [self navToInputControll:cell infoDict:cellInfoDict];
    }else if ([cellInfoDict[@"eventType"] isEqualToString:@"Document"]){
        debugLog(@"选择");
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if ([self.sectionTitles[section] count]!=0) {
                HXNewCustomerSectionHeader  *sectionHeader = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kNewCustomerSectionHeaderIdentifier];;
        [sectionHeader configureHeaderData:_sectionTitles[section]];
        return sectionHeader;
    }else return nil;
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


//  点击选中

-(void)Selectchick:(id)cell index:(NSUInteger)btnIndex{

     UserInsuranceTableViewCell *normalCell = (UserInsuranceTableViewCell *)cell;
    
    if (normalCell.Insurancebutton.tag==0) {
        normalCell.Insurancebutton.tag = 1;
        [normalCell.Insurancebutton setImage:[UIImage imageNamed:@"checkboxons"] forState:UIControlStateNormal];
    }else if (normalCell.Insurancebutton.tag==1){
        normalCell.Insurancebutton.tag=0;
        [normalCell.Insurancebutton setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
    }
    
    

}


//跳转支付页面

-(void) PayMoneyVC{
    
    PayMoneyViewController * paymoney = [[PayMoneyViewController alloc]init];
    paymoney.obj = _objData;
    [self pushViewController:paymoney];
    
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
