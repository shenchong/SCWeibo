//
//  SCNavigationController.m
//  SCWeibo
//
//  Created by 沈冲 on 16/2/20.
//  Copyright © 2016年 shenchong. All rights reserved.
//

#import "SCNavigationController.h"
#import "UIBarButtonItem+Ex.h"

@interface SCNavigationController ()

@end

@implementation SCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 重写push方法以实现返回item自定义
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    NSLog(@"count=%ld",self.viewControllers.count);
    
    if (self.viewControllers.count >= 1) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIViewController *VC = self.viewControllers.firstObject;
        NSString *title = VC.title;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_back_withtext" highlightedImage:@"navigationbar_back_withtext_highlighted" title:title target:self action:@selector(back)];
    }
    
    
    [super pushViewController:viewController animated:YES];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

@end
