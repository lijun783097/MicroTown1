//
//  AssertsViewController.m
//  MicroTown
//
//  Created by 镇微 on 2017/8/3.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import "AssertsViewController.h"
#import "CommonHtml5Controller.h"

@interface AssertsViewController ()

@end

@implementation AssertsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    

}
- (IBAction)btnClicked:(UIButton *)sender
{
    CommonHtml5Controller *htmlVC = [[CommonHtml5Controller alloc] init];
    
    htmlVC.htmlUrl = @"https://www.microtown.cn/appPage/recomPage1.jsp?fromAccount=1589790";
    
    [self.navigationController pushViewController:htmlVC animated:YES];

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
