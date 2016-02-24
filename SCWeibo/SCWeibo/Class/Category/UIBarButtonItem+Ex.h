//
//  UIBarButtonItem+Ex.h
//  SCWeibo
//
//  Created by 沈冲 on 16/2/20.
//  Copyright © 2016年 shenchong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Ex)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightedImage:(NSString *)hltImage target:(nullable id)target action:(nullable SEL)action;

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightedImage:(NSString *)hltImage title:(NSString *)title target:(nullable id)target action:(nullable SEL)action;

@end
