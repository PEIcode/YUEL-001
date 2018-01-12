//
//  PSLoginViewController.m
//  LPZ百思不得
//
//  Created by sunny&pei on 2017/8/8.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSLoginViewController.h"

@interface PSLoginViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLine;
- (IBAction)backBtn;
- (IBAction)registerbtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;


@end

@implementation PSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.view endEditing:YES ];
}


- (IBAction)backBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerbtn:(id)sender {
    if (self.leftLine.constant) {
        self.leftLine.constant =0;
        self.registerBtn.selected = NO;
    }else{
        self.leftLine.constant = -self.view.xmg_width;
        self.registerBtn.selected =YES;
    }
    
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
        // 强制刷新 : 让最新设置的约束值马上应用到UI控件上
        // 会刷新到self.view内部的所有子控件
        [self.view layoutIfNeeded];
    }];
}
@end
