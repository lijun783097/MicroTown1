//
//  MTTabBarBadge.h
//  MicroTown
//
//  Created by 镇微 on 2017/8/2.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTTabBarBadge : UIButton

@property (nonatomic, copy) NSString *badgeValue;

@property (nonatomic, assign) NSInteger tabBarItemCount;

@property (nonatomic, strong) UIFont *badgeTitleFont;

@end
