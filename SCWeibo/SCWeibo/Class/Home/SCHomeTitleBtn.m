//
//  SCHomeTitleBtn.m
//  SCWeibo
//
//  Created by 沈冲 on 16/2/20.
//  Copyright © 2016年 shenchong. All rights reserved.
//

#import "SCHomeTitleBtn.h"
#import "UIView+extension.h"

@implementation SCHomeTitleBtn

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width+5;
    self.width = self.titleLabel.width + self.imageView.width + 5;
}

@end
