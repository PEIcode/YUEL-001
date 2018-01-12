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
#import "PSSetViewController.h"
#import "PSNormalCell.h"
#import "PSTopic.h"

@interface PSMainViewController ()
@property(nonatomic,strong)NSMutableArray<PSTopic *> *topics;
@end
static NSString *const cellID = @"topic";
@implementation PSMainViewController

-(void)viewWillAppear:(BOOL)animated{
    [self navgationPusd];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self removeNavPush];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTable];
    
    self.navigationItem.title = @"红豆";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navgationBG"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20.0]}];
    //backBarbutton
//    self.navigationController.navigationBar.backItem
    //left
    UIBarButtonItem  *navLeftItem = [[UIBarButtonItem alloc]initWithTitle:@"我的" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClick)];
    [navLeftItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = navLeftItem;
    //right
    UIBarButtonItem  *navRightItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(setClick)];
    [navRightItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = navRightItem;
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)setupTable
{
//    self.tableView.backgroundColor = XMGCommonBgColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PSNormalCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    // self.tableView.rowHeight = 250;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *cellID = @"topic";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
 
 
//    return cell;
   
        PSNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        cell.topic.type = PSTopicTypeVideo;
        return cell;
    
}


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
#pragma mark - 设置
-(void)setClick{
    PSSetViewController *setVc = [[PSSetViewController alloc]init];
    setVc.hidesBottomBarWhenPushed = YES;
    UIImage *backImage = [UIImage imageNamed:@"setting_leftenter"];
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"setting_leftenter"] style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController.navigationBar setBackIndicatorImage:backImage];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:backImage];
    [self.navigationController pushViewController:setVc animated:YES];
}
@end
