//
//  PSTextField.m
//  LPZ百思不得
//
//  Created by sunny&pei on 2017/8/10.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSTextField.h"
static NSString *const PSPlaceholderClolorKey = @"placeholderLabel.textColor";
@interface PSTextField() <UITextFieldDelegate>

@end
@implementation PSTextField
-(void)awakeFromNib{
    [super awakeFromNib];
    self.tintColor = [UIColor whiteColor];
    [self setValue:[UIColor grayColor] forKeyPath:PSPlaceholderClolorKey];
    self.delegate = self;
    
    //通知的运用
//    id obsever = [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidBeginEditingNotification object:self queue:[[NSOperationQueue alloc]init] usingBlock:^(NSNotification * _Nonnull note) {
//        [self setValue:[UIColor whiteColor] forKeyPath:PSPlaceholderClolorKey];
//        //移除通知
//        [[NSNotificationCenter defaultCenter] removeObserver:obsever];
//    }];
}
#pragma mark- UItextField代理方法
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self setValue:[UIColor whiteColor] forKeyPath:PSPlaceholderClolorKey];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self setValue:[UIColor grayColor] forKeyPath:PSPlaceholderClolorKey];
}

@end
