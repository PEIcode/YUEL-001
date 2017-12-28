//
//  PSMainTabBarController.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/6.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSMainTabBarController.h"
#import "PSMainViewController.h"
#import "PSMeViewController.h"
#import "PSCreatViewController.h"
#import "PSMessageViewController.h"
@interface PSMainTabBarController ()

@end

@implementation PSMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tabBar setAlpha:0];

    [self.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"icon111"]];
    self.tabBar.translucent = NO;
    [self setupChildVc:[[UINavigationController alloc]initWithRootViewController:[[PSMainViewController alloc] init]] title:@"" imageName:@"home_home" slectImageName:@"home_home_highlighted"];
    [self setupChildVc:[[UINavigationController alloc]initWithRootViewController:[[PSMessageViewController alloc] init]] title:@"" imageName:@"home_message" slectImageName:@"home_message_highlighted"];
    [self setupChildVc:[[UINavigationController alloc]initWithRootViewController:[[PSCreatViewController alloc] init]] title:@"" imageName:@"home_post" slectImageName:@"home_post_highlighted"];
    [self setupChildVc:[[UINavigationController alloc]initWithRootViewController:[[PSMeViewController alloc] init]] title:@"" imageName:@"home_customization" slectImageName:@"home_customization_highlighted"];
//    self.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -6, 0);
    
}

-(void)setupChildVc:(UIViewController *)childVc title:(NSString *)title  imageName:(NSString *)imageN slectImageName:(NSString *)SelctImage{
    childVc.tabBarItem.title = title;
    if (imageN.length) {
        childVc.tabBarItem.image = [UIImage imageNamed:imageN];
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:SelctImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //调整
//        childVc.tabBarItem.imageInsets =UIEdgeInsetsMake(10, 0, -6, 0);
    }
    [self addChildViewController:childVc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
