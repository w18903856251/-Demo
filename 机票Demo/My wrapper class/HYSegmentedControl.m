//
//  HYSegmentedControl.m
//  CustomSegControlView
//
//  Created by sxzw on 14-6-12.
//  Copyright (c) 2014年 sxzw. All rights reserved.
//

#import "HYSegmentedControl.h"
//#import "UtilsMacro.h"
#import "UIColor+HexString.h"

#define HYSegmentedControl_Height 44.f
#define HYSegmentedControl_Width ([UIScreen mainScreen].bounds.size.width)
#define  FONT_SIZE_BUTTON      14.F    //列表内 button 字体
#define DEFAULTGRAYCOLOR           @"#f5f5f5"   //默认灰色
#define HOMEPAGECOLOR_BOSS         @"#059ca7"  //默认蓝
#define Min_Width_4_Button 80.0

#define Define_Tag_add 1000

@interface HYSegmentedControl()

@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic)NSMutableArray *array4Btn;
@property (strong,nonatomic) UIView *DefaultLine; //筛选下面灰色线条

@end

@implementation HYSegmentedControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithsOriginY:(CGFloat)y Titles:(NSArray *)titles delegate:(id)delegate{
    CGRect rect4View = CGRectMake(.0f, 0.f, 180, 30);
    
    if (self = [super initWithFrame:rect4View]) {
        
        //self.backgroundColor = [UIColor whiteColor];
        [self setUserInteractionEnabled:YES];
        
        self.delegate = delegate;
        
        //
        //  array4btn
        //
        _array4Btn = [[NSMutableArray alloc] initWithCapacity:[titles count]];
        
        //
        //  set button
        //
        CGFloat width4btn = rect4View.size.width/[titles count];
        if (width4btn < Min_Width_4_Button) {
            width4btn = Min_Width_4_Button;
        }
        
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = self.backgroundColor;
        _scrollView.userInteractionEnabled = YES;
        _scrollView.contentSize = CGSizeMake([titles count]*width4btn, HYSegmentedControl_Height);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        for (int i = 0; i<[titles count]; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(i*width4btn, -5.0f, width4btn, HYSegmentedControl_Height);
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE_BUTTON];
           // btn.backgroundColor = [UIColor colorWithHexString:HOMEPAGECOLOR_BOSS];
            [btn setTitleColor:[UIColor colorWithHexString:HOMEPAGECOLOR_BOSS] forState:UIControlStateSelected];
            [btn setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(segmentedControlChange:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = Define_Tag_add+i;
            [_scrollView addSubview:btn];
            [_array4Btn addObject:btn];
            
            if (i == 0) {
                btn.selected = YES;
            }
        }
        
        //
        //  lineView
        //
        CGFloat height4Line = HYSegmentedControl_Height/3.0f;
        CGFloat originY = (34 - height4Line)/2;
        for (int i = 1; i<[titles count]; i++) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(i*width4btn-1.0f, originY, 1.0f, height4Line)];
            lineView.backgroundColor = [UIColor colorWithHexString:HOMEPAGECOLOR_BOSS];
            [_scrollView addSubview:lineView];
        }
        
        //
        //  bottom lineView
        //
        _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(5.0f, HYSegmentedControl_Height-2.f, width4btn-10.0f, 2.0f)];
        _bottomLineView.backgroundColor = [UIColor colorWithHexString:HOMEPAGECOLOR_BOSS];
        [_scrollView addSubview:_bottomLineView];
        
        [self addSubview:_scrollView];
    }
    return self;

}

- (id)initWithOriginY:(CGFloat)y Titles:(NSArray *)titles delegate:(id)delegate
{
    CGRect rect4View = CGRectMake(15, y, HYSegmentedControl_Width-30, HYSegmentedControl_Height);
    if (self = [super initWithFrame:rect4View]) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self setUserInteractionEnabled:YES];
        
        self.delegate = delegate;
        
        debugLog(@"%f",HYSegmentedControl_Width/5);
        //
        //  array4btn
        //
        _array4Btn = [[NSMutableArray alloc] initWithCapacity:[titles count]];
        
        //
        //  set button
        //
        CGFloat width4btn = rect4View.size.width/[titles count];
//        if (width4btn < Min_Width_4_Button) {
//            width4btn = Min_Width_4_Button;
//        }
        
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor = self.backgroundColor;
        _scrollView.userInteractionEnabled = YES;
        //_scrollView.contentSize = CGSizeMake(4*width4btn, HYSegmentedControl_Height);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        for (int i = 0; i<[titles count]; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(i*width4btn, .0f, width4btn, HYSegmentedControl_Height);
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE_BUTTON];
            //[btn setTitleColor:[UIColor colorWithHexString:HOMEPAGECOLOR_BOSS] forState:UIControlStateSelected];
            [btn setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(segmentedControlChange:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = Define_Tag_add+i;
            [_scrollView addSubview:btn];
            [_array4Btn addObject:btn];
            
            if (i == 0) {
                btn.selected = YES;
            }
        }
        
        //
        //  lineView
        //
        CGFloat height4Line = HYSegmentedControl_Height/3.0f;
        CGFloat originY = (HYSegmentedControl_Height - height4Line)/2;
        for (int i = 1; i<[titles count]; i++) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(i*width4btn-1.0f, originY, 1.0f, height4Line)];
            lineView.backgroundColor = [UIColor colorWithHexString:DEFAULTGRAYCOLOR];
            [_scrollView addSubview:lineView];
        }
        
        //
        //  bottom lineView
        //
        
        _DefaultLine = [[UIView alloc] initWithFrame:CGRectMake(0.f, HYSegmentedControl_Height-2.f, SCREEN_WIDTH, 2.0f)];
        _DefaultLine.backgroundColor = [UIColor colorWithHexString:DEFAULTGRAYCOLOR];
        [_scrollView addSubview:_DefaultLine];
        
        [self addSubview:_scrollView];
        
        
        _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(5.0f, HYSegmentedControl_Height-4.f, width4btn-10.0f, 3.0f)];
        _bottomLineView.backgroundColor = [UIColor colorWithHexString:HOMEPAGECOLOR_BOSS];
        [_scrollView addSubview:_bottomLineView];
        
        //[self addSubview:_scrollView];
    }
    return self;
}

//
//  btn clicked
//
- (void)segmentedControlChange:(UIButton *)btn
{
    btn.selected = YES;
    for (UIButton *subBtn in self.array4Btn) {
        if (subBtn != btn) {
            subBtn.selected = NO;
        }
    }
    
    CGRect rect4boottomLine = self.bottomLineView.frame;
    rect4boottomLine.origin.x = btn.frame.origin.x +5;
    
    CGPoint pt = CGPointZero;
    BOOL canScrolle = NO;
//    if ((btn.tag - Define_Tag_add) >= 2 && [_array4Btn count] > 4 && [_array4Btn count] > (btn.tag - Define_Tag_add + 2)) {
//        pt.x = btn.frame.origin.x - Min_Width_4_Button*1.5f;
//        canScrolle = YES;
//    }else if ([_array4Btn count] > 4 && (btn.tag - Define_Tag_add + 2) >= [_array4Btn count]){
//        pt.x = (_array4Btn.count - 4) * Min_Width_4_Button;
//        canScrolle = YES;
//    }else if (_array4Btn.count > 4 && (btn.tag - Define_Tag_add) < 2){
//        pt.x = 0;
//        canScrolle = YES;
//    }
    
//    if (canScrolle) {
//        [UIView animateWithDuration:0.3 animations:^{
//            _scrollView.contentOffset = pt;
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:0.2 animations:^{
//                self.bottomLineView.frame = rect4boottomLine;
//            }];
//        }];
//    }else{
        [UIView animateWithDuration:0.2 animations:^{
            self.bottomLineView.frame = rect4boottomLine;
        }];
   // }
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(hySegmentedControlSelectAtIndex:)]) {
        self.selectIndex = (NSInteger)btn.tag - Define_Tag_add;
        [self.delegate hySegmentedControlSelectAtIndex:btn.tag - Define_Tag_add];
    }
}

// delegete method
- (void)changeSegmentedControlWithIndex:(NSInteger)index
{
    if (index > [_array4Btn count]-1) {
        NSLog(@"index 超出范围");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"index 超出范围" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alertView show];
        return;
    }
    
    UIButton *btn = [_array4Btn objectAtIndex:index];
    [self segmentedControlChange:btn];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
