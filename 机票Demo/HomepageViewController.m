//
//  HomepageViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/10.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "HomepageViewController.h"
#import "Masonry.h"

#import "SearchTicketViewController.h"


@interface HomepageViewController ()

@property (nonatomic,strong) UIImageView *   imageview; // 机票点击视图
@property (nonatomic)        UILabel     *   titlelabel;

@end

@implementation HomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
    

    
    // Do any additional setup after loading the view.
}

-(void)event:(UITapGestureRecognizer *)sender{
    
    
    SearchTicketViewController * searchticker = [[SearchTicketViewController alloc]init];
    
    [self pushViewController:searchticker];
    
    
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
