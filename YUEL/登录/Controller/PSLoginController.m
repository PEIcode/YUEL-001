//
//  PSLoginController.m
//  YUEL
//
//  Created by sunny&pei on 2018/1/7.
//  Copyright © 2018年 sunny&pei. All rights reserved.
//

#import "PSLoginController.h"

@interface PSLoginController ()
- (IBAction)LoginClick:(UIButton *)sender;

@end

@implementation PSLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)LoginClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
