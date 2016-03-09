//
//  UserBookingTableViewCell.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/9.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "UserBookingTableViewCell.h"

@interface UserBookingTableViewCell ()


@end
@implementation UserBookingTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIColor * blackColor = [UIColor blackColor];
        UIFont  *font = [UIFont systemFontOfSize:14];
//        self.Positions =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
//        self.Endorse  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
//        self.Votes  = [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
//        
//        self.SeatPrice  =  [AppUtils creatNormalLabel:blackColor align:NSTextAlignmentCenter font:font parent:self.contentView];
//        
//        self.Bookingbutton = [AppUtils createButton:@"预订" titleColor:[UIColor blackColor] img:nil bg:nil parent:self.contentView];
//        
        
        
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
