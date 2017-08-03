//
//  PersonalViewController.m
//  MicroTown
//
//  Created by 镇微 on 2017/8/3.
//  Copyright © 2017年 镇微. All rights reserved.
//

#import "PersonalViewController.h"
#import "CommonHtml5Controller.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClicked:(UIButton *)sender
{
    CommonHtml5Controller *htmlVC = [[CommonHtml5Controller alloc] init];
    
    htmlVC.htmlUrl = @"https://www.microtown.cn/appPage/recomPage1.jsp?fromAccount=1589790";
    
    [self.navigationController pushViewController:htmlVC animated:YES];
    

}

@end
