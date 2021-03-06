//
//  MTTabBarItem.m
//  MicroTown
//
//  Created by 镇微 on 2017/8/2.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import "MTTabBarItem.h"
#import "MTTabBarBadge.h"

@interface MTTabBarItem ()

@property (nonatomic, strong) MTTabBarBadge *tabBarBadge;

@end

@implementation MTTabBarItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.tabBarBadge = [[MTTabBarBadge alloc] init];
        [self addSubview:self.tabBarBadge];
    }
    return self;
}

- (instancetype)initWithItemImageRatio:(CGFloat)itemImageRatio
{
    if (self = [super init]) {
        
        self.itemImageRatio = itemImageRatio;
    }
    return self;
}

- (void)setItemTitleFont:(UIFont *)itemTitleFont
{
    _itemTitleFont = itemTitleFont;
    
    self.titleLabel.font = itemTitleFont;
}

- (void)setItemTitleColor:(UIColor *)itemTitleColor
{
    _itemTitleColor = itemTitleColor;
    
    [self setTitleColor:itemTitleColor forState:UIControlStateNormal];
}

- (void)setSelectedItemTitleColor:(UIColor *)selectedItemTitleColor
{
    _selectedItemTitleColor = selectedItemTitleColor;
    
    [self setTitleColor:selectedItemTitleColor forState:UIControlStateSelected];
}

- (void)setBadgeTitleFont:(UIFont *)badgeTitleFont
{
    _badgeTitleFont = badgeTitleFont;
    
    self.tabBarBadge.badgeTitleFont = badgeTitleFont;
}

- (void)setTabBarItemCount:(NSInteger)tabBarItemCount
{
    _tabBarItemCount = tabBarItemCount;
    
    self.tabBarBadge.tabBarItemCount = self.tabBarItemCount;
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem
{
    _tabBarItem = tabBarItem;
    
    [tabBarItem addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"title" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"image" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    [self setTitle:self.tabBarItem.title forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.image forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.selectedImage forState:UIControlStateSelected];
    
    self.tabBarBadge.badgeValue = self.tabBarItem.badgeValue;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0.f;
    CGFloat imageY = 0.f;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * self.itemImageRatio;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0.f;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = contentRect.size.height * self.itemImageRatio + (self.itemImageRatio == 1.0f ? 100.0f : -5.0f);
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)dealloc
{
    [self.tabBarItem removeObserver:self forKeyPath:@"badgeValue"];
    [self.tabBarItem removeObserver:self forKeyPath:@"title"];
    [self.tabBarItem removeObserver:self forKeyPath:@"image"];
    [self.tabBarItem removeObserver:self forKeyPath:@"selectedImage"];
}

@end
