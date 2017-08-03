//
//  MTTabBar.h
//  MicroTown
//
//  Created by 镇微 on 2017/8/3.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTTabBar, MTTabBarItem;

@protocol MTTarBarDelegate <NSObject>

- (void)tabBar:(MTTabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface MTTabBar : UIView

@property (nonatomic, strong) UIColor *itemTitleColor;

@property (nonatomic, strong) UIColor *selectedItemTitleColor;

@property (nonatomic, strong) UIFont *itemTitleFont;

@property (nonatomic, strong) UIFont *badgeTitleFont;

@property (nonatomic, assign) CGFloat itemImageRatio;

@property (nonatomic, assign) NSInteger tabBarItemCount;

@property (nonatomic, strong) MTTabBarItem *selectedItem;

@property (nonatomic, strong) NSMutableArray *tabBarItems;

@property (nonatomic, weak) id<MTTarBarDelegate> delegate;

- (void)addTabBarItem:(UITabBarItem *)item;

@end
