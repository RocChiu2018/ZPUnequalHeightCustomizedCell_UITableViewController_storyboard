//
//  ZPWeibo.m
//  用xib自定义非等高cell
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPWeibo.h"

@implementation ZPWeibo

+ (instancetype)weiboWithDict:(NSDictionary *)dict
{
    ZPWeibo *weibo = [[ZPWeibo alloc] init];
    
    //KVC
    [weibo setValuesForKeysWithDictionary:dict];
    
    return weibo;
}

@end
