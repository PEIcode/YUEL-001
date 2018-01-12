//
//  PSLeftViewController.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/6.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSLeftViewController.h"
#import "LsyDrawerViewController.h"
#import "PSDrawHeadView.h"
#import "PSDrawCell.h"
#import "PSHoriBtn.h"
#import "PSLoginViewController.h"
#import "PSLoginController.h"

@interface PSLeftViewController ()<UITabBarDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation PSLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 220, self.view.frame.size.width, 472) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.rowHeight = 55;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupIconView];
    UIView *hh = [[UIView alloc]initWithFrame:CGRectMake(0, 680, self.view.frame.size.width, 56)];
    hh.backgroundColor = [UIColor whiteColor];
    //登录注册按钮
    PSHoriBtn *horiBtn = [PSHoriBtn buttonWithType:UIButtonTypeCustom frame:CGRectMake(40, 10, 150, 35) title:@"切换用户" titleColor:[UIColor darkGrayColor] titleFont:18.0 textAlignment:NSTextAlignmentLeft image:[UIImage imageNamed:@"personal_switchuser"] imageViewContentMode:UIViewContentModeCenter];
    horiBtn.block = ^(PSHoriBtn *btn) {
        //点击切换用户的操作；
        PSLoginController *loginVc = [[PSLoginController alloc]init];
        [self presentViewController:loginVc animated:YES completion:nil];
        NSLog(@"-----点击了切换用户");
    };
    [hh addSubview:horiBtn];
    [self.view addSubview:hh];
}
//设置IconView
-(void)setupIconView{
    PSDrawHeadView * headV = [[PSDrawHeadView alloc]init];
    headV.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    headV.backgroundColor = [UIColor colorWithRed:255/255.0 green:138/255.0 blue:128/255.0 alpha:1.0];
    [headV.iconBtn setBackgroundImage:[UIImage imageNamed:@"icon111"] forState:UIControlStateNormal];

    headV.nameLabel.text = @"花花";
    headV.signLabel.text = @"人生若只如初见，何事秋风悲画扇";
    [self.view addSubview:headV];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"celllpz";
    PSDrawCell *cell = (PSDrawCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"PSDrawCell" owner:self options:nil] lastObject];
    }
    switch (indexPath.row) {
        case 0:
            cell.imageL.image = [UIImage imageNamed:@"personal_personalcenter"];
            cell.textLab.text = @"个人中心";
            break;
        case 1:
            cell.imageL.image = [UIImage imageNamed:@"personal_location"];
            cell.textLab.text = @"我的地址";
            break;
        case 2:
            cell.imageL.image = [UIImage imageNamed:@"personal_collection"];
            cell.textLab.text = @"我的收藏";
            break;
        case 3:
            cell.imageL.image = [UIImage imageNamed:@"personal_upload"];
            cell.textLab.text = @"我的上传";
            break;
        case 4:
            cell.imageL.image = [UIImage imageNamed:@"personal_recentcontact"];
            cell.textLab.text = @"我的好友";
            break;
            
        default:
            break;
    }
    
    return cell;
}



@end
