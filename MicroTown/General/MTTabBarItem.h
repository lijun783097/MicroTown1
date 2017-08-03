//
//  MTTabBarItem.h
//  MicroTown
//
//  Created by 镇微 on 2017/8/2.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTTabBarItem : UIButton

@property (nonatomic, strong) UITabBarItem *tabBarItem;

@property (nonatomic, assign) NSInteger tabBarItemCount;

@property (nonatomic, strong) UIColor *itemTitleColor;

@property (nonatomic, strong) UIColor *selectedItemTitleColor;

@property (nonatomic, strong) UIFont *itemTitleFont;

@property (nonatomic, strong) UIFont *badgeTitleFont;

@property (nonatomic, assign) CGFloat itemImageRatio;

- (instancetype)initWithItemImageRatio:(CGFloat)itemImageRatio;

@end
