//
//  MTTabBarController.h
//  MicroTown
//
//  Created by 镇微 on 2017/8/3.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTTabBarController : UITabBarController

@property (nonatomic, strong) UIColor *itemTitleColor;

@property (nonatomic, strong) UIColor *selectedItemTitleColor;

@property (nonatomic, strong) UIFont *itemTitleFont;

@property (nonatomic, strong) UIFont *badgeTitleFont;

@property (nonatomic, assign) CGFloat itemImageRatio;

- (void)removeOriginControls;

@end
