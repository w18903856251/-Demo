//
//  PaySucessViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/22.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "PaySucessViewController.h"
#import "OrderListViewController.h"
@interface PaySucessViewController ()
@property (nonatomic) UILabel  * onelabel;
@property (nonatomic) UILabel  * twolabel;
@property (nonatomic) UIButton *onebutton;
@property (nonatomic) UIButton *twobutton;

@end

@implementation PaySucessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"付款成功";
    
    UIColor * blackColor = [UIColor blackColor];
    UIFont  *font = [UIFont systemFontOfSize:14];
    
    _onelabel = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.view];
    _onelabel.text = @"恭喜下单成功";
    _onelabel.frame = CGRectMake(15, 64+20, SCREEN_WIDTH-30, 40);
    _twolabel = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.view];
    _twolabel.text  = @"祝你出行愉快";
    _twolabel.frame = CGRectMake(15, _onelabel.bottom+20, SCREEN_WIDTH-30, 40);
    _onebutton =  [AppUtils createButton:@"查看订单" titleColor:[UIColor blackColor] img:nil bg:nil parent:self.view];
    _onebutton.tag = 0;
    _onebutton.frame = CGRectMake(15, _twolabel.bottom+10, SCREEN_WIDTH-30, 40);
    [_onebutton addTarget:self action:@selector(ShowTheorder:) forControlEvents:UIControlEventTouchUpInside];
    _onebutton.layer.borderColor = [[UIColor grayColor] CGColor];
    
    _onebutton.layer.borderWidth = 1.0f;
    
    _onebutton.layer.cornerRadius = 10.0f;
    _twobutton =  [AppUtils createButton:@"返回首页" titleColor:[UIColor blackColor] img:nil bg:nil parent:self.view];
    _twobutton.tag =1;
    _twobutton.frame = CGRectMake(15, _onebutton.bottom+10, SCREEN_WIDTH-30, 40);
    
    [_twobutton addTarget:self action:@selector(ShowTheorder:) forControlEvents:UIControlEventTouchUpInside];
    _twobutton.layer.borderColor = [[UIColor grayColor] CGColor];
    
    _twobutton.layer.borderWidth = 1.0f;
    
    _twobutton.layer.cornerRadius = 10.0f;
    
    
    
}
-(void)ShowTheorder:(UIButton*)button{
    
    if (button.tag==0) {
        
        OrderListViewController * orderlist = [[OrderListViewController alloc]init];
        
        [self pushViewController:orderlist];
        
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
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
