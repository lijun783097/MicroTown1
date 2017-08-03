//
//  MTTabBarBadge.m
//  MicroTown
//
//  Created by 镇微 on 2017/8/2.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import "MTTabBarBadge.h"

@implementation MTTabBarBadge

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        self.hidden = YES;
        
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"MTTabBarController" ofType:@"bundle"];
        NSString *imagePath = [bundlePath stringByAppendingPathComponent:@"MTTabBarBadge@2x.png"];
        
        [self setBackgroundImage:[self resizedImageFromMiddle:[UIImage imageWithContentsOfFile:imagePath]] forState:UIControlStateNormal];
    }
    
    return self;
}

- (void)setBadgeTitleFont:(UIFont *)badgeTitleFont
{
    _badgeTitleFont = badgeTitleFont;
    
    self.titleLabel.font = badgeTitleFont;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    self.hidden = !(BOOL)self.badgeValue;
    
    //设置小红点
    CGRect frame = self.frame;
    frame.size.width = 10.0f;
    frame.size.height = frame.size.width;
    frame.origin.x = 56.0f * ([UIScreen mainScreen].bounds.size.width / self.tabBarItemCount) / 375.0f * 4.0f;
    frame.origin.y = 3.0f;
    self.frame = frame;
}

- (UIImage *)resizedImageFromMiddle:(UIImage *)image
{
    return [self resizedImage:image width:0.5f height:0.5f];
}

- (UIImage *)resizedImage:(UIImage *)image width:(CGFloat)width height:(CGFloat)height
{
    return [image stretchableImageWithLeftCapWidth:image.size.width * width topCapHeight:image.size.height * height];
}

@end
