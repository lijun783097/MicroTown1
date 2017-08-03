//
//  BaseTabBarController.m
//  MicroTown
//
//  Created by 镇微 on 2017/8/3.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tabBar.translucent = NO;
    
    NSMutableArray *viewCtls = [NSMutableArray arrayWithCapacity:kMTBaseTabbarCount];
    
    for (int i=0; i<kMTBaseTabbarCount; i++) {
        
        UINavigationController *navCtl = (UINavigationController *)[self baseViewControllerFromStoryboardName:kMTBaseTabbarStoryboardNames[i]];
        UIViewController *viewCtl = navCtl.topViewController;
        //        v1.tabBarItem.badgeValue = @"23";
        viewCtl.title = kMTBaseTabbarTitles[i];
        viewCtl.tabBarItem.image = [UIImage imageNamed:kMTBaseTabbarNormalImages[i]];
        viewCtl.tabBarItem.selectedImage = [UIImage imageNamed:kMTBaseTabbarSelectImages[i]];
        [viewCtls addObject:navCtl];
    }
    
    self.viewControllers = viewCtls;
}

- (UIViewController *)baseViewControllerFromStoryboardName:(NSString *)storyboardName {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    
    return viewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
