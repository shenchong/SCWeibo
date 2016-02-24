//
//  UIBarButtonItem+Ex.m
//  SCWeibo
//
//  Created by 沈冲 on 16/2/20.
//  Copyright © 2016年 shenchong. All rights reserved.
//

#import "UIBarButtonItem+Ex.h"

@implementation UIBarButtonItem (Ex)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightedImage:(NSString *)hltImage target:(nullable id)target action:(nullable SEL)action{
    
    //用一个自定义的button去作为UIBarButtonItem 的customView
    
    //初始化一个button
    UIButton *button = [[UIButton alloc] init];
    //设置默认与高亮的图片
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hltImage] forState:UIControlStateHighlighted];
    
    //设置button的大小
    [button sizeToFit];
    //给按钮添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightedImage:(NSString *)hltImage title:(NSString *)title target:(nullable id)target action:(nullable SEL)action{
    //用一个自定义的button去作为UIBarButtonItem 的customView
    
    //初始化一个button
    UIButton *button = [[UIButton alloc] init];
    //设置默认与高亮的图片
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hltImage] forState:UIControlStateHighlighted];
    
    //设置title
    [button setTitle:title forState:UIControlStateNormal];
    //设置文字颜色
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    //设置文字 大小
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    
    //设置button的大小
    [button sizeToFit];
    //给按钮添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

@end
