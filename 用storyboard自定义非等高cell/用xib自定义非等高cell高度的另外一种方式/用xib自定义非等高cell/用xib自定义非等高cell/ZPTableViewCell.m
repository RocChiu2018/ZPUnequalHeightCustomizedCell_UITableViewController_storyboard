//
//  ZPTableViewCell.m
//  用xib自定义非等高cell
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPTableViewCell.h"
#import "ZPWeibo.h"

@interface ZPTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@end

@implementation ZPTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code

    self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    
    ZPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;
}

-(void)setWeibo:(ZPWeibo *)weibo
{
    _weibo = weibo;
    
    //防止循环利用的时候出问题
    if (weibo.isVip)
    {
        self.nameLabel.textColor = [UIColor greenColor];
        self.vipImageView.hidden = NO;
    }else
    {
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipImageView.hidden = YES;
    }
    
    self.nameLabel.text = weibo.name;
    self.iconImageView.image = [UIImage imageNamed:weibo.icon];
    
    //防止循环利用的时候出问题
    if (weibo.picture)
    {
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:weibo.picture];
    }else
    {
        self.pictureImageView.hidden = YES;
    }
    
    self.contentLabel.text = weibo.text;
    
    //强制布局
    [self layoutIfNeeded];
    
    //计算cell的高度
    if (self.pictureImageView.hidden)  //没有配图的时候，取文字的最大Y值
    {
        weibo.cellHeight = CGRectGetMaxY(self.contentLabel.frame) + 10;
    }else  //有配图的时候，取配图的最大Y值
    {
        weibo.cellHeight = CGRectGetMaxY(self.pictureImageView.frame) + 10;
    }
}

@end
