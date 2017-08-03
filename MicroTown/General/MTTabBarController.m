//
//  MTTabBarController.m
//  MicroTown
//
//  Created by 镇微 on 2017/8/3.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import "MTTabBarController.h"
#import "MTTabBar.h"
#import "MTTabBarItem.h"

@interface MTTabBarController () <MTTarBarDelegate>

@property (nonatomic, strong) MTTabBar *mtTabBar;

@end

@implementation MTTabBarController

- (UIColor *)itemTitleColor
{
    if (!_itemTitleColor) {
        
        _itemTitleColor = [UIColor colorWithRed:117/255.0f green:117/255.0f blue:117/255.0f alpha:1.0f];
    }
    return _itemTitleColor;
}

- (UIColor *)selectedItemTitleColor
{
    if (!_selectedItemTitleColor) {
        
        _selectedItemTitleColor = [UIColor colorWithRed:255/255.0f green:185/255.0f blue:35/255.0f alpha:1.0f];
    }
    return _selectedItemTitleColor;
}

- (UIFont *)itemTitleFont
{
    if (!_itemTitleFont) {
        
        _itemTitleFont = [UIFont systemFontOfSize:10.0f];
    }
    return _itemTitleFont;
}

- (UIFont *)badgeTitleFont
{
    if (!_badgeTitleFont) {
        
        _badgeTitleFont = [UIFont systemFontOfSize:11.0f];
    }
    return _badgeTitleFont;
}

- (void)loadView
{
    [super loadView];
    
    self.itemImageRatio = 0.70f;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tabBar addSubview:({
        
        MTTabBar *tabBar = [[MTTabBar alloc] init];
        tabBar.frame = self.tabBar.bounds;
        tabBar.delegate = self;
        
        self.mtTabBar = tabBar;
    })];
}

- (void)removeOriginControls
{
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if ([obj isKindOfClass:[UIControl class]]) {
            
            [obj removeFromSuperview];
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self removeOriginControls];
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
{
    self.mtTabBar.badgeTitleFont = self.badgeTitleFont;
    self.mtTabBar.itemTitleFont = self.itemTitleFont;
    self.mtTabBar.itemImageRatio = self.itemImageRatio;
    self.mtTabBar.itemTitleColor = self.itemTitleColor;
    self.mtTabBar.selectedItemTitleColor = self.selectedItemTitleColor;
    
    self.mtTabBar.tabBarItemCount = viewControllers.count;
    
    [viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UIViewController *VC = obj;
        
        UIImage *selectedImage = VC.tabBarItem.selectedImage;
        VC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [self addChildViewController:VC];
        
        [self.mtTabBar addTabBarItem:VC.tabBarItem];
    }];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    self.mtTabBar.selectedItem.selected = NO;
    self.mtTabBar.selectedItem = self.mtTabBar.tabBarItems[selectedIndex];
    self.mtTabBar.selectedItem.selected = YES;
}

- (void)tabBar:(MTTabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

@end
