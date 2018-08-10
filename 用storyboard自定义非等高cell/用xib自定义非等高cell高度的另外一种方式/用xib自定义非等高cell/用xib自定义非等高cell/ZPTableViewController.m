//
//  ZPTableViewController.m
//  用xib自定义非等高cell
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPTableViewController.h"
#import "ZPWeibo.h"
#import "ZPTableViewCell.h"

@interface ZPTableViewController ()

@property (nonatomic, strong) NSArray *models;

@end

@implementation ZPTableViewController

//懒加载
-(NSArray *)models
{
    if (_models == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray)
        {
            ZPWeibo *weibo = [ZPWeibo weiboWithDict:dict];
            [tempArray addObject:weibo];
        }
        
        _models = tempArray;
    }
    
    return _models;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

/**
 * 此方法是构建cell，但还没有显示在tableView上面，所以如果没有强制布局那句代码的话就意味着构建出来了cell，但是没有显示在tableView上面，也就没有label，imageView这些控件，所以程序是没有办法算出cell的高度的。要想算出cell的高度就要加上强制布局那句代码。
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath");
    
    ZPTableViewCell *cell = [ZPTableViewCell cellWithTableView:tableView];
    
    cell.weibo = [self.models objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZPWeibo *weibo = [self.models objectAtIndex:indexPath.row];
    
    return weibo.cellHeight;
}

/**
 * estimatedHeightForRowAtIndexPath:估计高度，有这个方法的时候程序会先执行这个方法，然后执行cellForRowAtIndexPath方法，最后执行heightForRowAtIndexPath方法。有这个方法的时候也会优化性能。
 * 如果不写此方法的话，程序会先执行heightForRowAtIndexPath方法，然后执行cellForRowAtIndexPath方法。
 */
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

@end
