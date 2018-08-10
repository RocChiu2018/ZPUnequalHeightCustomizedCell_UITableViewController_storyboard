//
//  ZPTableViewCell.h
//  用xib自定义非等高cell
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZPWeibo;

@interface ZPTableViewCell : UITableViewCell

@property (nonatomic, strong) ZPWeibo *weibo;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
