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
    
    
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(LEFTMARGIN, IOS_STATUSBAR_HEIGHT *2+IOS_NAVBAR_HEIGHT , (SCREEN_WIDTH-15*2)/4, (SCREEN_WIDTH-15*2)/4)];
    
    UIColor * blackColor = [UIColor blackColor];
    UIFont  *font = [UIFont systemFontOfSize:14];
    
    self.titlelabel =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.imageview];
    self.titlelabel.frame = CGRectMake(0, 0, self.imageview.width, self.imageview.height);

    self.titlelabel.text  = @"机票列表";
    self.imageview.backgroundColor = [UIColor colorWithHexString:HOMEPAGECOLOR_BOSS];
    
    UITapGestureRecognizer * tapWLBLs = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(event:)];
    //[tapWLBLs setNumberOfTouchesRequired:3];
    
    //设置与用户交互
    [self.imageview addGestureRecognizer:tapWLBLs];
    
    [self.imageview setUserInteractionEnabled:YES];
    
    [self.view addSubview:self.imageview];
    

}

// 点击机票事件
-(void)event:(UITapGestureRecognizer *)sender{
    
    // 跳转机票搜索页面
    
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
