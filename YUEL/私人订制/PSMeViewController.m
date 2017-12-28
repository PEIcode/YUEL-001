//
//  PSMeViewController.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/6.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSMeViewController.h"
#import "XXViewController.h"
#import "PSHeratView.h"
#import "NTPickerView.h"
NSInteger const heartWidth = 200;
NSInteger const heartHeight = 200;
@interface PSMeViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)PSHeratView *heartView;
@property(nonatomic,strong)UILabel *yuL;
@end

@implementation PSMeViewController

-(void)viewWillAppear:(BOOL)animated{
    [self navgationPusd];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self removeNavPush];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navgationBG"] forBarMetrics:UIBarMetricsDefault];
//    self.title = @"私人订制";
    self.navigationItem.title = @"私人订制";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20.0]}];
    self.view.backgroundColor = [UIColor grayColor];
    
    //设置内容
    [self setupContentView];
}
-(void)setupContentView{
    //提示框
    CGFloat margin = 14;
    CGFloat hintX = 14;
    CGFloat hintY = 14;
    CGFloat hintH = 40;
    CGFloat hintW = PSCREEN_W-28;
    UITextView *hintView = [[UITextView alloc]initWithFrame:CGRectMake(hintX, hintY, hintW, hintH)];
    hintView.backgroundColor = [UIColor whiteColor];
    hintView.text = @"请认真填写需求！";
    hintView.textAlignment = NSTextAlignmentCenter;
    hintView.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:hintView];
    //内容
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(hintX, hintY*2+hintH, hintW, PSCREEN_H-200)];
    contentView.backgroundColor = [UIColor whiteColor];
    
    self.contentView = contentView;
    [self.view addSubview:contentView];
    //策划类型
    [self setupCeHua];
    
    //画个❤️
//    [self drawHeart];
}
-(void)setupCeHua{
    UILabel *cehuaLab = [[UILabel alloc]initWithFrame:CGRectMake(14, 30, 70, 20)];
    cehuaLab.text = @"策划类型:";
    cehuaLab.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:cehuaLab];
    //
    UIButton *gaoBtn = [[UIButton alloc]init];
    gaoBtn.frame = CGRectMake(80, 24, 86, 32);
    gaoBtn.layer.cornerRadius = 10.0;
    gaoBtn.clipsToBounds = YES;
    gaoBtn.backgroundColor = CommonColor;
    [gaoBtn setTitle:@"告白" forState:UIControlStateNormal];
    [self.contentView addSubview:gaoBtn];
    //
    UIButton *qiuBtn = [[UIButton alloc]init];
    qiuBtn.frame = CGRectMake(182, 24, 86, 32);
    qiuBtn.layer.cornerRadius = 10.0;
    qiuBtn.clipsToBounds = YES;
    qiuBtn.backgroundColor = CommonColor;
    [qiuBtn setTitle:@"求婚" forState:UIControlStateNormal];
    [self.contentView addSubview:qiuBtn];
    //
    UIButton *romanticBtn = [[UIButton alloc]init];
    romanticBtn.frame = CGRectMake(284, 24, 86, 32);
    romanticBtn.layer.cornerRadius = 10.0;
    romanticBtn.clipsToBounds = YES;
    romanticBtn.backgroundColor = CommonColor;
    [romanticBtn setTitle:@"浪漫" forState:UIControlStateNormal];
    [self.contentView addSubview:romanticBtn];
    //
    UILabel *sexLab = [[UILabel alloc]initWithFrame:CGRectMake(14, 70, 50, 20)];
    sexLab.text = @"性别";
    sexLab.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:sexLab];
    
    UITextField *sexField = [[UITextField alloc]initWithFrame:CGRectMake(80, 65, 80, 32)];
    sexField.backgroundColor = [UIColor redColor];
    sexField.delegate = self;
    [self.contentView addSubview:sexField];
    //年龄
    UILabel *ageLab = [[UILabel alloc]initWithFrame:CGRectMake(180, 70, 50, 20)];
    ageLab.text =@"年龄";
    [self.contentView addSubview:ageLab];
    //基本情况
    UILabel *inforLab = [[UILabel alloc]initWithFrame:CGRectMake(14, 110, 80, 20 )];
    inforLab.text = @"基本情况:";
    [self.contentView addSubview:inforLab];
    UITextView *infoView = [[UITextView alloc]initWithFrame:CGRectMake(40, 140, 330, 175)];
    infoView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:infoView];
    //问题描述
    UILabel *quesLab = [[UILabel alloc]initWithFrame:CGRectMake(14, 325, 80, 20 )];
    quesLab.text = @"基本问题:";
    [self.contentView addSubview:quesLab];
    UITextView *quesView = [[UITextView alloc]initWithFrame:CGRectMake(40, 350, 330, 175)];
    quesView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:quesView];
    
}
-(void)drawHeart{
    UILabel *yuL = [[UILabel alloc]init];
    yuL.frame = CGRectMake(50, 100, 400, 50);
    //    yuL.center = CGPointMake(100, 200);
//    yuL.text = @"孙瑜，小傻瓜！！！";
    //    [yuL sizeToFit];
    yuL.font = [UIFont systemFontOfSize:30];
    self.yuL = yuL;
    [self.contentView addSubview:yuL];
    self.heartView = [[PSHeratView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-heartWidth)/2, (self.view.frame.size.height-heartHeight)/2, heartWidth, heartHeight)];
    
    self.heartView.rate = 0.5;
    self.heartView.lineWidth = 1;
    self.heartView.strokeColor = [UIColor blackColor];
    self.heartView.fillColor = [UIColor redColor];
    self.heartView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_heartView];
    
    [self loadSlider];
}
- (void)loadSlider
{
    UISlider *valueSlider = [[UISlider alloc]initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, self.view.frame.size.height-150, 300, 50)];
    valueSlider.minimumValue = 0.0;
    valueSlider.maximumValue = 1.0;
    valueSlider.value = 0.5;
    [valueSlider addTarget:self action:@selector(valueChangedAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:valueSlider];
}

- (void)valueChangedAction:(UISlider*)slider
{
    if(slider.value == 1.0){
        self.yuL.text = @"快看，我们的❤️满了";
    }
    self.heartView.rate = slider.value;
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

#pragma mark -UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSArray *array = [NSArray arrayWithObjects:@"男",@"女", nil];
    [NTPickerView showPickerViewAddedTo:self.view
                              dataArray:array
                          confirmAction:^(NSString *string) {
                              NSLog(@"%@",string);
                              textField.text = string;
                              [textField resignFirstResponder];
                          } cancelAction:^{

                          } maskClick:^{

                          }];
}

@end
