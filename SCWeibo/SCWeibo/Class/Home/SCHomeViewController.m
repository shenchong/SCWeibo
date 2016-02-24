//
//  SCHomeViewController.m
//  SCWeibo
//
//  Created by 沈冲 on 16/2/20.
//  Copyright © 2016年 shenchong. All rights reserved.
//

#import "SCHomeViewController.h"
#import "UIBarButtonItem+Ex.h"
#import "OneViewController.h"
#import "SCHomeTitleBtn.h"

@interface SCHomeViewController ()

@end

@implementation SCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNav{
    //设置导航栏左右的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_friendsearch" highlightedImage:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_pop" highlightedImage:@"navigationbar_pop_highlighted" target:self action:@selector(scan)];
    
    //设置导航栏中间的view
    SCHomeTitleBtn *titleBtn = [[SCHomeTitleBtn alloc]init];
    [titleBtn setTitle:@"沈某人1012" forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [titleBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn sizeToFit];
//    titleBtn.backgroundColor = [UIColor redColor];
    [titleBtn addTarget:self action:@selector(showPopView:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleBtn;
}

- (void)friendSearch{
    OneViewController *oneVC = [[OneViewController alloc]init];
    [self.navigationController pushViewController:oneVC animated:YES];
}

- (void)scan{
    
}

- (void)showPopView:(UIButton *)sender{
    UIButton *popViewBtn = [[UIButton alloc]initWithFrame:[UIScreen mainScreen].bounds];
    popViewBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [popViewBtn addTarget:self action:@selector(hide:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.window addSubview:popViewBtn];
    
    UIImageView *popView;
}

- (void)hide:(UIButton *)sender{
    [sender removeFromSuperview];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

@end
