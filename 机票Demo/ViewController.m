//
//  ViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

#import "SearchTicketViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UIImageView *   imageview; // 机票点击视图
@property (nonatomic)        UILabel     *   titlelabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(50, 200, 80, 80)];
    self.titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 60, 40)];
    self.titlelabel.text  = @"机票列表";
    self.titlelabel.textAlignment = NSTextAlignmentCenter;
    self.titlelabel.font = [UIFont systemFontOfSize:12];
    [self.imageview addSubview:self.titlelabel];
    self.imageview.backgroundColor = [UIColor yellowColor];
    
    UITapGestureRecognizer * tapWLBLs = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(event:)];
    //[tapWLBLs setNumberOfTouchesRequired:3];
    
    //设置与用户交互
    [self.imageview addGestureRecognizer:tapWLBLs];
    
    [self.imageview setUserInteractionEnabled:YES];
    
    [self.view addSubview:self.imageview];
    
    
    
    
    
}
-(void)event:(UITapGestureRecognizer *)sender{
    

    SearchTicketViewController * searchticker = [[SearchTicketViewController alloc]init];
    
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchticker];
//    
//    [self presentViewController:nav animated:YES completion:^{
//        
//    }];
//
    [self.navigationController pushViewController:searchticker animated:YES];
    
}


@end
