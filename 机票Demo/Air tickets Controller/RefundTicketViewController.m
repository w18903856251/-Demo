//
//  RefundTicketViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/23.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "RefundTicketViewController.h"
#import "RefundTableViewCell.h"

#define kRefundTableViewCellIdentifier @"RefundTableViewCellIdentifier"

@interface RefundTicketViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation RefundTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"申请退票";
    
    self.groupTable.delegate = self;
    self.groupTable.dataSource = self;
   
    
   [self.groupTable registerClass: [RefundTableViewCell class]forCellReuseIdentifier:kRefundTableViewCellIdentifier];

    UIColor * blackColor = [UIColor blackColor];
    UIFont  *font = [UIFont systemFontOfSize:14];
    
    UILabel * citylabel = [AppUtils creatNormalLabel:blackColor align: NSTextAlignmentLeft font:font parent:self.view];
    
    citylabel.text = @"杭州---北京";
    citylabel.frame = CGRectMake(15, 64+10, SCREEN_WIDTH-30, 20);
    
    
    UILabel * labelone = [AppUtils creatNormalLabel:blackColor align: NSTextAlignmentLeft font:font parent:self.view];
    
    labelone.text = @"退票条件";
    labelone.frame = CGRectMake(20, citylabel.bottom+5, SCREEN_WIDTH-30, 20);
    
    UILabel * marklabel = [AppUtils creatNormalLabel:blackColor align: NSTextAlignmentLeft font:font parent:self.view];
    
    marklabel.text = @"";
    marklabel.backgroundColor = [UIColor orangeColor];
    marklabel.frame = CGRectMake(20, labelone.bottom+5, 30, 45);
    
    
    UILabel * labeltwo = [AppUtils creatNormalLabel:blackColor align: NSTextAlignmentLeft font:font parent:self.view];
    
    labeltwo.text = @"起飞前2小时外  免费";
    
    labeltwo.frame = CGRectMake(marklabel.right+5, labelone.bottom+5, SCREEN_WIDTH-30-marklabel.width-5, 20);
    
    
    UILabel * labelthree = [AppUtils creatNormalLabel:blackColor align: NSTextAlignmentLeft font:font parent:self.view];
    
    labelthree.text = @"起飞前2小时内  ￥1190";
    
    labelthree.frame = CGRectMake(marklabel.right+5, labeltwo.bottom+5, SCREEN_WIDTH-30-marklabel.width-5, 20);
    
    
     self.groupTable.frame = CGRectMake(0,labelthree.bottom+5, SCREEN_WIDTH, 104);
    
    UIButton * buttons =  [AppUtils createButton:@"提交申请" titleColor:[UIColor blackColor] img:nil bg:nil parent:self.view];
    
    
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(SCREEN_WIDTH-30);
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(-0);
        
    }];

    
    //buttons.frame = CGRectMake(15, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    [buttons addTarget:self action:@selector(Chick) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}

-(void)Chick{
    
    debugLog(@"提交申请");
    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
        RefundTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:kRefundTableViewCellIdentifier  forIndexPath:indexPath];
      [cell configureDatas];
    
    cell.btnClickBlock = ^(id cell, NSUInteger index){
        
        index = indexPath.row;
        [self Selectchick:cell index:indexPath.row];
        
        
        
    };
    
    
    
//        
//        cell.btnClickBlock = ^(id cell, NSUInteger index){
//            
//            
//            
//            debugLog(@"index==%ld",index);
//            //index = indexPath.row;
//            [self Selectchick:cell index:index];
    
            
            
       
        
        return cell;
}


-(void)Selectchick:(id)cell index:(NSUInteger)btnIndex{
    
    RefundTableViewCell *normalCell = (RefundTableViewCell *)cell;
    
    if (normalCell.Selectbutton.tag==0) {
        normalCell.Selectbutton.tag = 1;
        [normalCell.Selectbutton setImage:[UIImage imageNamed:@"checkboxons"] forState:UIControlStateNormal];
    }else if (normalCell.Selectbutton.tag==1){
        normalCell.Selectbutton.tag=0;
        [normalCell.Selectbutton setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
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
