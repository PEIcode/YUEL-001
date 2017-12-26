//
//  PSHoriBtn.h
//  YUEL
//
//  Created by sunny&pei on 2017/12/7.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PSHoriBtn;
typedef void(^PSHoriBtnBlock)(PSHoriBtn *btn);
@interface PSHoriBtn : UIButton
@property (nonatomic,copy) PSHoriBtnBlock block;

+(instancetype)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)titleFont textAlignment:(NSTextAlignment )textAlignment image:(UIImage *)image imageViewContentMode:(UIViewContentMode *)imageViewContentMode ;
@end
