//
//  SCTabBar.m
//  SCWeibo
//
//  Created by 沈冲 on 16/2/17.
//  Copyright © 2016年 shenchong. All rights reserved.
//

#import "SCTabBar.h"
#import "UIView+extension.h"

@interface SCTabBar ()
@property (nonatomic, weak) UIButton *plusBtn;
@end

@implementation SCTabBar
//@dynamic 修饰的属性代表已经实现了get与set方法
@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *plusBtn = [[UIButton alloc]init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        //设置button的image
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        [plusBtn addTarget:self action:@selector(plusBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        self.plusBtn = plusBtn;
        
        [self addSubview:plusBtn];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.plusBtn.size = [self.plusBtn.currentBackgroundImage size];
    self.plusBtn.centerX = self.centerX;
    self.plusBtn.centerY = self.height * 0.5;
    [self bringSubviewToFront:self.plusBtn];
    
    //计算tabBarButton的宽度
    CGFloat tabBarButtonW = self.width/5;
    CGFloat buttonIndex = 0;
    for (int i; i<self.subviews.count; i++) {
        UIView *childView = self.subviews[i];
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            childView.width = tabBarButtonW;
            
            if (buttonIndex == 2) {
                buttonIndex++;
            }
            
            childView.x = buttonIndex*tabBarButtonW;
            buttonIndex++;
        }
    }
    
}

- (void)plusBtnClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(tabBar:plusBtnClick:)]) {
        [self.delegate tabBar:self plusBtnClick:sender];
    }
}

@end




