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
@interface SearchTicketViewController ()<HYSegmentedControlDelegate>

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

@property (nonatomic) UIButton                 *searchbutton; //搜索按钮
@end

@implementation SearchTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navigationItem.title = @"国内机票";
//    UIViewController *rootView = [[ UIViewController alloc ] init ];
//    
//    rootView. title = @"国内机票" ;
//    
//    self . navController = [[ UINavigationController alloc ] init ];
//    
//    [ self . navController pushViewController :rootView animated : YES ];
//    
//    [ self . view addSubview : self . navController . view ];
//    
//    self . navigationController . navigationBarHidden = YES ;
    
    UIBarButtonItem *leftButton = [[ UIBarButtonItem alloc ] initWithBarButtonSystemItem : UIBarButtonSystemItemAction target : self action : @selector (selectLeftAction:)];
    
    leftButton. title = @"123" ;
    
    self. navigationItem . leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[ UIBarButtonItem alloc ] initWithBarButtonSystemItem : UIBarButtonSystemItemAdd   target : self action : @selector (selectRightAction:)];
    
    self. navigationItem . rightBarButtonItem = rightButton;
    
    //self.navigationItem.title = @"国内机票";
    // Do any additional setup after loading the view.
    
    self.backview = [[UIView alloc]initWithFrame:CGRectMake(0, HeadHigh, SCREEN_WIDTH, SCREEN_HEIGHT-HeadHigh)];
    self.backview.backgroundColor =[UIColor grayColor];
    [self.view addSubview:self.backview];
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 1 , self.view.frame.size.width, 30)];
    self.label.backgroundColor = [UIColor colorWithHexString:@"#FFFFCC"];
    self.label.text = @"微信订机票，价格更优惠";
    self.label.textAlignment =  NSTextAlignmentCenter ;
    [self.backview addSubview:self.label];

    
    
    _segmentedControl  = [[HYSegmentedControl alloc] initWithOriginY:30+10 Titles:@[@"单程",@"往返"] delegate:self];
    
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
    
    [self.backview addSubview:_segmentedControl];
    
    
    self.headview = [[UIView alloc]initWithFrame:CGRectMake(0, -100, SCREEN_WIDTH, 0)];
    self.headview.backgroundColor = [UIColor colorWithHexString:@"3366FF" ];
    [self.view addSubview:self.headview];
    
    
    self.Upbutton = [[UIButton alloc]init];
    [self.Upbutton setTitle:@" ^ " forState:UIControlStateNormal];
    [self.Upbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //self.Upbutton.backgroundColor = [UIColor whiteColor];
    [self.Upbutton addTarget:self action:@selector(UPChick:) forControlEvents: UIControlEventTouchUpInside];
    [self.headview addSubview:self.Upbutton];

   
    [self.Upbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
        make.top.mas_equalTo(25);
        
        make.right.mas_equalTo(-20);
    }];
    
    
    
    [self configurationInfo];
    
    
    [ self configurationCityAndDateTime ];
    
}


// 配置动画表头内容

-(void)configurationInfo{
    
    self.headtitlelabel = [[UILabel alloc]initWithFrame:CGRectMake(Leftdistance, Topdistance, 200, 20)];
    self.headtitlelabel.text = @"现在注册即可获取更多优惠";
    self.headtitlelabel.font = [UIFont systemFontOfSize:14];
    self.headtitlelabel.textColor = [UIColor whiteColor];
    [self.headview addSubview:self.headtitlelabel];
    
    self.line = [[UILabel alloc]initWithFrame:CGRectMake(0, Topdistance+20, SCREEN_WIDTH, 1)];
    self.line.backgroundColor =[UIColor whiteColor];
    [self.headview addSubview:self.line];
    
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        
        make.top.mas_equalTo(self.headtitlelabel.mas_bottom);
        
        make.right.mas_equalTo(0);
    }];
    
    self.loginview = [[UIImageView alloc]init];
    self.loginview.backgroundColor = [UIColor whiteColor];
    self.loginview.tag =1;
    UITapGestureRecognizer * taplogin = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(event:)];
    
    [self.loginview addGestureRecognizer:taplogin];
    [self.loginview setUserInteractionEnabled:YES];
    
    [self.headview addSubview:self.loginview];
    
    self.registview = [[UIImageView alloc]init];
    
    self.registview.tag = 2;
    
    UITapGestureRecognizer * tapregist = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(event:)];
    
    [self.registview addGestureRecognizer:tapregist];
    [self.registview setUserInteractionEnabled:YES];
    self.registview.backgroundColor =[UIColor whiteColor];
    [self .headview addSubview:self.registview];
    self.myorder = [[UIImageView alloc]init];
    self.myorder.tag = 3;
    
    UITapGestureRecognizer * taporder = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(event:)];
    
    [self.myorder addGestureRecognizer:taporder];
    [self.myorder setUserInteractionEnabled:YES];
    
    self.myorder.backgroundColor =[UIColor whiteColor];
    [self.headview addSubview:self.myorder];
    
    [self.loginview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3-1, 40));
        
        make.top.equalTo(self.line.mas_bottom).offset(5);
        
        make.left.mas_equalTo(0);
    }];
    
    
    [self.registview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3-1, 40));
        
        make.top.equalTo(self.line.mas_bottom).offset(5);
        
        make.left.equalTo(self.loginview.mas_right).offset(1);
        
    }];
    
    
    [self.myorder mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3-1, 40));
        
        make.top.equalTo(self.line.mas_bottom).offset(5);
        
        make.right.mas_equalTo(0);
        
    }];
    
    
}


//配置view上城市和日期时间选择

-(void)configurationCityAndDateTime{
    
    self.originatingcity  = [[UIButton alloc]init];
    self.originatingcity.backgroundColor = [UIColor whiteColor];
    [self.originatingcity setTitle:@"上海" forState:UIControlStateNormal];
    [self.originatingcity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.backview addSubview:self.originatingcity];
    
    self.changebutton = [[UIButton alloc]init];
    [self.changebutton setTitle:@"<->" forState:UIControlStateNormal];
    self.changebutton.backgroundColor = [UIColor whiteColor];
    self.changebutton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.changebutton addTarget:self action:@selector(ChangCityChick:) forControlEvents:UIControlEventTouchUpInside];
    [self.changebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.backview addSubview:self.changebutton];
    
    self.destinationcity = [[UIButton alloc]init];
    [self.destinationcity setTitle:@"天津" forState:UIControlStateNormal];
    [self.destinationcity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.destinationcity.backgroundColor =[UIColor whiteColor];
    [self.backview addSubview:self.destinationcity];
    
    [self.originatingcity mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH - 30-10-10-30)/2, 40));
        
        make.top.equalTo(_segmentedControl.bottomLineView.mas_bottom).offset(5);
        
        make.left.mas_equalTo(15);
        
    }];
    
    [self.changebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(30, 40));
        
        make.top.equalTo(_segmentedControl.bottomLineView.mas_bottom).offset(5);
        
        make.left.equalTo(self.originatingcity.mas_right).offset(10);
        
    }];
    
    [self.destinationcity mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH - 30-10-10-30)/2, 40));
        
        make.top.equalTo(_segmentedControl.bottomLineView.mas_bottom).offset(5);
        
        make.left.equalTo(self.changebutton.mas_right).offset(10);
        
    }];
    
    
    
    self.Dateoneway = [[UIButton alloc]init];
    
    self.Dateoneway.backgroundColor = [UIColor whiteColor];
    
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM月dd日"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
   NSString * date= [Conversionofweek weekdayStringFromDate:currentDate];
    
    [self.Dateoneway setTitle:[NSString stringWithFormat:@"%@  %@",dateString,date]  forState: UIControlStateNormal];
    [self.Dateoneway setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.backview addSubview:self.Dateoneway];
    [self.Dateoneway mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH - 30-10-10-30)/2, 40));
        
        make.top.equalTo(_originatingcity.mas_bottom).offset(10);
        
        make.left.mas_equalTo(15);
        
    }];
    
    
    self.searchbutton = [[UIButton alloc]init];
    [self.searchbutton setTitle:@"搜索" forState: UIControlStateNormal];
    [self.searchbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.searchbutton addTarget:self action:@selector(searchChick:) forControlEvents: UIControlEventTouchUpInside];
    
    self.searchbutton.backgroundColor =[UIColor whiteColor];
    [self.backview addSubview:self.searchbutton];
    
    
    [self.searchbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH - 30, 40));
        
        make.top.equalTo(_Dateoneway.mas_bottom).offset(10);
        
        make.left.mas_equalTo(15);
        
    }];
    
}


-(void)UPChick:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        
        // 设置view弹出来的位置
        
        _headview.frame = CGRectMake(0, -100, self.view.frame.size.width, 100);
        
        _backview.frame = CGRectMake(0, HeadHigh, SCREEN_WIDTH, SCREEN_HEIGHT-HeadHigh);
    }];
}

-(void)selectLeftAction:(id)sender{
    
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)selectRightAction:(id)sender{
    
    [self.navigationController.view addSubview:_headview];
    [UIView animateWithDuration:0.5 animations:^{
        
        // 设置view弹出来的位置
        
        _headview.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
        
        _backview.frame = CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT-HeadHigh-(100-HeadHigh));
    }];
}
// 表头功能
-(void)event:(UITapGestureRecognizer *)sender{
 
    if (sender.view.tag==1) {
        debugLog(@"跳转登录页面");
        
    }else if (sender.view.tag==2){
        debugLog(@"跳转注册页面");
    }else if (sender.view.tag==3){
        debugLog(@"跳转我的订单页面");
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

// 搜索按钮点击事件
-(void)searchChick:(UIButton*)sender{
    
    debugLog(@"123");
    
        TicketListViewController * ticketlistvc = [[TicketListViewController alloc]init];
    
        [self.navigationController pushViewController:ticketlistvc animated:YES];
    
}

@end
