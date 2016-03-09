//
//  TicketListEntity.m
//  机票Demo
//
//  Created by 吴宇 on 16/3/3.
//  Copyright © 2016年 吴宇. All rights reserved.
//

#import "TicketListEntity.h"

@implementation Policyinfo

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end

@implementation Dportinfo

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end


@implementation Dateinfo

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end

@implementation Craftinfo

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end

@implementation Basinfo

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end

@implementation Aportinfo

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end

@implementation TicketList

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

//+(JSONKeyMapper*)keyMapper
//{
//    return [[JSONKeyMapper alloc] initWithDictionary:@{
//                                                       @"id": @"customer_id",
//                                                       }];
//}


@end


@implementation TicketListEntity


+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}


@end
