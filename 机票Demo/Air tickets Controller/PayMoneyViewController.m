//
//  PayMoneyViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/18.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "PayMoneyViewController.h"
#import "PayHeadView.h"
#import "SelectPayCell.h"
#import "PaySucessViewController.h"
//------支付宝------
//#import "Order.h"
//#import <AlipaySDK/AlipaySDK.h>
//#import "DataSigner.h"
#define kSelectPayCellIdentifier   @"SelectPayCellIdentifier"


@interface Product : NSObject{
@private
    float     _price;
    NSString *_subject;
    NSString *_body;
    NSString *_orderId;
}

@property (nonatomic, assign) float price;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *orderId;

@end


@interface PayMoneyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UILabel  *HeadLabel;
@property (strong, nonatomic)  BaseGroupTableViewController *dataDelegate;
@property (nonatomic, strong) NSMutableArray *selectArray;
@property (nonatomic,assign) NSUInteger indexPathRow;

@property  (nonatomic)     UIButton  *Paybutton;
@end

@implementation PayMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectArray = [[NSMutableArray alloc]init];
    [self.selectArray addObjectsFromArray:@[@"1",@"0",@"0"]];
    self.navigationItem.title = @"支付";
    _HeadLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 30)];
   
    _HeadLabel.textColor = [UIColor blackColor];
    _HeadLabel.text = @"为确保出票，请在15：30之前完成支付";
    _HeadLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_HeadLabel];
    
    self.groupTable.delegate = self;
    self.groupTable.frame = CGRectMake(0,_HeadLabel.bottom+5, SCREEN_WIDTH, SCREEN_HEIGHT-64-44);
    
    [self.groupTable registerClass: [SelectPayCell class]forCellReuseIdentifier:kSelectPayCellIdentifier];
    
    PayHeadView  *customerHeader = [[PayHeadView alloc] initWithFrame:CGRectMake(0.f,0.f,self.view.width,[PayHeadView calculateCellHeight])];
    
    self.groupTable.tableHeaderView = customerHeader;
    
    UIView * aview = [[UIView alloc] initWithFrame:CGRectMake(10.f,0.f,self.view.width-10*2,[PayHeadView calculateCellHeight]-20)];
    //添加边框
    CALayer * layer = [aview layer];
    layer.borderColor = [
                         [UIColor blackColor] CGColor];
    layer.borderWidth = 1.0f;
    
    [customerHeader configureHeaderData:_obj];
    //[customerHeader configureHeaderData:_obj configureshippingspaceHeadData:_spaceobjData];
    
    [customerHeader addSubview:aview];
    
    
    _Paybutton = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-44, SCREEN_WIDTH, 44)];
    //添加边框
    CALayer * layers = [_Paybutton layer];
    layers.borderColor = [
                         [UIColor blackColor] CGColor];
    layers.borderWidth = 1.0f;
    [_Paybutton setTitle:@"确认支付" forState:UIControlStateNormal];
    [_Paybutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_Paybutton addTarget:self action:@selector(PaybuttonChick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_Paybutton];
    _dataDelegate = [[BaseGroupTableViewController alloc] initWithIdentifier:kSelectPayCellIdentifier configureBlock:^(SelectPayCell* cell, id model, NSIndexPath *indexPath) {
        
        
        if (self.indexPathRow == indexPath.row) {
            // 如果是当前cell
            cell.SelectWeiXinPayButton.selected = YES;
            [cell.SelectWeiXinPayButton setImage:[UIImage imageNamed:@"checkboxons"] forState:UIControlStateNormal];
            
        }else{
            
            cell.SelectWeiXinPayButton.selected = NO;
            [cell.SelectWeiXinPayButton setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
            
        }
        
        
        
         [cell configureData:_dataDelegate.dataSource];
        
        
        
        cell.PayTitleLabel.text = model;
        
         __weak PayMoneyViewController   *sellCtrl = self;
        
        cell.btnClickBlock = ^(SelectPayCell *cells,NSUInteger index) {
            
            
            index = cells.SelectWeiXinPayButton.tag;
            [sellCtrl handleCellClickedEvent:cells.SelectWeiXinPayButton];
            
        };
        
        
    }];
    NSArray * a = @[@"微信支付",@"支付宝支付",@"银行卡支付"];
    
    
    [_dataDelegate addModels:a];
    
    
    self.groupTable.dataSource = _dataDelegate;
    
    
    [self.groupTable reloadData];
    // Do any additional setup after loading the view.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50 ;
    
    
}


#pragma mark - 处理按钮点击 事件
- (void)handleCellClickedEvent:(UIButton*)button
{
    
    // 通过button计算出其所在的cell
    UITableViewCell * cell = (UITableViewCell *)[[button superview] superview];
    NSIndexPath * path = [self.groupTable indexPathForCell:cell];
    
    // 记录下当前的IndexPath.row
    self.indexPathRow = path.row;
    NSLog(@"-----%ld",self.indexPathRow);
    // 刷新数据源方法
    [self.groupTable reloadData];
    
}

-(void)PaybuttonChick{
    
    
    
    
    if (self.indexPathRow==0) {
        debugLog(@"调起微信支付");
        
        NSString * weixinstr = [self jumpToBizPay];
        if (![weixinstr isEqualToString:@""]) {
            debugLog(@"微信支付返回结果: %@",weixinstr);
        }
    }else if(self.indexPathRow==1){
        
        [self PayZhiFuBao];
        debugLog(@"调起支付宝支付");
    }else{
        debugLog(@"调起银联支付");
    }
    
}


-(void)PayZhiFuBao{
    
    /*
     *点击获取prodcut实例并初始化订单信息
     */
    Product *product ;
    
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */
    
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = @"";
    NSString *seller = @"";
    NSString *privateKey = @"";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        alert.delegate = self;
        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
//    Order *order = [[Order alloc] init];
//    order.partner = partner;
//    order.seller = seller;
//    order.tradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
//    order.productName = product.subject; //商品标题
//    order.productDescription = product.body; //商品描述
//    order.amount = [NSString stringWithFormat:@"%.2f",product.price]; //商品价格
//    order.notifyURL =  @"http://www.xxx.com"; //回调URL
//    
//    order.service = @"mobile.securitypay.pay";
//    order.paymentType = @"1";
//    order.inputCharset = @"utf-8";
//    order.itBPay = @"30m";
//    order.showUrl = @"m.alipay.com";
//    
//    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
//    NSString *appScheme = @"alisdkdemo";
//    
//    //将商品信息拼接成字符串
//    NSString *orderSpec = [order description];
//    NSLog(@"orderSpec = %@",orderSpec);
//    
//    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
//    id<DataSigner> signer = CreateRSADataSigner(privateKey);
//    NSString *signedString = [signer signString:orderSpec];
//    
//    //将签名成功字符串格式化为订单字符串,请严格按照该格式
//    NSString *orderString = nil;
//    if (signedString != nil) {
//        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
//                       orderSpec, signedString, @"RSA"];
//        
//        //[[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
//            //NSLog(@"reslut = %@",resultDic);
//       // }];
//    }
//
//    
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex//点击弹窗按钮后
{
    NSLog(@"buttonIndex:%ld",(long)buttonIndex);
    
    if (buttonIndex == 0) {//取消
        
        PaySucessViewController *payCtr = [[PaySucessViewController alloc] init];
        
        [self pushViewController:payCtr];
        
        NSLog(@"取消");
    }else if (buttonIndex == 1){//确定
        
        NSLog(@"确定");
    }
}


#pragma mark   ==============产生随机订单号==============


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}



-(NSString *)jumpToBizPay {
    if (![WXApi isWXAppInstalled]) {
        debugLog(@"没有安装微信");
        return nil;
    }else if (![WXApi isWXAppSupportApi]){
        debugLog(@"不支持微信支付");
        return nil;
    }
    
    debugLog(@"安装了微信");
    
    //============================================================
    // V3&V4支付流程实现
    // 注意:参数配置请查看服务器端Demo
    // 更新时间：2015年11月20日
    //============================================================
    NSString *urlString   = @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php?plat=ios";
    //解析服务端返回json数据
    NSError *error;
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if ( response != nil) {
        NSMutableDictionary *dict = NULL;
        //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
        dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
        
        NSLog(@"url:%@",urlString);
        if(dict != nil){
            NSMutableString *retcode = [dict objectForKey:@"retcode"];
            if (retcode.intValue == 0){
                NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
                
                //调起微信支付
                PayReq* req             = [[PayReq alloc] init];
                req.partnerId           = [dict objectForKey:@"partnerid"];
                req.prepayId            = [dict objectForKey:@"prepayid"];
                req.nonceStr            = [dict objectForKey:@"noncestr"];
                req.timeStamp           = stamp.intValue;
                req.package             = [dict objectForKey:@"package"];
                req.sign                = [dict objectForKey:@"sign"];
                [WXApi sendReq:req];
                //日志输出
                NSLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",[dict objectForKey:@"appid"],req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign );
                return @"";
            }else{
                return [dict objectForKey:@"retmsg"];
            }
        }else{
            return @"服务器返回错误，未获取到json对象";
        }
    }else{
        return @"服务器返回错误";
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
