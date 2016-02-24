//
//  SCTabBar.h
//  SCWeibo
//
//  Created by 沈冲 on 16/2/17.
//  Copyright © 2016年 shenchong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCTabBar;

@protocol SCTabBarDelegate <NSObject,UITabBarDelegate>

- (void)tabBar:(SCTabBar *)tabBar plusBtnClick:(UIButton *)btn;

@end

@interface SCTabBar : UITabBar
@property (nonatomic, weak) id<SCTabBarDelegate> delegate;
@end


