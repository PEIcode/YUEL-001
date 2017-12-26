//
//  PSMainViewController.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/6.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSMainViewController.h"
#import "PSLeftViewController.h"
#import "XXViewController.h"
#import "LsyDrawerViewController.h"
@interface PSMainViewController ()

@end

@implementation PSMainViewController

-(void)viewWillAppear:(BOOL)animated{
    [self navgationPusd];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self removeNavPush];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navgationitemBG"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20.0]}];
    
    //left
    UIBarButtonItem  *navLeftItem = [[UIBarButtonItem alloc]initWithTitle:@"我的" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClick)];
    [navLeftItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = navLeftItem;
    //right
    UIBarButtonItem  *navRightItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:nil];
    [navRightItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = navRightItem;
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)leftBarButtonItemClick{
    lsy_showLeft(YES);
}
//导航栏切换的通知
-(void)removeNavPush{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"lsy_framework" object:nil];
}
-(void)navgationPusd{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(navigationPush:) name:@"lsy_framework" object:nil];
    
}
-(void)navigationPush:(NSNotification *)notic{
    if ([[notic object] isEqualToString:@"one"]) {
        XXViewController * xxVC = [XXViewController new];
        xxVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:xxVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
