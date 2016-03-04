//
//  ListTableViewCell.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "ListTableViewCell.h"
#import "TicketListEntity.h"
@implementation ListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
        
    }
    return self;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UIView"]) {
        return NO;
    }
    return  YES;
}

-(void)event:(UITapGestureRecognizer *)sender{
    
       
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
}


- (void)updateCarContent:(id)obj
{
    TicketList * s = obj;
    BuyCar * a = s.aportinfo;
    
     debugLog(@"obj==%@",a.cityname);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
