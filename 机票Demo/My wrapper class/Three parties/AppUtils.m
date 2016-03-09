//
//  AppUtils.m
//  zlydoc+iphone
//
//  Created by Ryan on 14+5+23.
//  Copyright (c) 2014年 zlycare. All rights reserved.
//

#import "AppUtils.h"
#import <CommonCrypto/CommonDigest.h>


#define DEFAULT_VOID_COLOR [UIColor whiteColor]
//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]
#define  FONT_SIZE_BUTTON      14.F
@implementation AppUtils

/********************* System Utils **********************/

+ (void)closeKeyboard
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

+ (NSString *)md5FromString:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/******* UITableView & UINavigationController Utils *******/
+ (UILabel *)tableViewsHeaderLabelWithMessage:(NSString *)message
{
    UILabel *lb_headTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 320, 20)];
    lb_headTitle.font = [UIFont boldSystemFontOfSize:15.0];
    lb_headTitle.textColor = [UIColor darkGrayColor];
    lb_headTitle.textAlignment = NSTextAlignmentCenter;
    lb_headTitle.text = message;
    return lb_headTitle;
}

+ (UIView *)tableViewsFooterView
{
    UIView *coverView = [UIView new];
    coverView.backgroundColor = [UIColor clearColor];
    return coverView;
}

/********************** NSDate Utils ***********************/
+ (NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)dateString formatter:(NSString *)formatter;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter dateFromString:dateString];
}

// 获取 年份 月份
+ (NSArray *)dateInfoFromString:(NSString *)dateString
{
//  "2015年4月"
    NSArray *years = [dateString componentsSeparatedByString:@"年"];
    NSString  *year = years[0];
    NSString  *month = [years[1] componentsSeparatedByString:@"月"][0];
    if (year&&month) return @[year,month];
    else return nil;
}

// 格式化 服务器返回时间
//+ (NSString *)formatterServerTime:(long long)time {
//    if (!time) {
//        return @"--";
//    }
//    NSDate   *date = [NSDate dateWithTimeIntervalSince1970:time/1000];
//   // NSString  *date_string = [date  formattedDateWithFormat:@"yyyy年MM月dd日 HH点mm分"];
//    return date_string;
//}

+ (long long)getNowTimeMillonSeconds {
    
     NSDate *date = [NSDate date];
    return [@(floor([date timeIntervalSince1970] * 1000)) longLongValue];
}

/********************* Category Utils **********************/
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
        return DEFAULT_VOID_COLOR;
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return DEFAULT_VOID_COLOR;
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

/********************* Call Phone **********************/
////打电话
//+ (void)callPhone:(NSString *)phoneNumber controller:(UIViewController *)viewController
//{
//    [CoreMediaFuncManagerVC call:phoneNumber inViewController:viewController failBlock:^{
//       
//    }];
//}

// do not back up
+ (void)setPathDoNotBackUp:(NSString *)path
{
    NSURL * fileURL;
    fileURL = [ NSURL fileURLWithPath:path ];
    [ fileURL setResourceValue: [ NSNumber numberWithBool: YES ] forKey: NSURLIsExcludedFromBackupKey error: nil ];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - 获取文本高度
+ (CGFloat)textHeightWithWidth:(NSString *)text  width:(CGFloat)textWidth font:(UIFont *)textFont
{
    CGSize  size    = CGSizeMake(textWidth,1000.f);
    CGRect  rect    = [text boundingRectWithSize:size
                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                              attributes:@{NSFontAttributeName:textFont
                                                           }
                                                 context:nil];
    return rect.size.height;
}

#pragma mark - 新增ui生成 方法
//返回 通用label
+ (UILabel  *)creatNormalLabel:(UIColor *)textColor align:(NSTextAlignment)textAlignment font:(UIFont *)textFont parent:(UIView *)superView
{
    UILabel   *commonLabel  = [[UILabel alloc] init];
    commonLabel.textColor = textColor;
    commonLabel.backgroundColor = [UIColor clearColor];
    if (textAlignment) commonLabel.textAlignment = textAlignment;
    if (textFont) commonLabel.font = textFont;
    [superView addSubview:commonLabel];
    return commonLabel;
}

//返回 通用imageView (车辆占位图)
+ (UIImageView *)creatNormalImageView:(UIView *)superView img:(NSString *)imgName
{   
    UIImageView  *imgView = [[UIImageView alloc]  initWithImage:ImageNamed(imgName?imgName:@"carPlaceholder")];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [superView addSubview:imgView];
    return imgView;
}

//返回 可拉伸 markImageView
+ (UIImageView *)creatMarkImageViewInCell:(UIView *)superView
{
    UIImage *lineImg = ImageNamed(@"bossblueline");
    lineImg  = [lineImg resizableImageWithCapInsets:UIEdgeInsetsMake(3.f,3.f,3.f,3.f ) resizingMode:UIImageResizingModeStretch];
    UIImageView *markImgView = [[UIImageView alloc] initWithImage:lineImg];
    [superView addSubview:markImgView];
    return markImgView;
}

////返回 分割线 label
//+ (UILabel *)creatTableSeparatorLine:(BOOL)borderLine parent:(UIView *)superView
//{
//    UILabel *lineSeparator  = [UILabel new];
//    lineSeparator.backgroundColor = [UIColor  colorWithHexString:(borderLine?MainVCColoe:NORMALCELLLINEBORDERCOLOR)];
//    //        _upLine.backgroundColor = [UIColor grayColor];
//    [superView addSubview:lineSeparator];
//    return lineSeparator;
//}

+ (UITextView *)creatTextView:(UIColor *)textColor align:(NSTextAlignment)textAlignment font:(UIFont *)textFont parent:(UIView *)superView
{
    UITextView  *textView = [[UITextView alloc] init];
    textView.font = textFont;
    textView.textColor = textColor;
    textView.textAlignment = textAlignment;
    textView.backgroundColor = [UIColor clearColor];
//    textView.editable = NO;
//    textView.scrollEnabled = NO;
    textView.userInteractionEnabled = NO;
    [superView addSubview:textView];
    return textView;
}

+ (UIButton *)createNormalButtonWithImage:(NSString *)imgName parent:(UIView *)superView
{
    UIButton  *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:imgName?ImageNamed(imgName):nil forState:UIControlStateNormal];
//    [button setBackgroundImage:img forState:UIControlStateSelected];
    
    [superView addSubview:button];
    return button;
}

+ (UIButton *)createButton:(NSString *)title titleColor:(UIColor *)tlColor img:(UIImage *)img bg:(UIImage *)bgImg parent:(UIView *)superView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    if (bgImg) {
         [button setBackgroundImage:bgImg forState:UIControlStateNormal];
//         [button setBackgroundImage:bgImg forState:UIControlStateHighlighted];
    }
    if (img) [button setImage:img forState:UIControlStateNormal];
    [button setTitleColor:tlColor  forState:UIControlStateNormal];
    [button setTitleColor:tlColor  forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE_BUTTON];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.clipsToBounds = YES;
    
    [superView addSubview:button];
    return button;
}

+ (UIButton *)createButtons:(NSString *)title titleColor:(UIColor *)tlColor img:(UIImage *)img bg:(UIImage *)bgImg parent:(UIView *)superView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    if (bgImg) {
        [button setBackgroundImage:bgImg forState:UIControlStateNormal];
        //         [button setBackgroundImage:bgImg forState:UIControlStateHighlighted];
    }
    if (img) [button setImage:img forState:UIControlStateNormal];
    [button setTitleColor:tlColor  forState:UIControlStateNormal];
    [button setTitleColor:tlColor  forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE_BUTTON];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.clipsToBounds = YES;
    
    [superView addSubview:button];
    return button;
}




+ (UIButton *)createButton:(NSString *)title titleColor:(UIColor *)titleColor selectedColor:(UIColor *)selected bg:(UIColor *)bgColor parent:(UIView *)superView {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor  forState:UIControlStateNormal];
    [button setTitleColor:selected  forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:FONT_SIZE_BUTTON];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [button setBackgroundColor:bgColor];
    [superView addSubview:button];
    return button;
}

//+ (SWFrameButton *)createSWButton:(NSString *)title color:(UIColor *)tintColor font:(UIFont *)titleFont parent:(UIView *)superView {
//    
//    SWFrameButton   *sw_btn = [[SWFrameButton alloc] init];
//    sw_btn.tintColor = tintColor;
//    if (title)  [sw_btn setTitle:title forState:UIControlStateNormal];
//    sw_btn.titleLabel.font  = titleFont;
//    [superView addSubview:sw_btn];
//    return sw_btn;
//}

//返回 uitextfield
+ (UITextField *)creatNormalTextField:(NSString *)palceholder color:(UIColor *)textColor align:(NSTextAlignment)textAlignment parent:(UIView *)superView
{
    UITextField  *textfield = [[UITextField alloc] init];
    textfield.textAlignment = textAlignment;
    textfield.placeholder = palceholder;
    textfield.textColor = textColor;
    textfield.autocorrectionType = UITextAutocorrectionTypeNo;
    textfield.leftViewMode =  UITextFieldViewModeAlways;
    //禁止首字母大写
    textfield.autocapitalizationType = UITextAutocapitalizationTypeNone;
    // 设置键盘类型
//    textfield.keyboardType = UIKeyboardTypeDefault;
    // 输入框的边框类型
    textfield.borderStyle = UITextBorderStyleNone;
    // 键盘上的return按钮类型
    textfield.returnKeyType = UIReturnKeyDone;
    // 是否安全输入，是的话，输入内容将为星号
    textfield.secureTextEntry = NO;
    // 清除按钮模式
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [superView addSubview:textfield];
    return textfield;
}

//+ (HXTextField *)creatHXTextField:(NSString *)palceholder color:(UIColor *)textColor align:(NSTextAlignment)textAlignment parent:(UIView *)superView
//{
//    HXTextField  *textfield = [[HXTextField alloc] init];
//    textfield.textAlignment = textAlignment;
//    textfield.placeholder = palceholder;
//    textfield.textColor = textColor;
//    textfield.autocorrectionType = UITextAutocorrectionTypeNo;
//    textfield.leftViewMode =  UITextFieldViewModeAlways;
//    //禁止首字母大写
//    textfield.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    // 设置键盘类型
//    textfield.keyboardType = UIKeyboardTypeDefault;
//    // 输入框的边框类型
//    textfield.borderStyle = UITextBorderStyleNone;
//    // 键盘上的return按钮类型
//    textfield.returnKeyType = UIReturnKeyDone;
//    // 是否安全输入，是的话，输入内容将为星号
//    textfield.secureTextEntry = NO;
//    // 清除按钮模式
//    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
//    
//    [superView addSubview:textfield];
//    return textfield;
//}
//
//+ (HXPlaceHolderTextView *)creatHXPlaceHolderTextField:(NSString *)palceholder color:(UIColor *)textColor align:(NSTextAlignment)textAlignment parent:(UIView *)superView
//{
//    HXPlaceHolderTextView  *textview = [[HXPlaceHolderTextView alloc] init];
//    textview.textAlignment = textAlignment;
//    textview.placeholder = palceholder;
//    textview.textColor = textColor;
//    textview.scrollsToTop = NO;
//    textview.autocorrectionType = UITextAutocorrectionTypeNo;
//    //禁止首字母大写
//    textview.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    // 设置键盘类型
//    //    textfield.keyboardType = UIKeyboardTypeDefault;
//    // 键盘上的return按钮类型
//    textview.returnKeyType = UIReturnKeyNext;
// 
//    [superView addSubview:textview];
//    return textview;
//}

/**
 *  barbuttonitem
 *
 *  @param title  标题
 *  @param target 对象
 *  @param action 方法
 *
 *  @return barbuttonitem
 */
+ (UIBarButtonItem*)barButtonItemWithTitle:(NSString*)title target:(id)target action:(SEL)action   {
    UIBarButtonItem *bi = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    bi.tintColor = [UIColor blackColor];
    [bi setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.f]} forState:UIControlStateNormal];
    return bi;
}

+ (UIBarButtonItem*)barButtonItemWithTitle:(NSString*)title color:(UIColor *)tintColor target:(id)target action:(SEL)action  {
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    bar.tintColor = tintColor;
    [bar setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.f]} forState:UIControlStateNormal];
    return bar;
}
@end
