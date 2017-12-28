//
//  NTPickerView.h
//  NTPickerView
//
//  Created by Nineteen on 3/18/17.
//  Copyright © 2017 Nineteen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^confirmButtonAction)(NSString *string);
typedef void(^cancelButtonAction)(void);
typedef void(^maskClickAction)(void);

@interface NTPickerView : UIView

/*
 * 将实现细节封装为一个类方法
 *
 * @param view : 父视图
 * @param array : 数据源
 * @param confirmButtonAction : 点击确认按钮回调的方法
 * @param cancelButtonAction : 点击取消按钮回调的方法
 * @param maskClickAction : 点击背景回调的方法
 */

+ (void)showPickerViewAddedTo :(UIView *)view dataArray: (NSArray *)array
                confirmAction :(confirmButtonAction)confrimButtonAction
                 cancelAction :(cancelButtonAction)cancelButtonAction
                    maskClick :(maskClickAction)maskClickAction;

@end
