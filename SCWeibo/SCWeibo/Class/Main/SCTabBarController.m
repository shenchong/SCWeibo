//
//  SCTabBarController.m
//  SCWeibo
//
//  Created by 沈冲 on 16/2/17.
//  Copyright © 2016年 shenchong. All rights reserved.
//

#import "SCTabBarController.h"
#import "SCTabBar.h"
#import "SCHomeViewController.h"
#import "SCNavigationController.h"

@interface SCTabBarController () <SCTabBarDelegate>

@end

@implementation SCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SCTabBar *tabBar = [[SCTabBar alloc]init];
    tabBar.delegate = self;// 注册代理要在更改tabBar之前
    //利用kvc设置只可读的属性
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    [self addChildVC];
    
}

- (void)addChildVC{
    
    self.tabBar.backgroundImage = [[UIImage imageNamed:@"tabbar_background"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
    self.tabBar.selectionIndicatorImage = [[UIImage imageNamed:@"tabbar_background"] stretchableImageWithLeftCapWidth:25 topCapHeight:25];
    
    SCHomeViewController *homeVC = [[SCHomeViewController alloc]init];
    [self addChildViewControllerWithTitle:@"首页" Image:@"tabbar_home" Controller:homeVC];
    
    UIViewController *msgVC = [[UIViewController alloc]init];
    [self addChildViewControllerWithTitle:@"消息" Image:@"tabbar_message_center" Controller:msgVC];
    
    UIViewController *discoverVC = [[UIViewController alloc]init];
    [self addChildViewControllerWithTitle:@"发现" Image:@"tabbar_discover" Controller:discoverVC];
    
    UIViewController *profileVC = [[UIViewController alloc]init];
    [self addChildViewControllerWithTitle:@"我" Image:@"tabbar_profile" Controller:profileVC];
}

- (void)addChildViewControllerWithTitle:(NSString *)title Image:(NSString *)image Controller:(UIViewController *)controller{
    
    controller.view.backgroundColor = [UIColor whiteColor];
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",image]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.title = title;
    [self selectedTapTabBarItems:controller.tabBarItem];
    [self unSelectedTapTabBarItems:controller.tabBarItem];
    SCNavigationController *navCtl = [[SCNavigationController alloc]initWithRootViewController:controller];
    
    [self addChildViewController:navCtl];
}

/**
 *  设置tabbar字体
 */
-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:10], UITextAttributeFont,[UIColor grayColor],UITextAttributeTextColor,
                                        nil] forState:UIControlStateNormal];
}

-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:10],
                                        UITextAttributeFont,[UIColor orangeColor],UITextAttributeTextColor,
                                        nil] forState:UIControlStateSelected];
}



- (void)tabBar:(SCTabBar *)tabBar plusBtnClick:(UIButton *)btn{
    NSLog(@"----");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
