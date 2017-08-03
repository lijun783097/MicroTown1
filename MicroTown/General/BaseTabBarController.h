//
//  BaseTabBarController.h
//  MicroTown
//
//  Created by 镇微 on 2017/8/3.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import "MTTabBarController.h"

#define kMTBaseTabbarCount 4

/**
 *  Tabbar标题
 */
#define kMTBaseTabbarTitles (@[@"微镇首页", @"小镇市场", @"领投专区", @"个人中心"])

/**
 *  Tabbar正常显示图片
 */
#define kMTBaseTabbarNormalImages (@[@"tabbar_btn_menu_n",\
@"tabbar_btn_market_n",\
@"tabbar_btn_leading_n",\
@"tabbar_btn_pdata_n"\
])

/**
 *  Tabbar选中显示图片
 */
#define kMTBaseTabbarSelectImages (@[@"tabbar_btn_menu_s",\
@"tabbar_btn_market_s",\
@"tabbar_btn_leading_s",\
@"tabbar_btn_pdata_s"\
])
/**
 *  Tabbar Storyboard名称
 */
#define kMTBaseTabbarStoryboardNames (@[@"MTAsserts",\
@"MTMarket",\
@"MTLeadingInvestment",\
@"MTPersonal"])

@interface BaseTabBarController : MTTabBarController

@end
