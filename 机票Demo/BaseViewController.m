//
//  BaseViewController.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/10.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "BaseViewController.h"
#define ANIMATE_DURATION            0.25f   //动画时间
@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

#pragma mark - dealloc
- (void)dealloc
{
    NSString  *ctrl_controller = NSStringFromClass([self class]);
    debugLog(@"释放 控制器类型:%@",ctrl_controller);
}


#pragma mark - http cancel
- (void)cancelViewControllerHttp {
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view.
}

#pragma mark - 添加tapGesture
- (void)addTapGesture
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapGesture.numberOfTapsRequired = 1; // 单击
    tapGesture.numberOfTouchesRequired = 1;//
    tapGesture.delegate = self;
    [self.view addGestureRecognizer:tapGesture];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    //    debugLog(@"%@",NSStringFromClass([touch.view class]));
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;
}


/*
 *  handleTap 触摸函数
 *  @recognizer  UITapGestureRecognizer 触摸识别器
 */
-(void) handleTap:(UITapGestureRecognizer *)recognizer
{
    [self keyBoardDown];
}

#pragma mark - 键盘取消方法
// 点击背景，键盘弹下去
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[UIApplication sharedApplication].delegate.window endEditing:YES];
}
- (void)keyBoardDown
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}



#pragma mark - 控制器入栈方法
- (void)pushViewController:(UIViewController *)viewController
{
    [self modifyNavBackItemAttribute];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - 延迟.25s pop
- (void)navDelayToPop
{
    [self performSelector:@selector(navImmediateToPop) withObject:nil afterDelay:ANIMATE_DURATION];
}

#pragma mark - 立即 pop
- (void)navImmediateToPop
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)modifyNavBackItemAttribute
{
    
    // 设置返回按钮的文本
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"返回"
                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
    
    // 设置返回按钮的背景图片
    /*
     UIImage *img = [UIImage imageNamed:@"nav_back_arrow_s"];
     
     img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(0, 18, 0, 0)];
     [[UIBarButtonItem appearance] setBackButtonBackgroundImage:img
     forState:UIControlStateNormal
     barMetrics:UIBarMetricsDefault];
     */
    // 设置文本与图片的偏移量
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0.f, 0.f)
                                                         forBarMetrics:UIBarMetricsDefault];
    // 设置文本的属性
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:16],
                                 //                    NSForegroundColorAttributeName:[UIColor grayColor]
                                 };
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    
}


@end
